using System;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Web.UI;

namespace QLDT
{
    public partial class Compose : System.Web.UI.Page
    {
        int id = 0;
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null && int.TryParse(Request.Params["id"], out id))
            {
                if (!Page.IsPostBack)
                {
                    db.conn.Open();
                    string query = "select email from Messages where id = '" + id + "'";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    string To = cmd.ExecuteScalar().ToString();
                    db.conn.Close();

                    txtTo.Text = To;
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string email = txtTo.Text;

            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("horsjutsu@gmail.com", "Known", System.Text.Encoding.UTF8);
            mail.Subject = txtSubject.Text;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = compose_textarea.Text;
            if (fileUploader.HasFile)
            {
                string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
            }
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("horsjutsu@gmail.com", "quyenvit123");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
                Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='Compose.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='Compose.aspx';}</script>");
            }
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}