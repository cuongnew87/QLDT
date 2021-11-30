using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace QLDT
{
    public partial class Index21 : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindTeacherRepeater();
                this.BindCourseRepeater();
            }
        }

        private void BindTeacherRepeater()
        {
            string query = "SELECT TOP 4 * FROM Teachers JOIN Login ON Teachers.id = Login.user_id where Login.au_id = 2";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptTeacher.DataSource = dt;
            rptTeacher.DataBind();
        }

        private void BindCourseRepeater()
        {
            string query = "SELECT TOP 5 * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id JOIN Categories ON Categories.id = Courses.category_id ORDER BY NEWID()";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourse.DataSource = dt;
            rptCourse.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text;
            string fullname = txtFullname.Text;
            string email = txtEmail.Text;
            string confirmpassword = txtConfirmPass.Text;

            if (password == "" || fullname == "" || email == "" || confirmpassword == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
            try
            {

                string query = "select count(*) from Login where email = '" + email + "'";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int count = int.Parse(cmd.ExecuteScalar().ToString());

                if (count == 0)
                {
                    if (password == confirmpassword)
                    {
                        query = "insert into Students(student_name, student_image) values (N'" + fullname + "', 'style/images/user_default.png') insert into Login(email, password, user_id, signup_date, au_id) values('" + email + "', '" + password + "', SCOPE_IDENTITY(), '" + DateTime.UtcNow.Date + "', '3')";
                        cmd = new SqlCommand(query, db.conn);
                        cmd.ExecuteNonQuery();
                        Session["email"] = email;
                        Response.Redirect(Request.RawUrl);
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

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string message = txtMessage.Text;
            string fullname = txtContactFullName.Text;
            string email = txtContactEmail.Text;

            if (fullname == "" || email == "" || message == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Failed.')", true);
            }

            try
            {
                string query = "insert into Messages(name, email, message, date_send) values (N'" + fullname + "', '" + email + "', N'" + message + "', '" + DateTime.Now + "')";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();
                Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='index.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected string FormatCourseUrl(int course_id)
        {
            return "SingleCourse.aspx?courseid=" + course_id.ToString();
        }

        protected string FormatUrl(int category_id)
        {
            return "SingleCategory.aspx?categoryid=" + category_id.ToString();
        }

        protected string FormatTeacherUrl(int teacher_id)
        {
            return "SingleTeacher.aspx?teacherid=" + teacher_id.ToString();
        }       
    }
}