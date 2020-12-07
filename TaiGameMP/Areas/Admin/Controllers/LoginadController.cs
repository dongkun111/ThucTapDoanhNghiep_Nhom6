using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TaiGameMP.Areas.Admin.Models;
using TaiGameMP.Common;

namespace TaiGameMP.Areas.Admin.Controllers
{
    public class LoginadController : Controller
    {
        // GET: Admin/Loginad
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login(LoginModel model)
        {
            if(ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.Username, MaHoa.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetById(model.Username);
                    var userSession = new UserLogin();
                    userSession.UserName = user.Username;
                    userSession.Displayname = user.Displayname;                    
                    userSession.UserID = user.ID;

                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại!");
                }
                else
                {
                    ModelState.AddModelError("", "Lỗi tài khoản hoặc mật khẩu!");
                }
            }
            return View("Login");           
        }
        public ActionResult Logout()
        {
            Session["USER_SESSION"] = null;
            return RedirectToAction("Login");
        }
    }
}