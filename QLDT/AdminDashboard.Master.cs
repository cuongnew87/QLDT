using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLDT.Model;
using System.Data.SqlClient;
using System.Configuration;

namespace QLDT
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //else if (Session["email"] != null)
            //{
            //    Controller.SqlDataProvider db = new Controller.SqlDataProvider();
            //    db.conn.Open();
            //    Users user = new Users();
            //    string query = "select * from Login where email = '" + Session["email"].ToString() + "'";
            //    SqlCommand cmd = new SqlCommand(query, db.conn);
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    while (dr.Read())
            //    {
            //        //   user.id = int.Parse(dr["id"].ToString());
            //        //   user.username = dr["username"].ToString();
            //    }
            //    lbUsername.Text = Session["email"].ToString();
            //    db.conn.Close();
            //}
        }
    }
}