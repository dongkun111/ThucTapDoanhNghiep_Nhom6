using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
using TaiGameMP.Common;

namespace TaiGameMP.Areas.Admin.Controllers
{
    public class DSGameController : BaseController
    {
        // GET: Admin/DSGame
        public ActionResult DSGame()
        {
            var gameDao = new GameDao();
            var model = gameDao.ListGame();
            return View(model);
        }
        [HttpGet]
        public ActionResult Tao()
        {
            return View();
        }
        public ActionResult Edit(int id)
        {
            var game = new GameDao().Viewdetail(id);
            return View(game);
        }
        // để kêu thằng hoang nó đưa code
        // cái này là  tạo nó hết lỗi , thế thôi
        // hồi ăn cơm xong chạy thử đi tao dang o day ma
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Tao(Game game)
        {
            if (ModelState.IsValid)
            {
                var dao = new GameDao();
                int id = dao.InsertGame(game);
                if (id > 0)
                {
                    
                    return RedirectToAction("DSGame", "DSGame");
                }
                else
                {
                    ModelState.AddModelError("", "Banh");
                }
            }
            return View("DSGame"); 
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(Game game)
        {
            if (ModelState.IsValid)
            {
                var dao = new GameDao();
                var result = dao.UpdateGame(game);
                if (result)
                {
                    return RedirectToAction("DSGame", "DSGame");
                }
                else
                {
                    ModelState.AddModelError("", "Banh");
                }
            }
            return View("DSGame");
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            bool result = new GameDao().Delete(id);
            if (!result)
                ModelState.AddModelError("", "Chỉnh sửa game thất bại");
            return RedirectToAction("DSGame");
        }
    }
}