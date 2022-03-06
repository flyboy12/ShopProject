using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop_ORM.Entity
{
    public class User
    {
        public int userId { get; set; }
        public string userName { get; set; }
        public string lastName { get; set; }

        public string password { get; set; }
        public string email { get; set; }
        public string telephone { get; set; }
        public  string tckNo { get; set; }  


    }
}
