using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QLDT.DLC
{
    public partial class Tables : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int Teacher_id = -1;
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

                this.BindgvStudent();
                this.BindgvCourse();
            }
        }

        private void BindgvStudent()
        {
            string query = "select DISTINCT Students.*, Login.email from Students "
               + "join Order_history on Order_history.student_id = Students.id "
               + "join Courses on Courses.id = Order_history.course_id "
               + "join Login on Login.user_id = Order_history.student_id  "
               + "where Courses.teacher_id = '" + Teacher_id + "' and au_id = 3";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            gvStudent.DataSource = dt;
            gvStudent.DataBind();
        }

        private void BindgvCourse()
        {
            string query = "select * from Courses "
                + "join Categories on Categories.id = Courses.category_id "
                + "where teacher_id = '" + Teacher_id + "' ";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            gvCourse.DataSource = dt;
            gvCourse.DataBind();
        }

        protected string FormatStudentUrl(int student_id)
        {
            return "StudentProfile.aspx?studentid=" + student_id.ToString();
        }

        protected string FormatCourseUrl(int course_id)
        {
            return "EditCourse.aspx?courseid=" + course_id.ToString();
        }

        protected void gvStudent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudent.PageIndex = e.NewPageIndex;
            BindgvStudent();
        }

        protected void gvCourse_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCourse.PageIndex = e.NewPageIndex;
            BindgvCourse();
        }
    }
}