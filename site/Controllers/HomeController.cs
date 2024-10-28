using Microsoft.AspNetCore.Mvc;

namespace Kaver.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
