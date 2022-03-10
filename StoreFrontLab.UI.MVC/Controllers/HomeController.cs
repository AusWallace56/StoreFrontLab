using System.Web.Mvc;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet] 
        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
    }
}
