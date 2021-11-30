using System;
using System.Data;
using System.Data.SqlClient;

namespace QLDT
{
    public partial class Mailbox : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindRepeater();
                btnRefresh.PostBackUrl = Request.RawUrl;
            }
        }

        private void BindRepeater()
        {
            string query = "SELECT * FROM Messages order by date_send desc";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptMail.DataSource = dt;
            rptMail.DataBind();
        }

        protected string FormatUrl(int id)
        {
            return "ReadMail.aspx?id=" + id.ToString();
        }
    }
}