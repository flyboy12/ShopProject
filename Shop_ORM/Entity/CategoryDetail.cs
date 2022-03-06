using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop_ORM.Entity
{
    public class CategoryDetail
    {
        public int categoryDetailId { get; set; }
        public string categoryDetailName { get; set; }
        public int categoryId { get; set;}
    }
}
