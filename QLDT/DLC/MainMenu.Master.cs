using System;
using System.Data.SqlClient;

namespace QLDT.DLC
{
    public partial class MainMenu : System.Web.UI.MasterPage
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                db.conn.Open();
                string query = "select * from Login " +
                    "join Teachers on Teachers.id = Login.user_id " +
                    "where email = '" + Session["email"].ToString() + "' " +
                    "and au_id = 2";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lblTeacherName.Text = dr["teacher_name"].ToString();
                    imgTeacher.ImageUrl = "../" + dr["teacher_image"].ToString();
                }
                db.conn.Close();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
}