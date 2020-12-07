using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace TaiGameMP.Controllers
{
    public class TrangchuController : Controller
    {
        // GET: Trangchu
        public ActionResult Trangchu()
        {
            ViewBag.MenuChinh = new GameDao().ListGameA();
            ViewBag.Gametop = new GameDao().TopGame();
            ViewBag.Category = new CategoryDao().ListAll();
            return View();
        }
        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListbyGroupID();
            return PartialView(model);
        }
    }
}