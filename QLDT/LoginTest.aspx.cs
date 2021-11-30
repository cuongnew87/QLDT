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

namespace QLDT
{
    public partial class LoginTest : System.Web.UI.Page
    {
        string clientid = "1015114002483-7tr9ranaioghuo19ln407s02krjttma5.apps.googleusercontent.com";
        string clientsecret = "ip8rKHqZfpRYNOcxo35rkOjs";
        string redirection_url = "http://localhost:9997/Login.aspx"; // Replace this with your Redirect URL; Your Redirect URL from your developer.google application should match this URL.
        protected string Parameters;
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if ((Session.Contents.Count > 0) && (Session["loginWith"] != null) && (Session["loginWith"].ToString() == "google"))
            //{
            //    try
            //    {
            //        var url = Request.Url.Query;
            //        if (url != "")
            //        {
            //            string queryString = url.ToString();
            //            char[] delimiterChars = { '=' };
            //            string[] words = queryString.Split(delimiterChars);
            //            string code = words[1];

            //            if (code != null)
            //            {
            //                //get the access token 
            //                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create("https://accounts.google.com/o/oauth2/token");
            //                webRequest.Method = "POST";
            //                Parameters = "code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "&grant_type=authorization_code";
            //                byte[] byteArray = Encoding.UTF8.GetBytes(Parameters);
            //                webRequest.ContentType = "application/x-www-form-urlencoded";
            //                webRequest.ContentLength = byteArray.Length;
            //                Stream postStream = webRequest.GetRequestStream();
            //                // Add the post data to the web request
            //                postStream.Write(byteArray, 0, byteArray.Length);
            //                postStream.Close();

            //                WebResponse response = webRequest.GetResponse();
            //                postStream = response.GetResponseStream();
            //                StreamReader reader = new StreamReader(postStream);
            //                string responseFromServer = reader.ReadToEnd();

            //                GooglePlusAccessToken serStatus = JsonConvert.DeserializeObject<GooglePlusAccessToken>(responseFromServer);

            //                if (serStatus != null)
            //                {
            //                    string accessToken = string.Empty;
            //                    accessToken = serStatus.access_token;

            //                    if (!string.IsNullOrEmpty(accessToken))
            //                    {
            //                        // This is where you want to add the code if login is successful.
            //                        // getgoogleplususerdataSer(accessToken);
            //                    }
            //                }

            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        //throw new Exception(ex.Message, ex);
            //        Response.Redirect("Index2.aspx");
            //    }
            //}
        }

        protected void Google_Click(object sender, EventArgs e)
        {
            var Googleurl = "https://accounts.google.com/o/oauth2/auth?response_type=code&redirect_uri=" + redirection_url + "&scope=https://www.googleapis.com/auth/userinfo.email%20https://www.googleapis.com/auth/userinfo.profile&client_id=" + clientid;
            Session["loginWith"] = "google";
            Response.Redirect(Googleurl);
        }

        // Google
        public class GooglePlusAccessToken
        {
            public string access_token { get; set; }
            public string token_type { get; set; }
            public int expires_in { get; set; }
            public string id_token { get; set; }
            public string refresh_token { get; set; }
        }

        private async void getgoogleplususerdataSer(string access_token)
        {
            try
            {
                HttpClient client = new HttpClient();
                var urlProfile = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token;

                client.CancelPendingRequests();
                HttpResponseMessage output = await client.GetAsync(urlProfile);

                if (output.IsSuccessStatusCode)
                {
                    string outputData = await output.Content.ReadAsStringAsync();
                    GoogleUserOutputData serStatus = JsonConvert.DeserializeObject<GoogleUserOutputData>(outputData);

                    if (serStatus != null)
                    {
                        db.conn.Open();
                        string query = "insert into Students(student_name, student_image) values (N'" + serStatus.name + "', 'style/images/user_default.png') insert into Login(email, password, user_id, signup_date, au_id) values('" + serStatus.email + "', '" + 12345 + "', SCOPE_IDENTITY(), '" + DateTime.UtcNow.Date + "', '3')";
                        SqlCommand cmd = new SqlCommand(query, db.conn);
                        cmd.ExecuteNonQuery();
                        db.conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                //catching the exception
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }

        public class GoogleUserOutputData
        {
            public string id { get; set; }
            public string name { get; set; }
            public string given_name { get; set; }
            public string email { get; set; }
            public string picture { get; set; }
        }
    }
}