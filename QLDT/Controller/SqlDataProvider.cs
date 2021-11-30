using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QLDT.Controller
{
    public class SqlDataProvider
    {
        public SqlConnection conn = null;

        public SqlDataProvider()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLDTConnectionString"].ConnectionString);
        }
        public DataSet getData(string query, string table)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.Fill(ds, table);
            return ds;
        }

        public DataTable getDataDropDown(string query, DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = cmd;
            da.SelectCommand.Connection = conn;
            da.Fill(dt);
            return dt;
        }

        public DataTable getDataRepeater(string query, DataTable dt)
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);           
            return dt;
        }
    }
}