using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Shop_ORM;
using Shop_ORM.Entity;
using Shop_ORM.Facade;

namespace ShopProject
{
    public partial class AnaSayfa : Form
    {  public static  Adress a = new Adress();        public static bool isUpdate;
        public AnaSayfa()
        {
            InitializeComponent();
        }
       User u = new User();
       Product product = new Product();
        decimal price = 0;
        List<Product> products = new List<Product>();
       void UserLoad()
        {
           groupBox1.Visible = false;
            u = Users.List();
            label1.Tag = u.userId;
            label1.Text = "Adı Soyadı : "+ u.userName + " " + u.lastName;
            label2.Text = "Email : "+ u.email;
            label3.Text = "Telefon Numarası : " + u.telephone;
            label4.Text = "TC No : " + u.tckNo;
            label5.Text = "Şifre : *********";
            AdressListele();
        }
        void AdressListele()
        {
            dataGridView1.Columns.Clear();
            if (Adresses.List().Rows.Count != 0)
            {
                dataGridView1.DataSource = Adresses.List();
            }
        }
        private void AnaSayfa_Load(object sender, EventArgs e)
        {
         UserLoad();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            //Güncelle
            KullaniciYenileme yenileme = new KullaniciYenileme();
            this.Hide();
            yenileme.Show();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            //Sil : Kullanıcıyı siler ve Uygulamadan çıkış yapar
            if (!Users.Delete())
                MessageBox.Show("Silme işlemi başarısız");
            this.Hide();
            Giris g = new Giris();
            g.Show();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            //Adres Sil
          bool isDelete = Adresses.Delete(a.adressId);
            if (!isDelete)
            { 
                MessageBox.Show("Silme İşlemi Gerçekleşmedi");
            }
            groupBox1.Visible = false;
            AdressListele();
        }
        private void button5_Click(object sender, EventArgs e)
        {
            //Adres Güncelle
            isUpdate = true;
            AdressİslemForm adressİslemForm = new AdressİslemForm();
            adressİslemForm.Show();
            this.Hide();
            groupBox1.Visible = false;
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //Tıklandığı zaman groupbox1 açılacak ve seçili öğeyi dolduracak
            groupBox1.Visible = true;
            DataGridViewRow row = dataGridView1.CurrentRow;
               
                a.userId = Users.userId;
                a.adressId= Convert.ToInt32(row.Cells[0].Value);
                a.title = row.Cells[1].Value.ToString();
                a.city = row.Cells[2].Value.ToString();
                a.adress =  row.Cells[3].Value.ToString();
           

        }
        private void button3_Click(object sender, EventArgs e)
        {
            isUpdate = false;
            AdressİslemForm adressİslemForm = new AdressİslemForm();
            adressİslemForm.Show();
            this.Hide();
            groupBox1.Visible=false;
            //Adres Ekle
        }

        private void button6_Click(object sender, EventArgs e)
        {
            //Satın Alma Orders oluşturma Product güncelleme
            if(comboBox3.Text != ""&&price!=0)
            {
               foreach(Product pr in products)
                {
                    Products.UpdateStock(pr.productId);
                }
                
                Order order = new Order() { totalPrice=price, userId = Users.userId, userAdressId =5 };
                Orders.Add(order);
                dataGridView3.DataSource = Orders.List();
                MessageBox.Show("Ürün ALınmıştır.");
            }
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
           if( tabControl1.SelectedIndex == 0 )
            {
                UserLoad();
            }
           else if( tabControl1.SelectedIndex == 1 )
            {
                comboBox3.DataSource = Adresses.List();
                comboBox3.ValueMember = "Başlık";
                dataGridView2.DataSource = Products.List();
                Categories.List(comboBox1);
                CategoriyDetails.List(comboBox2);
            }
           else if(tabControl1.SelectedIndex == 2 )
                dataGridView3.DataSource = Orders.List();
        }


        private void button7_Click(object sender, EventArgs e)
        {
           listBox1.Items.Clear();  
            products.Clear();
            price = 0;
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
           DataGridViewRow row = dataGridView2.CurrentRow;
           product.productId = Convert.ToInt32(row.Cells[0].Value);
           product.productName = row.Cells[1].Value.ToString();
           product.brand = row.Cells[4].Value.ToString();
           product.model =row.Cells[5].Value.ToString();
           product.price = Convert.ToDecimal(row.Cells[6].Value);
            product.stock = Convert.ToInt32(row.Cells[7].Value);
             
        }

        private void button9_Click(object sender, EventArgs e)
        {
         products.Add(product);
         listBox1.Items.Add("Ürün Adı : "+product.productName);
         listBox1.Items.Add("Fiyat : "+ product.price);
         price += product.price;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = comboBox1.Text;
            dataGridView2.DataSource = Products.CategorySearchList(comboBox1.Text);
            if (comboBox1.Text.Length ==0 || comboBox1.Text == null)
            {
            CategoriyDetails.CategoryDetailList("Hepsi",comboBox2);
            }
            else
            {
                CategoriyDetails.CategoryDetailList(category, comboBox2);

            }


        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataGridView2.DataSource = Products.CategoryDetailSearchList(comboBox2.Text);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            dataGridView2.DataSource = Products.List();
            Categories.List(comboBox1);
            CategoriyDetails.List(comboBox2);
        }
    }
}
