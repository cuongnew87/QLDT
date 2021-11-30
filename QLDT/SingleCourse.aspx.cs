using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int Course_id = 0;
        int Teacher_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["courseid"] != null && int.TryParse(Request.Params["courseid"], out Course_id))
            {
                if (!Page.IsPostBack)
                {
                    string InstructorNote = "";
                    BindArticleRepeater(Course_id);
                    BindCourseListRepeater();
                    BindWhatllLearnRepeater(Course_id);
                    BindCommentRepeater(Course_id);
                    db.conn.Open();
                    string query = "SELECT * FROM Courses JOIN Teachers ON Courses.teacher_id = Teachers.id JOIN Categories ON Categories.id = Courses.category_id WHERE Courses.id = '" + Course_id + "'";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lblCourseName.Text = dr["course_name"].ToString();
                        lblCourseDescription.Text = dr["description"].ToString();
                        lblUpdated.Text = dr["date_update"].ToString();
                        hplTeacherName.Text = dr["teacher_name"].ToString();
                        lblPrice.Text = String.Format("{0:c}", dr["price"]);
                        Teacher_id = int.Parse(dr["teacher_id"].ToString());
                        imgInstructor.ImageUrl = dr["teacher_image"].ToString();
                        lblInstructorJob.Text = dr["job"].ToString();
                        InstructorNote = dr["note"].ToString();
                        lblNumHour2.Text = dr["hours"].ToString();
                        hplCategoryName.Text = dr["category_name"].ToString();
                        hplCategoryName.NavigateUrl = "SingleCategory.aspx?categoryid=" + dr["category_id"].ToString();
                        lblDetailDescription.Text = dr["detail_description"].ToString();
                        lblLanguage.Text = dr["language"].ToString();
                        imgCourse.ImageUrl = dr["course_image"].ToString();
                    }
                    db.conn.Close();

                    db.conn.Open();

                    query = "Select Convert(varchar(10),date_update,103) as Dates from Courses where id = '" + Course_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblUpdated.Text = cmd.ExecuteScalar().ToString();

                    query = "SELECT count(*) FROM Courses JOIN Order_history ON Courses.id = Order_history.course_id where teacher_id = '" + Teacher_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblNumStudents.Text = cmd.ExecuteScalar().ToString();
                    lblInstructorNumStudent.Text = lblNumStudents.Text;

                    query = "Select count(*) from Courses where teacher_id = '" + Teacher_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblInstructorNumCourse.Text = cmd.ExecuteScalar().ToString();

                    query = "Select count(*) from Articles where course_id = '" + Course_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblNumArticle.Text = cmd.ExecuteScalar().ToString();
                    lblNumArticle2.Text = lblNumArticle.Text;

                    query = "Select count(*) from Documents JOIN Articles ON Documents.article_id = Articles.id JOIN Courses ON Courses.id = Articles.course_id where course_id = '" + Course_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    lblNumDocument2.Text = cmd.ExecuteScalar().ToString();

                    db.conn.Close();

                    lblInstructorName.Text = hplTeacherName.Text;
                    imgInstructor.AlternateText = hplTeacherName.Text;
                    lblInstructorNote.Text = InstructorNote.Replace("\r\n", "<br />");
                    instructorLink.HRef = "SingleTeacher.aspx?teacherid=" + Teacher_id;

                    if (Session["email"] != null)
                    {
                        db.conn.Open();
                        query = "Select count(*) from Order_history " +
                            "JOIN Login ON Order_history.student_id = Login.user_id " +
                            "where email = '" + Session["email"] + "' and course_id = '" + Course_id + "'";
                        cmd = new SqlCommand(query, db.conn);
                        int count = (int)cmd.ExecuteScalar();
                        db.conn.Close();

                        if (count > 0)
                        {
                            btnAddtoCart.Visible = false;
                        }

                        db.conn.Open();
                        query = "Select count(*) from WishList " +
                            "JOIN Login ON WishList.student_id = Login.user_id " +
                            "where email = '" + Session["email"] + "' and course_id = '" + Course_id + "'";
                        cmd = new SqlCommand(query, db.conn);
                        count = (int)cmd.ExecuteScalar();
                        db.conn.Close();

                        if (count > 0)
                        {
                            spanWishlist.InnerText = "Wishlisted";
                            svgWishlist.Style.Clear();
                        }
                    }
                }
            }
        }

        private void BindArticleRepeater(int CourseId)
        {
            string query = "SELECT * FROM Articles where course_id = '" + CourseId + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptArticle.DataSource = dt;
            rptArticle.DataBind();
        }

        private void BindWhatllLearnRepeater(int CourseId)
        {
            string query = "SELECT * FROM WhatllLearn where course_id = '" + CourseId + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptWhatllLearn.DataSource = dt;
            rptWhatllLearn.DataBind();
        }

        protected void rptArticle_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var articleid = (HiddenField)e.Item.FindControl("hdfArticle");
            var rptdocument = (Repeater)e.Item.FindControl("rptDocument");


            string query = "SELECT * FROM Documents where article_id = '" + articleid.Value + "'";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptdocument.DataSource = dt;
            rptdocument.DataBind();

            db.conn.Open();
            query = "Select count(*) from Documents where article_id = '" + articleid.Value + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            var lblNumDocument = (Label)e.Item.FindControl("lblCourseContentNumDocument");
            lblNumDocument.Text = cmd.ExecuteScalar().ToString();
            db.conn.Close();
        }

        private void BindCourseListRepeater()
        {
            string query = "SELECT TOP 5 * FROM Courses ORDER BY NEWID()";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptCourseList.DataSource = dt;
            rptCourseList.DataBind();
        }

        private void BindCommentRepeater(int CourseId)
        {
            string query = "SELECT * FROM Comments " +
                "JOIN Courses on Courses.id = Comments.course_id " +
                "JOIN Login on Login.email = Comments.email " +
                "JOIN Students on Students.id = Login.user_id " +
                "Where course_id = '" + CourseId +"' " +
                "Order by comment_date DESC";
            DataTable dt = new DataTable();
            db.getDataRepeater(query, dt);
            rptComment.DataSource = dt;
            rptComment.DataBind();
        }

        protected string FormatTeacherUrl()
        {
            return "SingleTeacher.aspx?teacherid=" + Teacher_id;
        }

        protected void rptCourseList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var courseid = (HiddenField)e.Item.FindControl("hdfCourseListId");

            db.conn.Open();

            string query = "Select count(*) from Order_history where course_id = '" + courseid.Value + "'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            var lblNumStudent = (Label)e.Item.FindControl("lblCourseListNumStudent");
            lblNumStudent.Text = cmd.ExecuteScalar().ToString();

            db.conn.Close();
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                db.conn.Open();
                string query = "select user_id from Login where email = '" + Session["email"] + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int user_id = (int)cmd.ExecuteScalar();
                db.conn.Close();

                db.conn.Open();
                query = "select count(*) from Cart " +
                    "join Login on Login.user_id = Cart.student_id " +
                    "where email = '" + Session["email"] + "' " +
                    "and Cart.course_id = '" + Course_id + "'";
                cmd = new SqlCommand(query, db.conn);
                int count = (int)cmd.ExecuteScalar();
                db.conn.Close();

                if (count == 0)
                {
                    db.conn.Open();
                    query = "select price from Courses where id = '" + Course_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    double price = double.Parse(cmd.ExecuteScalar().ToString());
                    db.conn.Close();

                    db.conn.Open();
                    query = "insert into Cart(course_id,student_id,date_add,cart_price) " +
                        "values('" + Course_id + "', '" + user_id + "', '" + DateTime.Now.ToString() + "','" + price + "')";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    return;
                }
            }
        }

        protected void rptArticle_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var course_id = ((HiddenField)e.Item.FindControl("hdfCart"));
            var documentlink = (HyperLink)e.Item.FindControl("txtCourseListDocumentName");
            if (e.CommandName == "Click")
            {
                if (Session["email"] != null)
                {
                    string query = "Select count(*) from Order_history " +
                         "JOIN Login ON Order_history.student_id = Login.user_id " +
                         "where email = '" + Session["email"] + "' and course_id = '" + Course_id + "'";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    int count = int.Parse(cmd.ExecuteScalar().ToString());

                    if (count == 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
            }
        }

        protected void rptDocument_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var docLink = ((HiddenField)e.Item.FindControl("hdfDocLink"));
            var documentlink = (LinkButton)e.Item.FindControl("txtCourseListDocumentName");
            if (e.CommandName == "Click")
            {
                if (Session["email"] != null)
                {
                    db.conn.Open();
                    string query = "Select count(*) from Order_history " +
                         "JOIN Login ON Order_history.student_id = Login.user_id " +
                         "where email = '" + Session["email"] + "' and course_id = '" + Course_id + "'";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    int count = int.Parse(cmd.ExecuteScalar().ToString());
                    db.conn.Close();

                    if (count == 1)
                    {
                        Response.Redirect(docLink.Value);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
                }
            }
        }

        protected void btnAddWishlist_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                db.conn.Open();
                string query = "select user_id from Login where email = '" + Session["email"] + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                int user_id = (int)cmd.ExecuteScalar();
                db.conn.Close();

                db.conn.Open();
                query = "select count(*) from WishList join Login on Login.user_id = WishList.student_id where course_id = '" + Course_id + "' and email = '" + Session["email"] + "'";
                cmd = new SqlCommand(query, db.conn);
                int count = int.Parse(cmd.ExecuteScalar().ToString());
                db.conn.Close();

                if (count == 0)
                {
                    db.conn.Open();
                    query = "insert into WishList(student_id,course_id,date_add) values('" + user_id + "','" + Course_id + "', '" + DateTime.Now.ToString() + "')";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                    Response.Redirect(Request.RawUrl);
                }
                else if (count == 1)
                {
                    db.conn.Open();
                    query = "delete from WishList where course_id = '" + Course_id + "' and student_id = '" + user_id + "'";
                    cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private AlternateView Mail_Body()
        {
            string url = "http://localhost:9997/SingleCourse.aspx?courseid=" + Course_id;
            string path = Server.MapPath(@"style/images/courses-image2.jpg");
            LinkedResource Img = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
            Img.ContentId = "MyImage";
            string str = @"<html lang=""en"">
                                      <head>    
                                          <meta content=""text/html; charset=utf-8"" http-equiv=""Content-Type"">
                                      </head>
                                      <body>
                                          <div style=""margin: 0 32px"">
                                              <div style=""text-align:left"" >
                                                  <a href='" + url + @"' style=""color:#000;text-decoration:none;font-size:16px;padding-top:5px"" target=""_blank"">
                                                      Your friend spotted this course on Udemy and thought you might like it.
                                                  </a>
                                              </div>
                                          <div style=""background:#fff;font-size:16px;margin-top:30px;padding:15px"">          
                                              <img src=cid:MyImage style=""height:110px;width:200px"" id='img' tabindex=""0"">
                                              <div dir=""ltr"" style=""opacity: 0.01; left: 267px; top: 313.703px;"">
                                                  <div id = "":182"" role=""button"" tabindex=""0"" aria-label=""Tải xuống tệp đính kèm "" data-tooltip-class=""a1V"" data-tooltip=""Tải xuống""></div>
                                              </div>
                                              <div style = ""text-align:left"" >
                                                  <a href='" + url + @"' style=""color:#000;text-decoration:none"" target=""_blank"">
                                                      " + lblCourseName.Text + @"
                                                  </a>
                                                  <span style=""padding-top:5px"">
                                                      " + lblInstructorNumCourse.Text + @" students
                                                  </span>
                                              </div>
                                                  <span style=""padding-top:5px"">
                                                      " + lblCourseDescription.Text + @"
                                                  </span>
                                          </div>
                                          <div style=""color:#000;font-size:15px;line-height:24px;padding-top:40px;text-align:left"">
                                              " + txtShareComment.Text + @"
                                          </div>
                                          <div style=""color:#000;font-size:15px;line-height:24px;padding-top:40px;text-align:left"">
                                              <strong>Udemy is a global marketplace for learning and teaching online</strong> where students are mastering new skills and achieving their goals by learning from an extensive library over 155,000 courses taught by expert instructors.
                                          </div>        
                                          <div>
                                              <a href='" + url + @"' style=""text-decoration:none;background-color:#ec5252;color:#fff;display:inline-block;font-size:15px;margin-top:40px;padding:10px 20px"" target=""_blank"">               
                                                  Check it out                
                                              </a>
                                          </div>       
                                          </div>
                                      </html>";
            AlternateView AV = AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
            AV.LinkedResources.Add(Img);
            return AV;
        }

        protected void btnShareEmail_Click(object sender, EventArgs e)
        {
            if (txtShareEmail.Text != "")
            {
                string email = txtShareEmail.Text;
                MailMessage mail = new MailMessage();
                mail.To.Add(email);
                mail.From = new MailAddress("horsjutsu@gmail.com", "Known", System.Text.Encoding.UTF8);
                mail.Subject = "Your friend thinks you might like this course on Udemy";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;



                mail.IsBodyHtml = true;
                mail.AlternateViews.Add(Mail_Body());

                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("horsjutsu@gmail.com", "quyenvit123");
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                try
                {
                    client.Send(mail);
                    Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='SingleCouse.aspx?courseid='" + Course_id + "'';}</script>");
                }
                catch (Exception ex)
                {
                    Exception ex2 = ex;
                    string errorMessage = string.Empty;
                    while (ex2 != null)
                    {
                        errorMessage += ex2.ToString();
                        ex2 = ex2.InnerException;
                    }
                    Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='SingleCouse.aspx?courseid='" + Course_id + "'';}</script>");
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Share failed.')", true);
            }
        }

        protected void btnSaveComment_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                if (!String.IsNullOrEmpty(txtComment.Text))
                {
                    db.conn.Open();
                    string query = "insert into Comments(course_id, email, comment, comment_date) values('" + Course_id + "','" + Session["email"] + "', '"+ txtComment.Text +"', '" + DateTime.Now.ToString() + "')";
                    SqlCommand cmd = new SqlCommand(query, db.conn);
                    cmd.ExecuteNonQuery();
                    db.conn.Close();

                    txtComment.Dispose();
                    BindCommentRepeater(Course_id);
                }
                else
                {
                    return;
                }
               
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}