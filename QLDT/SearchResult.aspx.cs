using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class SearchResult : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int totalCount = 0;
        string key = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["key"] != null)
            {
                if (!Page.IsPostBack)
                {
                    key = Request.Params["key"].ToString();

                    db.conn.Open();
                    String sql = "SELECT count(*) FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id where course_name like '%" + key + "%'";
                    SqlCommand cmd = new SqlCommand(sql, db.conn);
                    totalCount = int.Parse(cmd.ExecuteScalar().ToString());
                    db.conn.Close();

                    bindData(0,key);
                    lnkBtnPrev.Enabled = false;
                    txtMax.Text = totalCount.ToString();
                }
            }
        }

        //private void BindCourseListRepeater(string keyword)
        //{
        //    string query = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id where course_name like '%" + keyword + "%'";
        //    DataTable dt = new DataTable();
        //    db.getDataRepeater(query, dt);
        //    rptCourseList.DataSource = dt;
        //    rptCourseList.DataBind();
        //}

        protected void rptCourseList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var courseid = (HiddenField)e.Item.FindControl("hdfCourseListId");

            db.conn.Open();

            string query = "Select count(*) from Articles where course_id = '" + courseid.Value + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            var lblNumDocument = (Label)e.Item.FindControl("lblCourseListNumArticle");
            lblNumDocument.Text = cmd.ExecuteScalar().ToString();

            db.conn.Close();
        }

        public void bindData(int val, string keyword)
        {
            DataSet ds = new DataSet();
            String sql = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id  where course_name like '%" + keyword + "%'";
            db.conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, db.conn);
            adapter.Fill(ds, val, 5, "Courses");
            db.conn.Close();
            rptCourseList.DataSource = ds;
            rptCourseList.DataBind();
        }

        protected void lnkBtnPrev_Click(object sender, EventArgs e)
        {
            key = Request.Params["key"].ToString();
            txtHiddens.Text = Convert.ToString(Convert.ToInt16(txtHiddens.Text) - 5);
            int val = Convert.ToInt16(txtHiddens.Text);
            bindData(val,key);
            if (val <= 0)
            {
                lnkBtnPrev.Enabled = false;
            }
            lnkBtnNext.Enabled = true;
        }
        protected void lnkBtnNext_Click(object sender, EventArgs e)
        {
            key = Request.Params["key"].ToString();
            txtHiddens.Text = Convert.ToString(Convert.ToInt16(txtHiddens.Text) + 5);
            int val = Convert.ToInt16(txtHiddens.Text);
            bindData(val,key);
            if (val >= int.Parse(txtMax.Text))
            {
                lnkBtnNext.Enabled = false;
            }
            lnkBtnPrev.Enabled = true;
        }
    }
}