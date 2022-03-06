using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Shop_ORM.Entity;
using Shop_ORM.Facade;

namespace ShopProject
{
    public partial class KullaniciYenileme : Form
    {
        public KullaniciYenileme()
        {
            InitializeComponent();
        }
        User u = new User();
        private void KullaniciYenileme_Load(object sender, EventArgs e)
        {
            u = Users.List();
            textBox1.Text = u.userName;
            textBox2.Text = u.lastName;
            textBox3.Text = u.email;
            textBox4.Text = u.telephone;
            textBox5.Text = u.tckNo;
            textBox6.Text = u.password;
        }
       void YenilemeTextBoxTemizleme()
        {
            textBox1.Clear();   
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }
      AnaSayfa ana = new AnaSayfa();
      private void button1_Click(object sender, EventArgs e)
        {
            //Vazgeç
            YenilemeTextBoxTemizleme();
            ana.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            User u1 = new User() { userName = textBox1.Text, lastName = textBox2.Text, email = textBox3.Text,telephone= textBox4.Text,tckNo=textBox5.Text,password=textBox6.Text };
            //KAydetme
            Users.Update(u1);
            YenilemeTextBoxTemizleme();
            ana.Show();
            this.Hide();
        }
    }
}
