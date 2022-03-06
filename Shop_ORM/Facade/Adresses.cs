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
   public class Adresses
    {
        public static DataTable List()
        {
            SqlCommand cmd= new SqlCommand("UserAdressList", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId",Users.userId);
            Tools.Conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
           Tools.Conn.Close();  
            return dt;
        }
        public static bool Add(Adress adress)
        {
            SqlCommand cmd = new SqlCommand("UserAdressAdd", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId", Users.userId);
            cmd.Parameters.AddWithValue("Title", adress.title);
            cmd.Parameters.AddWithValue("City", adress.city);
            cmd.Parameters.AddWithValue("Adress",adress.adress);
            return Tools.ExecuteNonQuery(cmd);
        }
        public static bool Update(Adress adress)
        {
            SqlCommand cmd = new SqlCommand("UserAdressUpdate", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("AdressId",adress.adressId);
            cmd.Parameters.AddWithValue("Title", adress.title);
            cmd.Parameters.AddWithValue("City", adress.city);
            cmd.Parameters.AddWithValue("Adress", adress.adress);
            return Tools.ExecuteNonQuery(cmd);
        }
        public static bool Delete(int adressId)
        {
            SqlCommand cmd = new SqlCommand("UserAdressDelete", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("AdressId", adressId);
            return Tools.ExecuteNonQuery(cmd);
        }
    }
}
