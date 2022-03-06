using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Shop_ORM.Entity;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Shop_ORM.Facade
{
    public class Categories
    {
        public static void List(ComboBox comboBox)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("CategoryList", Tools.Conn);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DataRow dr = dt.NewRow();
            dr[0] = "Hepsi";
            dt.Rows.InsertAt(dr,0);
            comboBox.DataSource = dt;
            comboBox.ValueMember = "Kategori Adı";
            comboBox.Text = "";
        }
        public static string FindId(string categoryName)
        {
            string categoryId = "";
            SqlCommand cmd = new SqlCommand("CategoryFindId",Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CategoryName",categoryName);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                categoryId = dr[0].ToString();
            }
            return categoryId;
        }
    }
}
