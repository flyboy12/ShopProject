using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace Shop_ORM.Facade
{
     public  class CategoriyDetails
    {
        public static void List(ComboBox comboBox)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("CategoryDetailList", Tools.Conn);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            comboBox.DataSource = dt;
            comboBox.ValueMember = "Kategori Adı";
            comboBox.Text = "";
        }
        public static void SelectedItemList(string categoryName, ComboBox comboBox)
        {
            SqlCommand cmd = new SqlCommand("CategoryFindId", Tools.Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CategoryName", categoryName);
            Tools.Conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                comboBox.Items.Add(dr[0]);
            }
            Tools.Conn.Close();
            comboBox.Text = "";
        }
        public static void CategoryDetailList(string categoryName, ComboBox comboBox)
        {

            if (categoryName == "Hepsi" || categoryName == "")
            {
                List(comboBox);
            }
            else
            {
                string[] category = categoryName.Split(' ');
                SqlCommand cmd = new SqlCommand("CategoryDetailListSearch", Tools.Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CategoryName", category[0]);
                Tools.Conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                if (dr.Read())
                {
                dt.Load(dr);   
                comboBox.DataSource = dt;
                comboBox.ValueMember = "Kategori Adı";
                comboBox.Text = "";
                }
             
             
                Tools.Conn.Close();
            }

        }
    }
}
