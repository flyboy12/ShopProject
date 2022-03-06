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
  public class Orders
    {
        public static DataTable List()
        {
            SqlCommand cmd = new SqlCommand("OrdersList", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId", Users.userId);
            Tools.Conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            Tools.Conn.Close(); 
            return dt;
        }
        public static bool Add(Order order)
        {
            SqlCommand cmd = new SqlCommand("OrdersAdd",Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId",Users.userId);
            cmd.Parameters.AddWithValue("UserAdressId", order.userAdressId);
            cmd.Parameters.AddWithValue("TotalPrice",order.totalPrice);
            return Tools.ExecuteNonQuery(cmd);
        }
    }
}
