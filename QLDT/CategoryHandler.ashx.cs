using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace QLDT
{
    /// <summary>
    /// Summary description for CategoryHandler
    /// </summary>
    public class CategoryHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string term = context.Request["term"] ?? "";
            List<string> listStudentNames = new List<string>();

            string cs = ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetCategoryNames", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@term",
                    Value = term
                });
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    listStudentNames.Add(rdr["category_name"].ToString());
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(listStudentNames));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}