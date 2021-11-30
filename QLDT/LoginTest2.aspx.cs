using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using QLDT.Model;

namespace QLDT
{
    public partial class LoginTest2 : System.Web.UI.Page
    {
        string clientid = "1015114002483-7tr9ranaioghuo19ln407s02krjttma5.apps.googleusercontent.com";
        string clientsecret = "ip8rKHqZfpRYNOcxo35rkOjs";
        string redirection_url = "http://localhost:9997/Login.aspx";
        string url = "https://accounts.google.com/o/oauth2/token";
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["email"] != null)
                    txtUsername.Text = Request.Cookies["email"].Value;
                if (Request.Cookies["password"] != null)
                    txtPassword.Attributes.Add("value", Request.Cookies["password"].Value);
                if (Request.Cookies["email"] != null && Request.Cookies["password"] != null)
                    remember.Checked = true;

                if (Request.QueryString["code"] != null)
                {
                    GetToken(Request.QueryString["code"].ToString());
                }
            }

            if (Session["email"] != null)
            {
                Session.Clear();
            }

            txtPassword.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnLogin.UniqueID + "').click();return false;}} else {return true}; ");

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text;
            string password = txtPassword.Text;

            if (email == "" || password == "")
            {
                lbEmpty.Visible = true;
                txtUsername.Text = "";
                txtPassword.Text = "";
            }
            try
            {
                Controller.SqlDataProvider db = new Controller.SqlDataProvider();
                string query = "select count(*) from Login where email = '" + email + "' and password = '" + password + "'";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int count = int.Parse(cmd.ExecuteScalar().ToString());

                if (count == 1)
                {
                    if (remember.Checked == true)
                    {
                        Response.Cookies["email"].Value = txtUsername.Text;
                        Response.Cookies["password"].Value = txtPassword.Text;
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                    }
                    else
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                    }

                    int au_id = 0;
                    int user_id = 0;
                    string query1 = "select * from Login where email = '" + email + "'";
                    cmd = new SqlCommand(query1, db.conn);
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    while (dr1.Read())
                    {
                        au_id = int.Parse(dr1["au_id"].ToString());
                        user_id = int.Parse(dr1["user_id"].ToString());
                    }
                    dr1.Close();

                    if (au_id == 1)
                    {
                        Session["email"] = email;
                        Response.Redirect("AdminDashboard1.aspx");
                    }
                    else if (au_id == 3)
                    {
                        Session["email"] = email;
                        Response.Redirect("Index2.aspx");
                    }

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
                db.conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void btnGGLogin_Click(object sender, EventArgs e)
        {
            var Googleurl = "https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri=" + redirection_url + "&scope=https://www.googleapis.com/auth/userinfo.email%20https://www.googleapis.com/auth/userinfo.profile&client_id=" + clientid;
            Session["loginWith"] = "google";
            Response.Redirect(Googleurl);
        }

        public string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public void GetToken(string code)
        {
            string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/x-www-form-urlencoded";
            request.Method = "POST";
            UTF8Encoding utfenc = new UTF8Encoding();
            byte[] bytes = utfenc.GetBytes(poststring);
            Stream outputstream = null;
            try
            {
                request.ContentLength = bytes.Length;
                outputstream = request.GetRequestStream();
                outputstream.Write(bytes, 0, bytes.Length);
            }
            catch { }
            var response = (HttpWebResponse)request.GetResponse();
            var streamReader = new StreamReader(response.GetResponseStream());
            string responseFromServer = streamReader.ReadToEnd();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Tokenclass obj = js.Deserialize<Tokenclass>(responseFromServer);
            GetuserProfile(obj.access_token);
        }
        public void GetuserProfile(string accesstoken)
        {
            string url = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=" + accesstoken + "";
            WebRequest request = WebRequest.Create(url);
            request.Credentials = CredentialCache.DefaultCredentials;
            WebResponse response = request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();
            reader.Close();
            response.Close();
            JavaScriptSerializer js = new JavaScriptSerializer();
            Users userinfo = js.Deserialize<Users>(responseFromServer);

            string username = userinfo.username;
            string email = userinfo.email;

            Session["email"] = email;
            db.conn.Open();
            string query = "select count(*) from Login where email = '" + email + "' and au_id = 3";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            int count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();

            if (count == 1)
            {
                Response.Redirect("Index2.aspx");
            }
            else if (count == 0)
            {
                db.conn.Open();
                query = "insert into Students(student_name, student_image) values (N'" + username + "', 'style/images/user_default.png') insert into Login(email, password, user_id, signup_date, au_id) values('" + email + "', '" + CreatePassword(10) + "', SCOPE_IDENTITY(), '" + DateTime.UtcNow.Date + "', '3')";
                cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect("Index2.aspx");
            }
        }
    }
}