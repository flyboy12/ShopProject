using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop_ORM.Entity
{
    public class Order
    {
        public int orderId { get; set; }
        public int userId { get; set; }
        public int userAdressId { get; set; }
        public string createDate { get; set; }
        public decimal totalPrice { get; set; }

    }
}
