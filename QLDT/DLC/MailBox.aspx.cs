using System;
using System.Data;
using System.Data.SqlClient;

namespace QLDT.DLC
{
    public partial class MailBox : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Teacher_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string query = "select teacher_id from Courses "
               + "join Login on Login.user_id = Courses.teacher_id "
               + "where email = '" + Session["email"] + "' and au_id = 2";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                Teacher_id = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                this.BindRepeater();
                btnRefresh.PostBackUrl = Request.RawUrl;
            }
        }

        private void BindRepeater()
        {
            string query = "select * from Comments "
                + "join Login on Login.email = Comments.email "
                + "join Students on Students.id = Login.user_id "
                + "join Courses on Courses.id = Comments.course_id "
                + "where Courses.teacher_id = '" + Teacher_id + "' "
                + "Order by comment_date DESC";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptMail.DataSource = dt;
            rptMail.DataBind();
        }

        protected string FormatUrl(int id)
        {
            return "Compose.aspx?id=" + id.ToString();
        }
    }
}