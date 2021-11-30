using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QLDT.DLC
{
    public partial class LinkTable : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int id = 0;
        int Teacher_id = -1;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select teacher_id from Courses "
                + "join Login on Login.user_id = Courses.teacher_id "
                + "where email = '" + Session["email"] + "' and au_id = 2";
                db.conn.Open();
                SqlCommand cmd = new SqlCommand(query, db.conn);
                Teacher_id = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                LoadData();
            }
        }

        private void LoadData()
        {
            string query = "SELECT Links.id, Teachers.teacher_name As Teacher, url As Url, url_name As Name " +
                "FROM Links " +
                "JOIN Teachers ON Teachers.id = Links.teacher_id and teacher_id = '"+ Teacher_id +"'";

            SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Links");
            Grid.DataSource = ds.Tables["Links"];
            Grid.DataBind();
        }

        protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUrl")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                id = int.Parse(row.Cells[1].Text);
                txtUrl.Text = row.Cells[3].Text;
                txtName.Text = row.Cells[4].Text;
            }

            if (e.CommandName == "DeleteUrl")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                id = int.Parse(row.Cells[1].Text);

                db.conn.Open();
                string query = "delete from Links where id = '" + id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUrl.Text != "" && txtName.Text != "" && id != 0)
            {
                db.conn.Open();
                string query = "update Links set url = '" + txtUrl.Text + "', url_name = '" + txtName.Text + "' where id = '" + id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Failed.')", true);
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (txtUrl.Text != "" && txtName.Text != "")
            {
                db.conn.Open();
                string query = "insert into Links(teacher_id,url,url_name) values('" + Teacher_id + "', '" + txtUrl.Text + "', '" + txtName.Text + "')";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Failed.')", true);
            }
        }
    }
}