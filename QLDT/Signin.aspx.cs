using QLDT.Model;
using System;
using System.Data.SqlClient;

namespace QLDT
{
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                Session.Clear();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            string fullname = txtFullname.Text;
            string email = txtEmail.Text;
            string confirmpassword = txtConfirm.Text;

            if (password == "" || fullname == "" || email == "" || confirmpassword == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
            try
            {
                Controller.SqlDataProvider db = new Controller.SqlDataProvider();
                string query = "select count(*) from Login where email = '" + email + "'";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int count = int.Parse(cmd.ExecuteScalar().ToString());

                if (count == 0)
                {
                    if (password == confirmpassword)
                    {
                        Users user = new Users();

                        query = "insert into Students(student_name, student_image) values (N'" + fullname + "', 'style/images/user_default.png') insert into Login(email, password, user_id, signup_date, au_id) values('" + email + "', '" + password + "', SCOPE_IDENTITY(), '" + DateTime.UtcNow.Date + "', '3')";
                        cmd = new SqlCommand(query, db.conn);
                        cmd.ExecuteNonQuery();
                        Session["email"] = email;
                        Response.Redirect("Index2.aspx");
                    }
                    else if (password != confirmpassword)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Incorrect confirm password!!!')", true);
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
    }
}