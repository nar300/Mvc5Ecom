﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShoppingStoreMVCUsingLinq
{
    public partial class SubCategory
    {
        public string CreatedByUser
        {
            get;
            set;
        }
        public string UpdatedByUser
        {
            get;
            set;
        }
        public string CategoryName 
        { get; set; }
    }
}