using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Shop_ORM.Facade;
using Shop_ORM.Entity;


namespace ShopProject
{
    public partial class Giris : Form
    {
        public Giris()
        {
            InitializeComponent();
        }

        private void Giris_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Kayıta Git
            GroupBoxChange();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Giriş işlemi
            bool isLogin = Users.Login(textBox1.Text, textBox2.Text);
            if (isLogin)
            {
                this.Hide();
                AnaSayfa ana = new AnaSayfa();
                ana.Show();
            }
            else
            {
                MessageBox.Show("Girdiğiniz TC ya da Şifre Yanlıştır");
            }
        }
        void KayitBoxTemizle()
        {
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
           
        }
        private void button3_Click(object sender, EventArgs e)
        {
            //Kayıt İşlemi Gerçekleştirme
            User user = new User() { userName= textBox3.Text, lastName= textBox4.Text,password=textBox5.Text,email=textBox6.Text,telephone=textBox7.Text,tckNo=textBox8.Text};
            if (!Users.Add(user))
                MessageBox.Show("Ekleme Başarısız");
            KayitBoxTemizle();
        }
        void GroupBoxChange()
        {
            if (groupBox1.Visible == true)
            {
               groupBox1.Visible = false;
               groupBox2.Visible = true;
            }
            else
            {
                groupBox2.Visible = false;
                groupBox1.Visible = true;
            }

        }
        private void button4_Click(object sender, EventArgs e)
        {
            //Girişe git
            GroupBoxChange();
        }


    }
}
