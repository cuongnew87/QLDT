using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDT
{
    public partial class Profile : System.Web.UI.Page
    {
        Controller.SqlDataProvider db = new Controller.SqlDataProvider();
        int user_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                db.conn.Open();
                string query = "SELECT * FROM Login join Students on Login.user_id = Students.id WHERE email = '" + Session["email"] + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lblUserEmail.Text = dr["email"].ToString();
                    lblUserName.Text = dr["student_name"].ToString();
                    lblAddress.Text = dr["address"].ToString();
                    lblPhone.Text = dr["phone"].ToString();
                    user_id = int.Parse(dr["user_id"].ToString());
                    imgUser.ImageUrl = dr["student_image"].ToString();
                }
                db.conn.Close();

                db.conn.Open();
                query = "Select Convert(varchar(10),dob,101) as Dates from Students join Login on Login.user_id = Students.id where email = '" + Session["email"] + "'";
                cmd = new SqlCommand(query, db.conn);
                lblDob.Text = cmd.ExecuteScalar().ToString();
                db.conn.Close();
            }
            else
            {
                Response.Redirect("Index2.aspx");
            }
        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            if(txtCurrentPassword.Text != "" && txtNewPassword.Text != "" && txtReNewPassword.Text != "") 
            {
                db.conn.Open();
                string query = "select password from Login where email = '"+ Session["email"] +"'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                string oldPassword = cmd.ExecuteScalar().ToString();
                db.conn.Close();

                if(txtCurrentPassword.Text == oldPassword)
                {
                    if(txtNewPassword.Text == txtReNewPassword.Text)
                    {
                        db.conn.Open();
                        query = "update Login set password = '"+ txtNewPassword.Text +"' where email = '" + Session["email"] + "'";
                        cmd = new SqlCommand(query, db.conn);
                        cmd.ExecuteNonQuery();
                        db.conn.Close();

                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Change password success')", true);
                        txtCurrentPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtReNewPassword.Text = "";
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('ReNew pasword not correct!!')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Current password not correct!!')", true);
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Current password, New password or ReNew password empty!!')", true);
            }
        }

        protected void btnSaveChange_Click(object sender, EventArgs e)
        {
                string student_name = txtUserName.Text;
                string address = txtAddress.Text;
                string phone = txtPhone.Text;
                string dob = txtDob.Text;

            if(student_name == "")
            {
                student_name = lblUserName.Text;
            }
            if(address == "")
            {
                address = lblAddress.Text;
            }
            if(phone == "")
            {
                phone = lblPhone.Text;
            }
            if(dob == "")
            {
                dob = lblDob.Text;
            }
             
                db.conn.Open();
                string query = "update Students " +
                    "set student_name = N'"+ student_name +"', " +
                    "address = N'"+ address +"', " +
                    "phone = '"+ phone +"', " +
                    "dob = '"+ dob +"' " +
                    "where id = '" + user_id + "'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();

                Response.Redirect(Request.RawUrl);           
        }

        protected void btnSaveImage_Click(object sender, EventArgs e)
        {
            if (FileUpload.HasFile)
            {
                string path = "style/images/users/" + user_id;
                if (!File.Exists(MapPath(path)))
                {
                    Directory.CreateDirectory(MapPath(path));
                }
                string Url = path + "/" + FileUpload.FileName;
                FileUpload.SaveAs(Server.MapPath(Url));
                db.conn.Open();
                string query = "update Students set student_image = '"+ Url +"' where id = '"+ user_id +"'";
                SqlCommand cmd = new SqlCommand(query, db.conn);
                cmd.ExecuteNonQuery();
                db.conn.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Image field is empty!!')", true);
            }
        }

        protected void btnDeleteAccount_Click(object sender, EventArgs e)
        {
            string path = "style/images/users/" + user_id;
            if (File.Exists(MapPath(path)))
            {
                string[] files = Directory.GetFiles(MapPath(path));

                foreach (string file in files)
                {
                    File.SetAttributes(file, FileAttributes.Normal);
                    File.Delete(file);
                }
                Directory.Delete(MapPath(path),false);
                
            }
            
            db.conn.Open();
            string query = "delete from Cart where student_id = '"+ user_id +"'";
            SqlCommand cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();

            db.conn.Open();
            query = "delete from Order_history where student_id = '" + user_id + "'";
            cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();

            db.conn.Open();
            query = "delete from Login where user_id = '" + user_id + "' and email = '"+ Session["email"] +"'";
            cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();

            db.conn.Open();
            query = "delete from Students where id = '" + user_id + "'";
            cmd = new SqlCommand(query, db.conn);
            cmd.ExecuteNonQuery();
            db.conn.Close();
        
            Session.Clear();
            Response.Redirect("Index2.aspx");
        }     
    }
}