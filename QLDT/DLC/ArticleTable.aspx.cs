using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QLDT.DLC
{
    public partial class ArticleTable : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        static int Teacher_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select teacher_id from Courses "
              + "join Login on Login.user_id = Courses.teacher_id "
              + "where email = '" + Session["email"] + "' and au_id = 2";
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(query, db.conn);
            Teacher_id = int.Parse(cmd.ExecuteScalar().ToString());
            db.conn.Close();

            string sQuery = "SELECT * from Articles JOIN Courses ON Courses.id = Articles.course_id where teacher_id = '"+ Teacher_id +"' ORDER BY course_id";
            GridState.DataSource = getData(sQuery);
            GridState.DataBind();

        }
        protected void GridState_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string id = GridState.DataKeys[e.Row.RowIndex].Value.ToString();
                string sQuery = "SELECT * FROM Documents WHERE article_id='" + id + "'";
                GridView SC = (GridView)e.Row.FindControl("GridCity");
                SC.DataSource = getData(sQuery);
                SC.DataBind();
            }
        }
        private DataTable getData(string sQuery)
        {
            SqlDataAdapter sdt = new SqlDataAdapter();
            DataTable dTable = new DataTable();
            db.conn.Open();
            SqlCommand cmd = new SqlCommand(sQuery, db.conn);
            sdt.SelectCommand = cmd;
            sdt.Fill(dTable);
            db.conn.Close();
            return dTable;
        }

        protected void GridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridState.PageIndex = e.NewPageIndex;
            string sQuery = "SELECT * from Articles JOIN Courses ON Courses.id = Articles.course_id where teacher_id = '" + Teacher_id + "' ORDER BY course_id";
            GridState.DataSource = getData(sQuery);
            GridState.DataBind();
        }
    }
}