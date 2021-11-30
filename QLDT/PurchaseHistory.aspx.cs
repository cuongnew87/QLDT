using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!IsPostBack)
                {                   
                    LoadData(Session["email"].ToString());
                }
            }else
            {
                Response.Redirect("Index2.aspx");
            }
        }

        private void LoadData(string email)
        {
            string query = "SELECT Order_history.id, Students.student_name, Courses.course_name, Convert(varchar(10),Order_history.date,103) As Date, remark As Price FROM Order_history JOIN Students ON Students.id = Order_history.student_id JOIN Courses ON Courses.id = Order_history.course_id join Login ON Login.user_id = Order_history.student_id where email = '"+ email +"'";
            SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Order_history");
            Grid.DataSource = ds.Tables["Order_history"];
            Grid.DataBind();
        }
    }
}