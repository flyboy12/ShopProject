using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Shop_ORM
{
    class Tools
    {
        private static SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Shop"].ConnectionString);
        public static SqlConnection Conn { get { return _conn; } set { _conn = value; } }
        public static bool ExecuteNonQuery(SqlCommand sql)
        {
            try
            {
                if (sql.Connection.State != ConnectionState.Open)
                {
                    sql.Connection.Open();
                }
                return sql.ExecuteNonQuery() > 0;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (sql.Connection.State != ConnectionState.Closed)
                    sql.Connection.Close();
            }

        }
    }
}
