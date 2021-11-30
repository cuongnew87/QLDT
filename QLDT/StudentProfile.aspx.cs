using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace QLDT
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int Student_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["studentid"] != null && int.TryParse(Request.Params["studentid"], out Student_id))
            {
                if (!Page.IsPostBack)
                {
                    getStudent(Student_id);
                    BindSkillRepeater(Student_id);
                    BindCommentRepeater(Student_id);
                    BindCourseRepeater(Student_id);
                }
            }
            else
            {
                Student_id = 1;
            }
        }

        private void getStudent(int student_id)
        {
            db.conn.Open();
            string query = "select * from Students "
                + "join Login on Login.user_id = Students.id "
                + "where user_id = '" + student_id + "' and au_id = 3";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtStudentName.Text = dr["student_name"].ToString();
                txtAddress.Text = dr["address"].ToString();
                imgStudent.ImageUrl = "../" + dr["student_image"].ToString();
                txtPhone.Text = dr["phone"].ToString();
                txtEmail.Text = dr["email"].ToString();
                txtSignUpDate.Text = dr["signup_date"].ToString();
            }
            db.conn.Close();

            txtStudentName2.Text = txtStudentName.Text;

            db.conn.Open();

            query = "Select Convert(varchar(10),dob,103) as Dates from Students where id = '" + student_id + "'";
            cmd = new SqlCommand(query, db.conn);
            txtDob.Text = cmd.ExecuteScalar().ToString();

            query = "SELECT TOP 1 Courses.course_name "
                + "FROM Order_history "
                + "join Courses on Courses.id = Order_history.course_id "
                + "join Students on Students.id = Order_history.student_id "
                + "where Students.id = '" + Student_id + "' ORDER BY Order_history.id DESC";
            cmd = new SqlCommand(query, db.conn);
            txtLatestCourse.Text = (string)cmd.ExecuteScalar();

            query = "SELECT count(*) "
                + "FROM Order_history "
                + "join Courses on Courses.id = Order_history.course_id "
                + "join Students on Students.id = Order_history.student_id "
                + "where Students.id = '" + Student_id + "'";
            cmd = new SqlCommand(query, db.conn);
            txtNumFollowCourse.Text = cmd.ExecuteScalar().ToString();

            query = "SELECT count(*) "
              + "FROM Comments "
              + "join Login on Login.email = Comments.email "
              + "where Login.user_id = '" + Student_id + "' and au_id = 3";
            cmd = new SqlCommand(query, db.conn);
            txtNumComment.Text = cmd.ExecuteScalar().ToString();

            db.conn.Close();
        }

        private void BindSkillRepeater(int student_id)
        {
            string query = "select DISTINCT category_name from Categories "
                + "join Courses on Courses.category_id = Categories.id "
                + "join Order_history on Order_history.course_id = Courses.id "
                + "join Students on Students.id = Order_history.student_id "
                + "where student_id = '" + Student_id + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptSkill.DataSource = dt;
            rptSkill.DataBind();
        }

        private void BindCommentRepeater(int student_id)
        {
            string query = "select * from Comments "
                + "join Courses on Courses.id = Comments.course_id "
                + "join Login on Login.email = Comments.email "
                + "join Students on Login.user_id = Students.id "
                + "where user_id = '" + Student_id + "' and au_id = 3";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptComment.DataSource = dt;
            rptComment.DataBind();
        }

        private void BindCourseRepeater(int student_id)
        {
            string query = "select * from Order_history  "
                + "join Courses on Courses.id = Order_history.course_id "
                + "join Login on Login.user_id = Order_history.student_id "
                + "join Students on Login.user_id = Students.id "
                + "where user_id = '" + Student_id + "' and au_id = 3 Order by date DESC";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptOrderHistory.DataSource = dt;
            rptOrderHistory.DataBind();
        }
    }
}