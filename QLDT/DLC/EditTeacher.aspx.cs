using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace QLDT.DLC
{
    public partial class EditTeacher : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int Teacher_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getTeacher();
            }
        }

        protected void getTeacher()
        {
            db.conn.Open();
            string query = "SELECT user_id FROM Teachers JOIN Login ON Login.user_id = Teachers.id where email = '" + Session["email"] + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            Teacher_id = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();

            db.conn.Open();
            query = "SELECT * FROM Teachers JOIN Login ON Login.user_id = Teachers.id where user_id = '" + Teacher_id + "'";
            cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtTeacherName.Text = dr["teacher_name"].ToString();
                txtAddress.Text = dr["address"].ToString();
                txtDob.Text = Convert.ToDateTime(dr["dob"]).ToString("MM/dd/yyyy");
                txtEmail.Text = dr["email"].ToString();
                txtPhoneNumber.Text = dr["phone"].ToString();
                txtNote.Text = dr["note"].ToString();
                imgTeacher.ImageUrl = "../" + dr["teacher_image"].ToString();
                txtJob.Text = dr["job"].ToString();
            }
            db.conn.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string TeacherName = txtTeacherName.Text;
            string Address = txtAddress.Text;
            string Phone = txtPhoneNumber.Text;
            string Email = txtEmail.Text;
            string Dob = txtDob.Text;
            string Note = txtNote.Text;
            string Url = imgTeacher.ImageUrl;
            string Job = txtJob.Text;
            if (FileUpload.HasFile)
            {
                FileUpload.SaveAs(Server.MapPath("../style/images/" + FileUpload.FileName));
                Url = "style/images/" + FileUpload.FileName;
            }

            db.conn.Open();
            string query = "UPDATE Teachers SET " 
                + "teacher_name = N'" + TeacherName + "', "
                + "job = N'" + Job + "', dob = '" + Dob + "', "
                + "address = N'" + Address + "', " 
                + "phone = '" + Phone + "', " 
                + "note = N'" + Note + "', " 
                + "teacher_image = '" + Url + "' "
                + "WHERE id = '" + Teacher_id + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}