using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShoppingStoreMVCUsingLinq
{
    public class OrderVal
    {
        [Required]
        public string CustomerComment { get; set; }
    }
    [MetadataType(typeof(OrderVal))]
    public partial class Order
    {
    }
}