using System;
using System.Data;
using System.Data.SqlClient;

namespace QLDT
{
    public partial class Index2 : System.Web.UI.MasterPage
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {        
            if (Session["email"] != null)
            {
                hplLogin.Visible = false;
                hplSignup.Visible = false;

                // get user login and cart infor
                BindStudent(Session["email"].ToString());
                BindCartRepeater(Session["email"].ToString());
             
                db.conn.Open();
                string query = "select count(*) from Courses " +
                "join Cart on Courses.id = Cart.course_id " +
                "join Teachers on Teachers.id = Courses.teacher_id " +
                "join Login on Login.user_id = Cart.student_id " +
                "where Login.email = '" + Session["email"] + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                lblNumCartItem.Text = cmd.ExecuteScalar().ToString();
                db.conn.Close();

                lblNumCartItem2.Text = lblNumCartItem.Text;

                if(int.Parse(lblNumCartItem.Text) > 0)
                {
                    db.conn.Open();
                    query = "select SUM(price) from Courses " +
                    "join Cart on Courses.id = Cart.course_id " +
                    "join Teachers on Teachers.id = Courses.teacher_id " +
                    "join Login on Login.user_id = Cart.student_id " +
                    "where Login.email = '" + Session["email"] + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblTotalPrice.Text = String.Format("{0:c}", float.Parse(cmd.ExecuteScalar().ToString()));
                    db.conn.Close();
                } 
            }

            else if (Session["email"] == null)
            {
                divUser.Visible = false;
            }

            if (!this.IsPostBack)
            {
                this.BindCategoryRepeater();
            }
        }

        private void BindCategoryRepeater()
        {
            string query = "SELECT * FROM Categories";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCategory.DataSource = dt;
            rptCategory.DataBind();
        }

        private void BindStudent(string email)
        {
            db.conn.Open();
            string query = "select * from Login " +
                "join Students on Students.id = Login.user_id where email = '"+ email +"'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblStudentName.Text = dr["student_name"].ToString();
                imgStudent.ImageUrl = dr["student_image"].ToString();
            }
            db.conn.Close();

            lblStudentEmail.Text = email;
            imgStudent2.ImageUrl = imgStudent.ImageUrl;
        }

        private void BindCartRepeater(string email)
        {
            string query = "select * from Cart " +
                "join Courses on Courses.id = Cart.course_id " +
                "join Teachers on Teachers.id = Courses.teacher_id " +
                "join Login on Login.user_id = Cart.student_id " +
                "where Login.email = '"+ email +"'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCart.DataSource = dt;
            rptCart.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchResult.aspx?key=" + txtSearch.Text);
        }
    }
}