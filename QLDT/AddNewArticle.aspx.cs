using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class AddNewArticle : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getDDCategory();
                getDDCourse(int.Parse(ddlCategory.SelectedValue));
                getDDAticle(int.Parse(ddlCourse.SelectedValue));
                if (ddlArticle.Items.Count <= 0)
                {
                    txtNewArticleName.Text = "";
                    txtNewArticleDescription.Text = "";
                }
                else
                {
                    txtNewArticleName.Text = ddlArticle.SelectedItem.ToString();
                    getArticleDescription(int.Parse(ddlArticle.SelectedValue));
                }
            }
        }

        private void getArticleDescription(int ArticleId)
        {
            db.conn.Open();
            string query = "SELECT description FROM Articles where id = '" + ArticleId + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtNewArticleDescription.Text = dr["description"].ToString();
            }
            db.conn.Close();
        }

        private void getDDCategory()
        {
            string query = "Select * from Categories";

            SqlDataAdapter adpt = new SqlDataAdapter(query, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "category_name";
            ddlCategory.DataValueField = "id";
            ddlCategory.DataBind();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDDCourse(int.Parse(ddlCategory.SelectedValue));
            getDDAticle(int.Parse(ddlCourse.SelectedValue));
            if (ddlArticle.Items.Count <= 0)
            {
                txtNewArticleName.Text = "";
                txtNewArticleDescription.Text = "";
            }
            else
            {
                txtNewArticleName.Text = ddlArticle.SelectedItem.ToString();
                getArticleDescription(int.Parse(ddlArticle.SelectedValue));
            }
        }

        private void getDDCourse(int CategoryId)
        {
            string query = "Select * from Courses where category_id = '" + CategoryId + "'";

            SqlDataAdapter adpt = new SqlDataAdapter(query, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCourse.DataSource = dt;
            ddlCourse.DataTextField = "course_name";
            ddlCourse.DataValueField = "id";
            ddlCourse.DataBind();
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDDAticle(int.Parse(ddlCourse.SelectedValue));
            if (ddlArticle.Items.Count <= 0)
            {
                txtNewArticleName.Text = "";
                txtNewArticleDescription.Text = "";
            }
            else
            {
                txtNewArticleName.Text = ddlArticle.SelectedItem.ToString();
                getArticleDescription(int.Parse(ddlArticle.SelectedValue));
            }
        }

        private void getDDAticle(int CourseId)
        {
            string query = "Select * from Articles where course_id = '" + CourseId + "'";

            SqlDataAdapter adpt = new SqlDataAdapter(query, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlArticle.DataSource = dt;
            ddlArticle.DataTextField = "article_name";
            ddlArticle.DataValueField = "id";
            ddlArticle.DataBind();
        }

        protected void ddlArticle_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtNewArticleName.Text = ddlArticle.SelectedItem.ToString();
            getArticleDescription(int.Parse(ddlArticle.SelectedValue));
        }

        protected void btnAddNewArticle_Click(object sender, EventArgs e)
        {
            if (txtNewArticleName.Text != "" && txtNewArticleDescription.Text != "")
            {
                db.conn.Open();
                string query = "insert into Articles(article_name, description, course_id) " +
                    "values('" + txtNewArticleName.Text + "', '" + txtNewArticleDescription.Text + "', '" + ddlCourse.SelectedValue + "') " +
                    ";SELECT CAST(scope_identity() AS int)";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int article_id = (int)cmd.ExecuteScalar();
                db.conn.Close();
              
                System.IO.Directory.CreateDirectory(MapPath("~/documents/" + ddlCourse.SelectedValue + "/" + article_id));
                //  Response.Redirect(Request.RawUrl);
                getDDAticle(int.Parse(ddlCourse.SelectedValue));
                if (ddlArticle.Items.Count <= 0)
                {
                    txtNewArticleName.Text = "";
                    txtNewArticleDescription.Text = "";
                }
                else
                {
                    txtNewArticleName.Text = ddlArticle.SelectedItem.ToString();
                    getArticleDescription(int.Parse(ddlArticle.SelectedValue));
                }

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Name or Description is empty!')", true);
            }
        }

        protected void btnAddNewDocument_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile && txtNewDocumentName.Text != "" && ddlArticle.Items.Count > 0)
            {
                string path = "documents/" + ddlCourse.SelectedValue + "/" + ddlArticle.SelectedValue;
                if(!System.IO.File.Exists(path))
                {
                    System.IO.Directory.CreateDirectory(MapPath(path));
                }
                string Url = path + "/" + FileUpload.FileName;
                db.conn.Open();
                string query = "select count(*) from Documents where link = '"+ Url +"'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int count = (int)cmd.ExecuteScalar();
                db.conn.Close();

                if(count == 0)
                {
                    FileUpload.SaveAs(Server.MapPath("documents/" + ddlCourse.SelectedValue + "/" + ddlArticle.SelectedValue + "/" + FileUpload.FileName));
                    db.conn.Open();
                    query = "insert into Documents(document_name, link, document_description, article_id) " +
                        "values('" + txtNewDocumentName.Text + "', '" + Url + "', '" + ddlDocumentType.SelectedValue + "', '" + ddlArticle.SelectedValue + "') ";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Duplicate File Name!')", true);
                }
             
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Article, Name or Description is empty!')", true);
            }
        }
    }
}