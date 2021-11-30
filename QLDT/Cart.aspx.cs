using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using QLDT.Model;
using PayPal.Api;
using System.Collections.Generic;

namespace QLDT
{
    public partial class Cart : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        int errorCode = 0;
        int student_id = 0;
        double total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            db.conn.Open();
            string query = "select user_id from Login where email='" + Session["email"] + "' and au_id=3";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            student_id = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();

            // check checkout success or not
            if (Request.Params["errorCode"] != null && int.TryParse(Request.Params["errorCode"], out errorCode))
            {
                if (errorCode == 0)
                {
                    //....Do something when success
                    db.conn.Open();
                    query = 
                        "DECLARE @CourseId as INT " +
                        "DECLARE @Price as MONEY " +
                        "SET @MyCounter = 1 " +
                        "WHILE @MyCounter <= (select count(*) from Cart where student_id = '" + student_id + "') " +
                        "BEGIN " +
                        "set @CourseId = (SELECT course_id FROM(select course_id, ROW_NUMBER() OVER(ORDER BY id) AS ROW from Cart where student_id = '" + student_id + "') AS TMP WHERE ROW = @MyCounter) " +
                        "set @Price = (SELECT cart_price FROM(select cart_price, ROW_NUMBER() OVER(ORDER BY id) AS ROW from Cart where student_id = '" + student_id + "') AS TMP WHERE ROW = @MyCounter) " +
                        "insert into Order_history(student_id, course_id, date, remark) values('" + student_id + "', @CourseId, '" + DateTime.Now.ToString() + "',@Price) " +
                        "set @MyCounter = @MyCounter + 1; " +
                        "END";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                    db.conn.Open();
                    query = "delete from Cart where student_id = '" + student_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                }
                else
                {
                    //....Do something when unsuccess
                    Response.Write(@"<script language='javascript'>alert('Thanh toán không thành công!')</script>");

                }
            }

            BindCartRepeater(Session["email"].ToString());

            db.conn.Open();
            query = "select count(*) from Courses " +
            "join Cart on Courses.id = Cart.course_id " +
            "join Teachers on Teachers.id = Courses.teacher_id " +
            "join Login on Login.user_id = Cart.student_id " +
            "where Login.email = '" + Session["email"] + "'";
            cmd = new SqlCommand(query, db.conn);
            lblNumCartItem.Text = cmd.ExecuteScalar().ToString();
            db.conn.Close();

            if (int.Parse(lblNumCartItem.Text) > 0)
            {
                db.conn.Open();
                query = "select SUM(price) * 23000 from Courses " +
                "join Cart on Courses.id = Cart.course_id " +
                "join Teachers on Teachers.id = Courses.teacher_id " +
                "join Login on Login.user_id = Cart.student_id " +
                "where Login.email = '" + Session["email"] + "'";
                cmd = new SqlCommand(query, db.conn);
                total = double.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();
                lblTotalPrice.Text = total.ToString("#,##0.00");
            }
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
            string partnerCode = "MOMORKTP20210511";
            string accessKey = "1q6210xqUtKl4pBn";
            string serectkey = "2Uon2LBOot6kTNSi85j9adZUGU0QzKJ7";
            string orderInfo = "Thanh toán";
            string returnUrl = "http://localhost:9997/Cart.aspx";
            string notifyurl = "https://momo.vn/notify";

            string amount = total.ToString();
            string orderid = Guid.NewGuid().ToString();
            string requestId = Guid.NewGuid().ToString();
            string extraData = "";

            //Before sign HMAC SHA256 signature
            string rawHash = "partnerCode=" +
                partnerCode + "&accessKey=" +
                accessKey + "&requestId=" +
                requestId + "&amount=" +
                amount + "&orderId=" +
                orderid + "&orderInfo=" +
                orderInfo + "&returnUrl=" +
                returnUrl + "&notifyUrl=" +
                notifyurl + "&extraData=" +
                extraData;

            log.Debug("rawHash = " + rawHash);

            MoMoSecurity crypto = new MoMoSecurity();
            //sign signature SHA256
            string signature = crypto.signSHA256(rawHash, serectkey);
            log.Debug("Signature = " + signature);

            //build body json request
            JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }

            };
            log.Debug("Json request to MoMo: " + message.ToString());
            string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());

            JObject jmessage = JObject.Parse(responseFromMomo);
            log.Debug("Return from MoMo: " + jmessage.ToString());
            System.Diagnostics.Process.Start(jmessage.GetValue("payUrl").ToString());

            Response.Redirect("Blank.aspx");
        }

        private void BindCartRepeater(string email)
        {
            string query = "select * from Cart " +
                "join Courses on Courses.id = Cart.course_id " +
                "join Teachers on Teachers.id = Courses.teacher_id " +
                "join Login on Login.user_id = Cart.student_id " +
                "where Login.email = '" + email + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCart.DataSource = dt;
            rptCart.DataBind();
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                var course_id = ((HiddenField)e.Item.FindControl("hdfCart"));

                db.conn.Open();
                string query = "select user_id from Login where email='" + Session["email"] + "' and au_id = 3";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int student_id = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                db.conn.Open();
                query = "delete from Cart where student_id = '" + student_id + "' and course_id = '" + course_id.Value + "'";
                cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnPayPal_Click(object sender, EventArgs e)
        {
            db.conn.Open();
            string query = "select SUM(price) from Courses " +
            "join Cart on Courses.id = Cart.course_id " +
            "join Teachers on Teachers.id = Courses.teacher_id " +
            "join Login on Login.user_id = Cart.student_id " +
            "where Login.email = '" + Session["email"] + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            decimal itemPrice = decimal.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            //  decimal examPaperPrice = 10.00m;

            db.conn.Open();
            query = "select count(*) from Cart Join Login on Login.user_id = Cart.student_id where email='" + Session["email"] + "' and au_id = 3";
            cmd = new SqlCommand(query, db.conn);
            int quantityOfExamPapers = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();

            decimal total = quantityOfExamPapers * itemPrice;

            // Authenticate with Paypal
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            // Get APIContext Object
            var apiContext = new APIContext(accessToken);

            var courseItem = new Item();
            courseItem.name = "Course";
            courseItem.currency = "GBP";
            courseItem.price = itemPrice.ToString("0.00");
            courseItem.sku = "PEPCO5027m15"; //sku is stock keeping unit - e.g. manufacturer code
            courseItem.quantity = quantityOfExamPapers.ToString();

            var transactionAmount = new Amount();
            transactionAmount.currency = "GBP";
            transactionAmount.total = total.ToString("0.00");

            var transaction = new Transaction();
            transaction.description = "Your order of Courses";
            transaction.invoice_number = Guid.NewGuid().ToString(); //this should ideally be the id of a record storing the order
            transaction.amount = transactionAmount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { courseItem }
            };

            var payer = new Payer();
            payer.payment_method = "paypal";

            var redirectUrls = new RedirectUrls();
            redirectUrls.cancel_url = "http://localhost:9997/Cart.aspx?errorCode=1";
            redirectUrls.return_url = "http://localhost:9997/Cart.aspx?errorCode=0";

            var payment = Payment.Create(apiContext, new Payment
            {
                intent = "sale",
                payer = payer,
                transactions = new List<Transaction> { transaction },
                redirect_urls = redirectUrls
            });

            Session["paymentId"] = payment.id;

            foreach (var link in payment.links)
            {
                if (link.rel.ToLower().Trim().Equals("approval_url"))
                {
                    //found the appropriate link, send the user there
                    Response.Redirect(link.href);
                }
            }
        }
    }
}