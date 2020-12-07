using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TaiGameMP.Common;
using TaiGameMP.Models;

namespace TaiGameMP.Controllers
{
    public class KhachController : Controller
    {
        private string Khach_Session = "KHACH_SESSION";
        // GET: Khach
        public ActionResult LoginKhachHang(LoginKhach login)
        {
            if (ModelState.IsValid)
            {
                var acc = new KhachDao();
                var result = acc.LoginKhach(login.Username, MaHoa.MD5Hash(login.Password));
                if(result==1)
                {
                    var user = acc.getKhach(login.Username);
                    var KhachSession = new KhachLogin();
                    KhachSession.UserName = user.Username;
                    KhachSession.UserID = user.ID;
                    Session.Add(CommonConstants.KHACH_SESSION, KhachSession);
                    return RedirectToAction("Trangchu", "Trangchu");
                }
                else
                {
                    ModelState.AddModelError("", "Lỗi tài khoản mật khẩu!");
                }
            }
            return View("LoginKhachHang");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.KHACH_SESSION] = null;
            return Redirect("/trang-chu");
        }
        public ActionResult ThongTinUser()
        {
            var KhachSession = (KhachLogin)Session[Khach_Session];
            ViewBag.ListKhachHang = new ThongTinDao().GetByKhachID(KhachSession.UserID);
            var model = new KhachDao().GetKhachByID(KhachSession.UserID);
            return View(model);
        }
        [HttpGet]
        public ActionResult Register()
        {
            SetGender();
            return View();

        }
        [HttpPost]
        public ActionResult Register(KhachHang model)
        {
            if (ModelState.IsValid)
            {
                var dao = new KhachDao();
                if (dao.CheckKhach(model.Username))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }               
                else
                {
                    model.Password = Common.MaHoa.MD5Hash(model.Password);
                    SetGender(model.Gender);
                    var result = dao.Insert(model);
                    if (result)
                    {
                        return RedirectToAction("DKxong", "Khach");

                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }

            }
            SetGender(model.Gender); //  set giá trị 
            return View(model);
        }
        public void SetGender(string sl = null)
        {

            var b = new SelectList(new List<SelectListItem>
            {
                new SelectListItem {Text = "Nam",Value="Nam"},
                new SelectListItem {Text = "Nữ",Value="Nữ"},
            }, "Value", "Text", sl);

            ViewBag.Gender = b; // tên này phải trùng với tên lúc khai báo giới tính ở sql
        }
        public ActionResult DKxong()
        {
            return View();
        }
    }
}