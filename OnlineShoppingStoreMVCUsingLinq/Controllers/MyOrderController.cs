﻿using OnlineShoppingStoreMVCUsingLinq.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShoppingStoreMVCUsingLinq.Controllers
{
    [Authorize]
    public class MyOrderController : Controller
    {
        OrderBO objOrderBO = new OrderBO();
        //
        // GET: /MyOrder/
        public ActionResult GetOrderDetails()
        {
            return View(objOrderBO.GetOrders(null,null,Helper.UserName));
        }
	}
}