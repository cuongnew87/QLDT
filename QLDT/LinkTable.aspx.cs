using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class LinkTable : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int id = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                getDDTeacher();
                ddlTeacher.Items.Insert(0, new ListItem("All", "All"));
            }
        }

        private void LoadData()
        {
            string query = "SELECT Links.id, Teachers.teacher_name As Teacher, url As Url, url_name As Name " +
                "FROM Links " +
                "JOIN Teachers ON Teachers.id = Links.teacher_id";

            SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Links");
            Grid.DataSource = ds.Tables["Links"];
            Grid.DataBind();
        }

        private void getDDTeacher()
        {
            string com = "Select * from Teachers";
            SqlDataAdapter adpt = new SqlDataAdapter(com, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "teacher_name";
            ddlTeacher.DataValueField = "id";
            ddlTeacher.DataBind();
        }

        protected void btnSearchCategory_Click(object sender, EventArgs e)
        {
            if (ddlTeacher.SelectedIndex != 0)
            {
                string query = "SELECT Links.id, Teachers.teacher_name As Teacher, url As Url, url_name As Name " +
                "FROM Links JOIN Teachers ON Teachers.id = Links.teacher_id where teacher_id = '"+ ddlTeacher.SelectedValue +"'";

                SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "Links");
                Grid.DataSource = ds.Tables["Links"];
                Grid.DataBind();
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void Grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUrl")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                id = int.Parse(row.Cells[1].Text);
                txtTeacher.Text = row.Cells[2].Text;
                txtUrl.Text = row.Cells[3].Text;
                txtName.Text = row.Cells[4].Text;
            }

            if (e.CommandName == "DeleteUrl")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                id = int.Parse(row.Cells[1].Text);

                db.conn.Open();
                string query = "delete from Links where id = '"+ id +"'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtUrl.Text != "" && txtName.Text != "" && txtTeacher.Text != "" && id != 0)
            {
                db.conn.Open();
                string query = "update Links set url = '"+ txtUrl.Text +"', url_name = '"+ txtName.Text +"' where id = '" + id + "'";
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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (txtUrl.Text != "" && txtName.Text != "" && ddlTeacher.SelectedValue != "All")
            {
                db.conn.Open();
                string query = "insert into Links(teacher_id,url,url_name) values('"+ ddlTeacher.SelectedValue +"', '"+ txtUrl.Text +"', '"+ txtName.Text +"')";
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