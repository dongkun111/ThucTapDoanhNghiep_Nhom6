using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TaiGameMP.Models
{
    public class LoginKhach
    {
        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage ="Mời nhập tài khoản")]
        public string Username { set; get; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mời nhập mật khẩu")]
        [DataType(DataType.Password)]
        public string Password { set; get; }
        public bool RememberMe { set; get; }
        public string Displayname { set; get; }
    }
}