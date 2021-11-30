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
    public partial class SingleTeacher : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Teacher_id = 0;
        string Note = "";        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["teacherid"] != null && int.TryParse(Request.Params["teacherid"], out Teacher_id))
            {
                db.conn.Open();
                string query = "SELECT * FROM Teachers WHERE id = '" + Teacher_id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lblTeacherName.Text = dr["teacher_name"].ToString();
                    lblTeacherJob.Text = dr["job"].ToString();
                    imgTeacher.ImageUrl = dr["teacher_image"].ToString();
                    imgTeacher.AlternateText = dr["teacher_name"].ToString();
                    Note = dr["note"].ToString();
                }
                db.conn.Close();
                lblNote.Text = Note.Replace("\r\n", "<br />");

                db.conn.Open();
                query = "SELECT count(*) FROM Courses JOIN Order_history ON Courses.id = Order_history.course_id where teacher_id = '" + Teacher_id + "'";
                cmd = new SqlCommand(query, db.conn);
                lblNumStudents.Text = cmd.ExecuteScalar().ToString();

                query = "SELECT count(*) FROM Courses where teacher_id = '" + Teacher_id + "'";
                cmd = new SqlCommand(query, db.conn);
                lblNumCourses.Text = cmd.ExecuteScalar().ToString();
                lblNumMyCourse.Text = lblNumCourses.Text;

                db.conn.Close();

                BindCourseRepeater(Teacher_id);
                BindLinkRepeater(Teacher_id);
            }
            else
            {
                Response.Redirect("Index2.aspx");
            }
        }

        private void BindCourseRepeater(int TeacherId)
        {
            string query = "SELECT * FROM Courses where teacher_id = '"+ TeacherId +"'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourse.DataSource = dt;
            rptCourse.DataBind();
        }

        private void BindLinkRepeater(int TeacherId)
        {
            string query = "SELECT * FROM Links where teacher_id = '" + TeacherId + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptLink.DataSource = dt;
            rptLink.DataBind();
        }
    }
}