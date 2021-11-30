using System;
using System.Data;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class Table : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindgvStudent();
                this.BindgvTeacher();
                this.BindgvCourse();
            }
        }

        private void BindgvStudent()
        {
            string query = "SELECT * FROM Students JOIN Login ON Students.id = Login.user_id where Login.au_id = 3";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            gvStudent.DataSource = dt;
            gvStudent.DataBind();
        }

        private void BindgvTeacher()
        {
            string query = "SELECT * FROM Teachers JOIN Login ON Teachers.id = Login.user_id where Login.au_id = 2";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            gvTeacher.DataSource = dt;
            gvTeacher.DataBind();
        }

        private void BindgvCourse()
        {
            string query = "SELECT * FROM Courses JOIN Categories ON Courses.category_id = Categories.id JOIN Teachers ON Teachers.id = Courses.teacher_id";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            gvCourse.DataSource = dt;
            gvCourse.DataBind();
        }

        protected string FormatStudentUrl(int student_id)
        {
            return "StudentProfile.aspx?studentid=" + student_id.ToString();
        }

        protected string FormatTeacherUrl(int teacher_id)
        {
            return "EditTeacher.aspx?teacherid=" + teacher_id.ToString();
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

        protected void gvTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeacher.PageIndex = e.NewPageIndex;
            BindgvTeacher();
        }

        protected void gvCourse_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCourse.PageIndex = e.NewPageIndex;
            BindgvCourse();
        }
    }
}