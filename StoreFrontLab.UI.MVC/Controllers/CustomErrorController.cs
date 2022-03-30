using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class CustomErrorController : Controller
    {
        // GET: CustomError
        [HandleError]
        public ActionResult Index()
        {
            return View();
        }
    }
}