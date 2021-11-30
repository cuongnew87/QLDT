using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class MyLearning : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int user_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                db.conn.Open();
                string query = "Select user_id from Login where email = '" + Session["email"] + "' and au_id = 3";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                user_id = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                BindCourseRepeater(user_id);
            }
            else
            {
                Response.Redirect("Index2.aspx");
            }
        }

        private void BindCourseRepeater(int student_id)
        {
            string query = "select * from Order_history " +
                "join Courses on Courses.id = Order_history.course_id " +
                "join Teachers on Teachers.id = Courses.teacher_id " +
                "where student_id = '" + student_id + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourse.DataSource = dt;
            rptCourse.DataBind();
        }
    }
}