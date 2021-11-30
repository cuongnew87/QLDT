using System;
using System.Data.SqlClient;
using System.Data;

namespace QLDT
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            int users = countUser();
            int orders = countOrder();
            int courses = countCourse();
            int messages = countMessage();
            int money = countMoney();

            lbUserRegister.Text = users.ToString();
            lbOrders.Text = orders.ToString();
            lblNumCourse.Text = courses.ToString();
            lblNumMessage.Text = messages.ToString();
            lblTotalMoney.Text = "$ " + money.ToString();

            BindMessageRepeater();
        }

        private int countUser()
        {
            int count = 0;

            string query = "select count(*) from Students";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countOrder()
        {
            int count = 0;

            string query = "select count(*) from Order_history";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countCourse()
        {
            int count = 0;

            string query = "select count(*) from Courses";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countMessage()
        {
            int count = 0;

            string query = "select count(*) from Messages";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private int countMoney()
        {
            int count = 0;

            string query = "select sum(convert (float, Order_history.remark)) from Order_history";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            count = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();
            return count;
        }

        private void BindMessageRepeater()
        {
            string query = "SELECT * FROM Messages";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptMessage.DataSource = dt;
            rptMessage.DataBind();
        }
    }
}