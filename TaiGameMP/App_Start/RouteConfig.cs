using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TaiGameMP
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               name: "Signout",
               url: "VanDong",
               defaults: new { controller = "Loginad", action = "Logout", id = UrlParameter.Optional },
               namespaces: new[] { "TaiGameMP.Controllers" }
           ).DataTokens = new RouteValueDictionary(new { area = "Admin" });
            routes.MapRoute(
                name: "Game Detail",
                url: "chi-tiet/{untitle}-{id}",
                defaults: new { controller = "GameDetail", action = "Detail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Trang chu",
               url: "trang-chu",
               defaults: new { controller = "Trangchu", action = "Trangchu", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Chien thuat",
               url: "chien-thuat/{id}",
               defaults: new { controller = "KhoGame", action = "Theloai", id = UrlParameter.Optional }
            );
            routes.MapRoute(
              name: "Hanh dong",
              url: "hanh-dong/{id}",
              defaults: new { controller = "KhoGame", action = "Theloai", id = UrlParameter.Optional }
           );
            routes.MapRoute(
              name: "Kinh di",
              url: "kinh-di/{id}",
              defaults: new { controller = "KhoGame", action = "Theloai", id = UrlParameter.Optional }
           );
            routes.MapRoute(
              name: "Sinh ton",
              url: "sinh-ton/{id}",
              defaults: new { controller = "KhoGame", action = "Theloai", id = UrlParameter.Optional }
           );
            routes.MapRoute(
              name: "Nhap vai",
              url: "nhap-vai/{id}",
              defaults: new { controller = "KhoGame", action = "Theloai", id = UrlParameter.Optional }
           );
            routes.MapRoute(
              name: "Dang nhap",
              url: "dang-nhap",
              defaults: new { controller = "Khach", action = "LoginKhachHang", id = UrlParameter.Optional }
           );
            routes.MapRoute(
              name: "Dang ky",
              url: "dang-ky",
              defaults: new { controller = "Khach", action = "Register", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Thong tin ca nhan",
               url: "thong-tin-ca-nhan",
               defaults: new { controller = "Khach", action = "ThongTinUser", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Dang xuat",
               url: "dang-xuat",
               defaults: new { controller = "Khach", action = "Logout", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Tìm kiếm",
               url: "tim-kiem",
               defaults: new { controller = "GameDetail", action = "Search", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Trangchu", action = "Trangchu", id = UrlParameter.Optional }
            );
        }
    }
}
