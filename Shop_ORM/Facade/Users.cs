using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using Shop_ORM.Entity;
namespace Shop_ORM.Facade
{
    public class Users
    {
      public static int userId = 0;
        public static bool Login(string tckNo, string pass)
        {
            SqlCommand cmd = new SqlCommand("UserLogin",Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TckNo", tckNo);
            cmd.Parameters.AddWithValue("Password", pass);
            LoginId(tckNo, pass);
            Tools.Conn.Open();
            SqlDataReader dataReader = cmd.ExecuteReader();
           bool isLogin = dataReader.Read();
            Tools.Conn.Close();
            return isLogin;       
        }
       static void LoginId(string tckNo, string pass)
        {
            SqlCommand cmd = new SqlCommand("UserLogin", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("TckNo", tckNo);
            cmd.Parameters.AddWithValue("Password", pass);
            Tools.Conn.Open();
            SqlDataReader dataReader = cmd.ExecuteReader();
            if (dataReader.Read())
            {
                userId = Convert.ToInt32(dataReader[0]);
            }
            Tools.Conn.Close();
        }
        public static bool Add(User user)
        {
            SqlCommand cmd = new SqlCommand("UserCreate", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Name",user.userName);
            cmd.Parameters.AddWithValue("LastName", user.lastName);
            cmd.Parameters.AddWithValue("Email", user.email);
            cmd.Parameters.AddWithValue("Telephone", user.telephone);
            cmd.Parameters.AddWithValue("TckNo", user.tckNo);
            cmd.Parameters.AddWithValue("Password", user.password);
            return Tools.ExecuteNonQuery(cmd); 
        }
        public static bool Update(User user)
        {
            SqlCommand cmd = new SqlCommand("UserUpdate", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId", userId);
            cmd.Parameters.AddWithValue("Name", user.userName);
            cmd.Parameters.AddWithValue("LastName", user.lastName);
            cmd.Parameters.AddWithValue("Email", user.email);
            cmd.Parameters.AddWithValue("Telephone", user.telephone);
            cmd.Parameters.AddWithValue("TckNo", user.tckNo);
            cmd.Parameters.AddWithValue("Password", user.password);
            return Tools.ExecuteNonQuery(cmd);
        }
        public static bool Delete()
        {
            SqlCommand cmd = new SqlCommand("UserDelete", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId", userId);
            return Tools.ExecuteNonQuery(cmd);
        }
        public static User List()
        { 
            User user = new User();

         
            SqlCommand cmd = new SqlCommand("UserList", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("UserId", userId); 
            Tools.Conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                user.userId = Convert.ToInt32(dr[0]);
                user.userName = dr[1].ToString();
                user.lastName = dr[2].ToString();
                user.email = dr[3].ToString();
                user.telephone = dr[4].ToString();
                user.tckNo = dr[5].ToString();
                user.password = dr[6].ToString();
            }
            Tools.Conn.Close();
            return user ;
        }

    }
}
	
