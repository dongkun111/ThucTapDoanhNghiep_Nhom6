using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace TaiGameMP.Controllers
{
    public class KhoGameController : Controller
    {
        // GET: KhoGame
        public ActionResult Theloai(int id)
        {
            ViewBag.MenuChinh = new GameDao().ListGamebyID(id);
            //ViewBag.Gametop = new GameDao().TopGame();
          //  ViewBag.Category = new CategoryDao().ListAll();
            return View();
        }
    }
}