using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TaiGameMP.Areas.Admin.Models
{
    public class BinhLuan
    {
        [Required(ErrorMessage = "Mời nhập tên tài khoản")]
        public string Username { set; get; }
        [Required(ErrorMessage = "Mời nhập mật khẩu")]
        public string Password { set; get; }

        public bool RememberMe { set; get; }
    }
}