using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;

namespace TaiGameMP.Areas.Admin.Controllers
{
    public class MenuController : Controller
    {
        // GET: Admin/Menu
        public ActionResult DSMenu()
        {
            var model = new MenuDao().ListbyGroupID();
            return View(model);
        }
        public ActionResult TaoMenu(Menu model)
        {
            if (ModelState.IsValid)
            {
                SetViewBag(model.TypeID);
                if (model.TypeID == 2)
                {
                    SetMenu(model.Submenu);
                    model.Multilevel = false;
                }
                else
                {
                    model.Submenu = null;
                }
                var result = new MenuDao().InsertMenu(model);
                if (result)
                {
                    SetMenu();
                    return View();
                }
                else
                    ModelState.AddModelError("", "Banh!!");
            }
            SetMenu();
            return View();
        }
        [HttpPost]
        public ActionResult Edit(Menu menu)
        {
            if (ModelState.IsValid)
            {
                var dao = new MenuDao();
                var result = dao.UpdateMenu(menu);
                if (result)
                {
                    return RedirectToAction("DSMenu", "Menu");
                }
                else
                {
                    ModelState.AddModelError("", "Banh");
                }
            }
            return View("DSMenu");
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            bool result = new MenuDao().Delete(id);
            if (!result)
                ModelState.AddModelError("", "Chỉnh sửa menu thất bại");
            return RedirectToAction("DSMenu");
        }
        public void SetViewBag(int? SelectedId = null)
        {
            var dao = new MenuDao();
            ViewBag.TypeID = new SelectList(dao.GetList(), "ID", "Name", SelectedId);
        }
        public void SetMenu(int? selectedId = null)
        {
            var dao = new MenuDao();
            ViewBag.Submenu = new SelectList(dao.MenuChinh(), "ID", "Text", selectedId);
        }
    }
}