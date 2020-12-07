using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.Dao;

namespace TaiGameMP.Areas.Admin.Controllers
{
    public class GameController : BaseController
    {
        // GET: Admin/Game
        public ActionResult Index()
        {
            return View();
        }
        public void SetViewBag(int? selectedId = null)
        {
            var dao = new CategoryDao();
            ViewBag.IDCategory = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }
        [HttpGet]
        public ActionResult Game()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult Game(Game model)
        {
            if(ModelState.IsValid)
            {

            }
            SetViewBag(model.IDCategory);
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new GameDao();
            var game = dao.GetGame(id);
            SetViewBag(game.IDCategory);
            return View();
        }
    }
}