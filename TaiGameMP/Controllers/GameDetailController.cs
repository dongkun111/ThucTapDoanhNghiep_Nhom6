using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TaiGameMP.Common;
using TaiGameMP.Models;

namespace TaiGameMP.Controllers
{
    public class GameDetailController : Controller
    {
        private int idgame;
        private string Khach_Session = "KHACH_SESSION";
        // GET: GameDetail
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Detail(int id)
        {
            var g = new GameDao().GetGame(id);
            idgame = id;
            ViewBag.RelatedGame = new GameDao().RelatedGame(id);
            ViewBag.MenuChinh = new GameDao().ListGameA();
            ViewBag.BinhLuan = new BinhLuanDao().ListBL();
            return View(g);
        }
        public JsonResult ListName(string q)
        {
            var data = new GameDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Search(string tukhoa)
        {

            var model = new GameDao().Search(tukhoa);
            ViewBag.Keyword = tukhoa;
            return View(model);
        }

        [HttpPost]
        public ActionResult BinhLuan(Game g)
        {
            string text = g.LK;

            BinhLuan bl = new BinhLuan();
            bl.NoiDung = text;
            var dao = new BinhLuanDao();
            dao.Insert(bl);
            return Redirect("/trang-chu");
        }
    }

}