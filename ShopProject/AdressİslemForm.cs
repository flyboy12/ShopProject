using Shop_ORM;
using Shop_ORM.Facade;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ShopProject
{
    public partial class AdressİslemForm : Form
    {
        public AdressİslemForm()
        {
            InitializeComponent();
        }
        private void AdressİslemForm_Load(object sender, EventArgs e)
        {
           Adress a =  AnaSayfa.a;
            if (AnaSayfa.isUpdate)
            {
                textBox1.Tag = a.adressId;
                textBox1.Text = a.title;
                textBox2.Text = a.city;
                textBox3.Text = a.adress;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Adress a = new Adress() { adressId = AnaSayfa.a.adressId, title = textBox1.Text,city = textBox2.Text,adress = textBox3.Text};
            //Ekleme veya Güncelleme
            if (AnaSayfa.isUpdate)
            {
                Adresses.Update(a);
            }
            else
            {
                Adresses.Add(a);
            }
            AnaSayfa ana= new AnaSayfa();    
            ana.Show();
            this.Hide();
        }
          
        private void button1_Click(object sender, EventArgs e)
        {
            AnaSayfa ana = new AnaSayfa();
            //Vazgeçme
            ana.Show();
            this.Hide();
        }
    }
}
