using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop_ORM.Entity
{
    public class Product
    {
        public int productId { get; set; }
        public string productName { get; set; }
        public int categoryDetailId { get; set; }
        public string brand { get; set; }
        public string model { get; set; }
        public decimal price { get; set; }
        public string tax { get; set; }
        public int stock { get; set; }


    }
}
