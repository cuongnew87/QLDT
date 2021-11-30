using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT.DLC
{
    public partial class Index2 : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int Teacher_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                string query = "select teacher_id from Courses "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where email = '" + Session["email"] + "' and au_id = 2";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                Teacher_id = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                int users = countUser();
                int orders = countOrder();
                int comments = countComment();
                int course = countCourse();
                int wishlist = countWishList();
                int documents = countDocument();

                lblUserRegister.Text = users.ToString();
                lblOrders.Text = orders.ToString();
                lblComments.Text = comments.ToString();
                lblNumCourse.Text = course.ToString();
                lblNumWishList.Text = wishlist.ToString();
                lblCountComment.Text = comments.ToString();
                lblNumDocument.Text = documents.ToString();

                BindMemberRepeater();
                BindCommentRepeater();
                BindCourseRepeater();
                BindOrderRepeater();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        private int countDocument()
        {
            int count = 0;

            string query = "select count(*) from Documents " +
                "join Articles on Articles.id = Documents.article_id " +
                "join Courses on Courses.id = Articles.course_id " +
                "where Courses.teacher_id = '"+ Teacher_id +"'";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countUser()
        {
            int count = 0;

            string query = "select count(DISTINCT student_id) from Students "
               + "join Order_history on Order_history.student_id = Students.id "
               + "join Courses on Courses.id = Order_history.course_id "
               + "join Login on Login.user_id = Order_history.student_id  "
               + "where Courses.teacher_id = '" + Teacher_id + "' and au_id = 3";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countOrder()
        {
            int count = 0;

            string query = "select count(*) from Order_history "
                    +" join Courses on Courses.id = Order_history.course_id "
                    +" where teacher_id = 1";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countComment()
        {
            int count = 0;

            string query = "select count(*) from Comments "
                + "join Courses on Courses.id = Comments.Course_id "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where Login.email = '" + Session["email"] + "'";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countCourse()
        {
            int count = 0;

            string query = "select count(*) from Courses "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where Login.email = '" + Session["email"] + "'";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countWishList()
        {
            int count = 0;

            string query = "select count(*) from WishList "
                + "join Courses on Courses.id = WishList.course_id "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where Login.email = '" + Session["email"] + "'";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private void BindMemberRepeater()
        {
            string query = "select DISTINCT top 8 student_name,student_image,student_id from Students "
                + "join Order_history on Order_history.student_id = Students.id "
                + "join Courses on Courses.id = Order_history.course_id "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where teacher_id = '" + Teacher_id + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptMember.DataSource = dt;
            rptMember.DataBind();
        }

        private void BindCommentRepeater()
        {
            string query = "select * from Comments "
                + "join Login on Login.email = Comments.email "
                + "join Students on Students.id = Login.user_id "
                + "join Courses on Courses.id = Comments.course_id "
                + "where Courses.teacher_id = '" + Teacher_id + "' "
                + "Order by comment_date DESC";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptComment.DataSource = dt;
            rptComment.DataBind();
        }

        private void BindCourseRepeater()
        {
            string query = "select top 5 * from Courses "
                + "where teacher_id = '" + Teacher_id + "' ";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourse.DataSource = dt;
            rptCourse.DataBind();
        }

        private void BindOrderRepeater()
        {
            string query = "select top 5 * from Order_history "
                + "join Courses on Courses.id = Order_history.course_id "
                + "where teacher_id = '"+ Teacher_id +"'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptOrder.DataSource = dt;
            rptOrder.DataBind();
        }
    }
}