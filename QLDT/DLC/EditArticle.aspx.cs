using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT.DLC
{
    public partial class EditArticle : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Course_id = -1;
        string Url = "";
        string poster = "";
        string documentType = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["courseid"] != null && int.TryParse(Request.Params["courseid"], out Course_id))
            {
                if (!Page.IsPostBack)
                {
                    getDDArticles(Course_id);
                    getArticleInfo(int.Parse(ddlArticle.SelectedValue));
                    getDDDocuments(int.Parse(ddlArticle.SelectedValue));
                    if (ddlDocument.Items.Count <= 0)
                    {
                        txtDocumentName.Text = "";
                        FileUpload.Dispose();
                        vdDocument.Visible = false;
                        imgDocument.Visible = false;
                        adDocument.Visible = false;
                        txtDocument.Visible = false;
                    }
                    else
                    {
                        getDocumentInfo(int.Parse(ddlArticle.SelectedValue));
                    }
                }
            }
        }

        private void getDDArticles(int Course_id)
        {
            string com = "Select * from Articles where course_id = '" + Course_id + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlArticle.DataSource = dt;
            ddlArticle.DataTextField = "article_name";
            ddlArticle.DataValueField = "id";
            ddlArticle.DataBind();
        }

        private void getArticleInfo(int ArticleId)
        {
            db.conn.Open();
            string query = "SELECT * FROM Articles JOIN Courses ON Courses.id = Articles.course_id where Articles.id = '" + ArticleId + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtArticleName.Text = dr["article_name"].ToString();
                txtArticleDescription.Text = dr["description"].ToString();
                lblCourseName.Text = "Edit course: " + dr["course_name"].ToString();
            }
            db.conn.Close();
        }

        private void getDDDocuments(int Article_id)
        {
            string com = "Select * from Documents where article_id = '" + Article_id + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, db.conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlDocument.DataSource = dt;
            ddlDocument.DataTextField = "document_name";
            ddlDocument.DataValueField = "id";
            ddlDocument.DataBind();
        }

        private void getDocumentInfo(int DocumentId)
        {
            db.conn.Open();
            string query = "SELECT * FROM Documents where id = '" + DocumentId + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtDocumentName.Text = dr["document_name"].ToString();
                documentType = dr["document_description"].ToString();
                Url = "../" + dr["link"].ToString();
                poster = "../" + dr["poster"].ToString();
            }
            db.conn.Close();

            ddlDocumentType.SelectedValue = documentType;
            getMedia(Url, documentType, poster);
        }

        protected void ddlArticle_SelectedIndexChanged(object sender, EventArgs e)
        {
            getArticleInfo(int.Parse(ddlArticle.SelectedValue));
            getDDDocuments(int.Parse(ddlArticle.SelectedValue));
            if (ddlDocument.Items.Count <= 0)
            {
                txtDocumentName.Text = "";
                FileUpload.Dispose();
            }
            else
            {
                getDocumentInfo(int.Parse(ddlDocument.SelectedValue));
            }
        }

        protected void ddlDocument_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDocumentInfo(int.Parse(ddlDocument.SelectedValue));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.Params["courseid"] != null && int.TryParse(Request.Params["courseid"], out Course_id))
            {
                db.conn.Open();
                string query = "update Articles set article_name = '" + txtArticleName.Text + "', " +
                  "description = '" + txtArticleDescription.Text + "' " +
                  "where course_id = '" + Course_id + "' " +
                  "and id = '" + ddlArticle.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();

                if (FileUpload.HasFile)
                {
                    string root = Server.MapPath("~");
                    string parent = Path.GetDirectoryName(root);
                    FileUpload.SaveAs(parent + "/" + "documents/" + FileUpload.FileName);
                    Url = "documents/" + FileUpload.FileName;
                }

                query = "update Documents set document_name = '" + txtDocumentName.Text + "', " +
                    "link = '" + Url + "', " +
                    "document_description = '" + ddlDocumentType.SelectedValue + "' " +
                    "where article_id = '" + ddlArticle.SelectedValue + "' and " +
                    "id = '" + ddlDocument.SelectedValue + "'";
                cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnDeleteArticle_Click(object sender, EventArgs e)
        {
            db.conn.Open();
            if (ddlDocument.Items.Count > 0)
            {
                string query = "Delete from Documents where article_id = '" + ddlArticle.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();

                query = "Delete from Articles where id = '" + ddlArticle.SelectedValue + "'";
                cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
            }
            else if (ddlDocument.Items.Count == 0)
            {
                string query = "Delete from Articles where id = '" + ddlArticle.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
            }

            db.conn.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnDeleteDocument_Click(object sender, EventArgs e)
        {
            if (ddlDocument.Items.Count > 0)
            {
                db.conn.Open();
                string query = "Delete from Documents where id = '" + ddlDocument.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                return;
            }
        }

        protected void getMedia(string src, string type, string poster)
        {
            if (type == "Video")
            {
                srcVideo.Src = src;
                vdDocument.Poster = poster;
                vdDocument.Visible = true;

                imgDocument.Dispose();
                imgDocument.Visible = false;

                adDocument.Dispose();
                adDocument.Visible = false;

                txtDocument.Dispose();
                txtDocument.Visible = false;
            }
            if (type == "Image")
            {
                imgDocument.ImageUrl = src;
                imgDocument.Visible = true;

                vdDocument.Dispose();
                vdDocument.Visible = false;

                adDocument.Dispose();
                adDocument.Visible = false;

                txtDocument.Dispose();
                txtDocument.Visible = false;
            }
            if (type == "MP3")
            {
                srcMp3.Src = src;
                adDocument.Visible = true;

                vdDocument.Dispose();
                vdDocument.Visible = false;

                imgDocument.Dispose();
                imgDocument.Visible = false;

                txtDocument.Dispose();
                txtDocument.Visible = false;
            }
            if (type == "Document")
            {
                txtDocument.Src = src;
                txtDocument.Visible = true;

                vdDocument.Dispose();
                vdDocument.Visible = false;

                imgDocument.Dispose();
                imgDocument.Visible = false;

                adDocument.Dispose();
                adDocument.Visible = false;
            }
            if (ddlDocument.Items.Count == 0)
            {
                vdDocument.Dispose();
                vdDocument.Visible = false;

                imgDocument.Dispose();
                imgDocument.Visible = false;

                adDocument.Dispose();
                adDocument.Visible = false;

                txtDocument.Dispose();
                txtDocument.Visible = false;
            }
        }
    }
}