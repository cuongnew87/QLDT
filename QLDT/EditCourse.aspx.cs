using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class EditCourse : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Course_id = -1;
        int Listbox_index = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                getCourse();
            }
        }

        public void BindData()
        {
            DataTable dtCategory = new DataTable();
            db.getDataDropDown("spGetAllCategories", dtCategory);
            ddlCategory.DataSource = dtCategory;
            ddlCategory.DataValueField = "id";
            ddlCategory.DataTextField = "category_name";
            ddlCategory.DataBind();

            DataTable dtTeacher = new DataTable();
            db.getDataDropDown("spGetAllTeachers", dtTeacher);
            ddlTeacher.DataSource = dtTeacher;
            ddlTeacher.DataValueField = "id";
            ddlTeacher.DataTextField = "teacher_name";
            ddlTeacher.DataBind();
        }

        protected void getCourse()
        {
            if (Request.Params["courseid"] != null && int.TryParse(Request.Params["courseid"], out Course_id))
            {
                db.conn.Open();
                string query = "SELECT * FROM Courses JOIN Categories ON Courses.category_id = Categories.id JOIN Teachers ON Teachers.id = Courses.teacher_id where Courses.id = '" + Course_id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ddlCategory.SelectedValue = dr["category_id"].ToString();
                    ddlTeacher.SelectedValue = dr["teacher_id"].ToString();
                    txtCourseName.Text = dr["course_name"].ToString();
                    txtHours.Text = dr["hours"].ToString();
                    txtDescription.Text = dr["description"].ToString();
                    txtPrice.Text = dr["price"].ToString();
                    imgCourse.ImageUrl = dr["course_image"].ToString();
                    ddlLanguage.SelectedValue = dr["language"].ToString();
                    txtDetailDescription.Text = dr["detail_description"].ToString();
                }
                db.conn.Close();

                db.conn.Open();
                query = "Select Convert(varchar(10),date_update,101) as Dates from Courses where id = '" + Course_id + "'";
                cmd = new SqlCommand(query, db.conn);
                txtUpdated.Text = cmd.ExecuteScalar().ToString();
                db.conn.Close();

                db.conn.Open();
                query = "Select * from WhatllLearn where course_id = '" + Course_id + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, db.conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                lbWhatllLearn.DataSource = ds;
                lbWhatllLearn.DataTextField = "learn_description";
                lbWhatllLearn.DataValueField = "id";
                lbWhatllLearn.DataBind();
                db.conn.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtWhatllLearn.Text != null)
            {
                lbWhatllLearn.Items.Add(txtWhatllLearn.Text);
                txtWhatllLearn.Text = "";
            }
            else
            {
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int CategoryId = int.Parse(ddlCategory.SelectedValue.ToString());
            int TeacherId = int.Parse(ddlTeacher.SelectedValue.ToString());
            string CourseName = txtCourseName.Text;
            string Hours = txtHours.Text;
            DateTime Update = DateTime.Parse(txtUpdated.Text);
            string Description = txtDescription.Text;
            double Price = double.Parse(txtPrice.Text);
            string Url = imgCourse.ImageUrl;
            string Language = ddlLanguage.SelectedValue;
            string DetailDescription = txtDetailDescription.Text;
            if (FileUpload.HasFile)
            {
                FileUpload.SaveAs(Server.MapPath("style/images/" + FileUpload.FileName));
                Url = "style/images/" + FileUpload.FileName;
            }
            if (Request.Params["courseid"] != null && int.TryParse(Request.Params["courseid"], out Course_id))
            {
                db.conn.Open();
                string query =
                    "UPDATE Courses " +
                    "SET " +
                    "course_name = '" + CourseName + "', " +
                    "category_id = '" + CategoryId + "', " +
                    "date_update = '" + Update + "' , " +
                    "hours = '" + Hours + "', " +
                    "description = N'" + Description + "', " +
                    "price = '" + Price + "', " +
                    "course_image = '" + Url + "', " +
                    "teacher_id = '" + TeacherId + "', " +
                    "language = '" + Language + "', " +
                    "detail_description = @detailDescription" +
                    " WHERE id = '" + Course_id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.Parameters.AddWithValue("@detailDescription", DetailDescription);

                cmd.ExecuteNonQuery();
                db.conn.Close();

                db.conn.Open();
                query = "Delete from WhatllLearn where course_id = '" + Course_id + "'";
                cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                query = @"INSERT INTO WhatllLearn(course_id,learn_description) VALUES ('" + Course_id + "',@param)";
                cmd = new SqlCommand(query, db.conn);
                cmd.Parameters.Add("@param", SqlDbType.NVarChar, 1000);
                db.conn.Open();
                foreach (ListItem item in lbWhatllLearn.Items)
                {
                    cmd.Parameters["@param"].Value = item.Text;
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                db.conn.Dispose();

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                db.conn.Open();
                string query = "INSERT INTO Courses(course_name, category_id, price, hours, description, date_update, course_image, teacher_id, language, detail_description) " +
                    "VALUES(N'" + CourseName + "', '" + CategoryId + "', '" + Price + "', '" + Hours + "', N'" + Description + "', '" + Update + "', '" + Url + "', '" + TeacherId + "', '" + Language + "', N'"+ DetailDescription +"'); " +
                    "SELECT CAST(scope_identity() AS int)";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int course_id = (int)cmd.ExecuteScalar();
                db.conn.Close();

                query = @"INSERT INTO WhatllLearn(course_id,learn_description) VALUES ('" + course_id + "',@param)";
                cmd = new SqlCommand(query, db.conn);
                cmd.Parameters.Add("@param", SqlDbType.NVarChar, 1000);
                db.conn.Open();
                foreach (ListItem item in lbWhatllLearn.Items)
                {
                    cmd.Parameters["@param"].Value = item.Text;
                    cmd.ExecuteNonQuery();
                }
                cmd.Dispose();
                db.conn.Dispose();

                Response.Redirect("Table.aspx");
            }
        }

        protected void lbWhatllLearn_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lbWhatllLearn.Items.Count > 0)
            {
                for (int i = 0; i < lbWhatllLearn.Items.Count; i++)
                {
                    if (lbWhatllLearn.Items[i].Selected)
                    {
                        txtWhatllLearn.Text = lbWhatllLearn.Items[i].Text;
                        Listbox_index = lbWhatllLearn.Items.IndexOf(lbWhatllLearn.SelectedItem);
                        break;
                    }
                }
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (txtWhatllLearn.Text != null)
            {
                lbWhatllLearn.Items.Add(txtWhatllLearn.Text);
                txtWhatllLearn.Text = "";
            }
            else
            {
                return;
            }
        }

        protected void btnEditItem_Click(object sender, EventArgs e)
        {
            if (txtWhatllLearn.Text != "" && lbWhatllLearn.SelectedIndex != -1)
            {
                lbWhatllLearn.Items.RemoveAt(lbWhatllLearn.Items.IndexOf(lbWhatllLearn.SelectedItem));
                lbWhatllLearn.Items.Add(txtWhatllLearn.Text);
                txtWhatllLearn.Text = "";
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Please choose Item to edit')", true);
            }
        }

        protected void brnRemoveItem_Click(object sender, EventArgs e)
        {
            if (txtWhatllLearn.Text != "" && lbWhatllLearn.SelectedIndex != -1)
            {
                lbWhatllLearn.Items.RemoveAt(lbWhatllLearn.Items.IndexOf(lbWhatllLearn.SelectedItem));
                txtWhatllLearn.Text = "";
            }
            else
            {
                return;
            }
        }
    }
}