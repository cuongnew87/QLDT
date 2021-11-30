using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QLDT
{
    public partial class ReadMail : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null && int.TryParse(Request.Params["id"], out id))
            {
                db.conn.Open();
                string query = "select * from Messages where id = '" + id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtSender.Text = dr["email"].ToString();
                    txtDataSend.Text = dr["date_send"].ToString();
                    txtName.Text = dr["name"].ToString();
                    txtMessage.Text = dr["message"].ToString();
                }
                db.conn.Close();
            }
            else
            {
                Response.Redirect("AdminDashboard1.aspx");
            }

            btnRep.PostBackUrl = "Compose.aspx?id=" + id;
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            db.conn.Open();
            string query = "select prev_word from( select lag(id) over(order by id) as prev_word, id from Messages) as t where id = '" + id + "'; ";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            int pre_id = 0;
            if (int.TryParse(cmd.ExecuteScalar().ToString(), out pre_id))
            {
                string url = "ReadMail.aspx?id=" + pre_id;
                Response.Redirect(url);
            }
            else
            {
                return;
            }
            db.conn.Close();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            db.conn.Open();
            string query = "select next_word from( select lead(id) over(order by id) as next_word, id from Messages) as t where id = '" + id + "'; ";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            int pre_id = 0;
            if (int.TryParse(cmd.ExecuteScalar().ToString(), out pre_id))
            {
                string url = "ReadMail.aspx?id=" + pre_id;
                Response.Redirect(url);
            }
            else
            {
                return;
            }
            db.conn.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            db.conn.Open();
            string query = "delete from Messages where id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();
            Response.Redirect("Mailbox.aspx");
        }
    }
}