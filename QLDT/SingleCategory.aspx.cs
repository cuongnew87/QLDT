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
    public partial class SingleCategory : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int totalCount = 0;
        int Category_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {          
            if (Request.Params["categoryid"] != null && int.TryParse(Request.Params["categoryid"], out Category_id))
            {
                if (!Page.IsPostBack)
                {
                    // BindCourseListRepeater(Category_id);
                    db.conn.Open();
                    string query = "SELECT * FROM Categories WHERE id = '" + Category_id + "'";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lblCourseName.Text = dr["category_name"].ToString();
                        lblCategoryDescription.Text = dr["category_description"].ToString();
                        lblCategoryDefine.Text = dr["category_define"].ToString();
                    }
                    db.conn.Close();

                    lblCourseName2.Text = lblCourseName.Text;
                    lblCourseName3.Text = lblCourseName.Text;

                    db.conn.Open();
                    String sql = "SELECT count(*) FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id where category_id = '"+ Category_id +"'";
                    cmd = new SqlCommand(sql, db.conn);
                    totalCount = int.Parse(cmd.ExecuteScalar().ToString());
                    db.conn.Close();

                    bindData(0);
                    lnkBtnPrev.Enabled = false;
                    txtMax.Text = totalCount.ToString();

                    db.conn.Open();
                    sql = "SELECT count(*) FROM Order_history JOIN Courses ON Order_history.course_id = Courses.id where category_id = '" + Category_id + "'";
                    cmd = new SqlCommand(sql, db.conn);
                    lblNumLearners.Text = cmd.ExecuteScalar().ToString();
                    db.conn.Close();

                    ddlSort.SelectedIndex = -1;
                }
            }
        }

        private void BindCourseListRepeater(int CategoryId)
        {
            string query = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id where category_id = '" + CategoryId + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourseList.DataSource = dt;
            rptCourseList.DataBind();
        }

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

        public void bindData(int val)
        {
            DataSet ds = new DataSet();
            String sql = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id  where category_id = '" + Category_id + "'";
            db.conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, db.conn);
            adapter.Fill(ds, val, 5, "Courses");
            db.conn.Close();
            rptCourseList.DataSource = ds;
            rptCourseList.DataBind();
        }

        protected void lnkBtnPrev_Click(object sender, EventArgs e)
        {
            txtHiddens.Text = Convert.ToString(Convert.ToInt16(txtHiddens.Text) - 5);
            int val = Convert.ToInt16(txtHiddens.Text);
            bindData(val);
            if (val <= 0)
            {
                lnkBtnPrev.Enabled = false;
            }
            lnkBtnNext.Enabled = true;
        }
        protected void lnkBtnNext_Click(object sender, EventArgs e)
        {
            txtHiddens.Text = Convert.ToString(Convert.ToInt16(txtHiddens.Text) + 5);
            int val = Convert.ToInt16(txtHiddens.Text);
            bindData(val);
            if (val >= int.Parse(txtMax.Text))
            {
                lnkBtnNext.Enabled = false;
            }
            lnkBtnPrev.Enabled = true;
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSort.SelectedValue == "Sort")
            {
                Response.Redirect(Request.RawUrl);
            }
            if (ddlSort.SelectedValue == "Name")
            {
                DataSet ds = new DataSet();
                String sql = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id  where category_id = '" + Category_id + "' ORDER BY course_name ASC";
                db.conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, db.conn);
                adapter.Fill(ds,"Courses");
                db.conn.Close();
                rptCourseList.DataSource = ds;
                rptCourseList.DataBind();
            }
            if (ddlSort.SelectedValue == "Price")
            {
                DataSet ds = new DataSet();
                String sql = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id  where category_id = '" + Category_id + "' ORDER BY price ASC";
                db.conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, db.conn);
                adapter.Fill(ds, "Courses");
                db.conn.Close();
                rptCourseList.DataSource = ds;
                rptCourseList.DataBind();
            }
            if (ddlSort.SelectedValue == "Newest")
            {
                DataSet ds = new DataSet();
                String sql = "SELECT * FROM Courses JOIN Teachers ON Teachers.id = Courses.teacher_id  where category_id = '" + Category_id + "' ORDER BY date_update ASC";
                db.conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, db.conn);
                adapter.Fill(ds, "Courses");
                db.conn.Close();
                rptCourseList.DataSource = ds;
                rptCourseList.DataBind();
            }
        }
    }
}