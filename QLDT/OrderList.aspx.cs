using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class OrderList : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Student_id = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                getDDCategory();
                ddlCategory.Items.Insert(0, new ListItem("All", "All Items"));
            }
        }

        private void LoadData()
        {
            string query = "";
            string total_order_query = "";
            string total_money_query = "";

            query = "SELECT Order_history.id, student_name As Student, email As Email, course_name As Course, date As Date, remark As Price " +
            "FROM Order_history " +
            "JOIN Students ON Students.id = Order_history.student_id " +
            "JOIN Courses ON Courses.id = Order_history.course_id " +
            "JOIN Login ON Order_history.student_id = Login.user_id " +
            "where au_id = 3";

            total_order_query = "SELECT count(*)" +
            "FROM Order_history " +
            "JOIN Students ON Students.id = Order_history.student_id " +
            "JOIN Login ON Order_history.student_id = Login.user_id " +
            "where au_id = 3";

            total_money_query = "SELECT sum(convert (float, Order_history.remark)) FROM Order_history";

            SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Order_history");
            Grid.DataSource = ds.Tables["Order_history"];
            Grid.DataBind();

            db.conn.Open();
            SqlCommand cmd = new SqlCommand(total_order_query, db.conn);
            txtTotalOrder.Text = cmd.ExecuteScalar().ToString();
            db.conn.Close();

            db.conn.Open();
            cmd = new SqlCommand(total_money_query, db.conn);
            txtTotalMoney.Text = "$ " + cmd.ExecuteScalar().ToString();
            db.conn.Close();
        }

        private void getDDCategory()
        {
            string com = "Select * from Categories";
            SqlDataAdapter adpt = new SqlDataAdapter(com, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "category_name";
            ddlCategory.DataValueField = "id";
            ddlCategory.DataBind();
        }

        protected void btnSearchCategory_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex != 0)
            {
                string query = "SELECT Order_history.id, student_name As Student, email As Email, course_name As Course, date As Date, remark As Price " +
                   "FROM Order_history " +
                   "JOIN Students ON Students.id = Order_history.student_id " +
                   "JOIN Courses ON Courses.id = Order_history.course_id " +
                   "JOIN Login ON Order_history.student_id = Login.user_id " +
                   "where category_id = '" + ddlCategory.SelectedValue + "' and au_id = 3";
                SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "Order_history");
                Grid.DataSource = ds.Tables["Order_history"];
                Grid.DataBind();

                string total_order_query = "SELECT count(*)" +
                  "FROM Order_history " +
                  "JOIN Students ON Students.id = Order_history.student_id " +
                  "JOIN Courses ON Courses.id = Order_history.course_id " +
                  "JOIN Login ON Order_history.student_id = Login.user_id " +
                  "where au_id = 3 and category_id = '" + ddlCategory.SelectedValue + "'";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(total_order_query, db.conn);
                txtTotalOrder.Text = cmd.ExecuteScalar().ToString();
                db.conn.Close();

                string total_money_query = "select sum(convert (float, Order_history.remark)) " +
               "FROM Order_history " +
               "JOIN Students ON Students.id = Order_history.student_id " +
               "JOIN Courses ON Courses.id = Order_history.course_id " +
               "JOIN Login ON Order_history.student_id = Login.user_id " +
               "where au_id = 3 and category_id = '" + ddlCategory.SelectedValue + "'";
                db.conn.Open();
                cmd = new SqlCommand(total_money_query, db.conn);
                txtTotalMoney.Text = "$ " + cmd.ExecuteScalar().ToString();
                db.conn.Close();
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}