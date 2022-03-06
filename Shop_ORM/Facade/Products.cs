using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Shop_ORM.Entity;

namespace Shop_ORM.Facade
{
    public class Products
    {
        public static DataTable List()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("ProductAllList", Tools.Conn);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        public static DataTable CategoryDetailSearchList(string categoryName)
        {
        
                string[] category = categoryName.Split(' ');
                SqlCommand cmd = new SqlCommand("ProductSearchCategoryDetail", Tools.Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CategoryDetailName", category[0]);
                Tools.Conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                Tools.Conn.Close();
                return dt;
        }
        public static DataTable CategorySearchList(string categoryName)
        {
          
            if (categoryName == "Hepsi" || categoryName=="")
            {

                return List();
            }
            else
            {
                string[] category = categoryName.Split(' ');
                SqlCommand cmd = new SqlCommand("ProductSearchCategory", Tools.Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CategoryName", category[0]);
                Tools.Conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                Tools.Conn.Close();
                return dt;
            }
         
        }
        public static void UpdateStock(int productId)
        {
            SqlCommand cmd = new SqlCommand("ProductUpdate", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ProductId", productId);
            Tools.ExecuteNonQuery(cmd);         
        }
    }
}
