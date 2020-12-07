// JavaScript Document

function KiemTra()
{

	var tendn = window.document.frmDangNhap.txtTenDangNhap.value;
	var mk = window.document.frmDangNhap.txtMatKhau.value;
	if(tendn == "Admin" && mk == "admin")
			document.frmDangNhap.action = "Trangchu - Admin.html";
	else if(tendn == "Mod" && mk == "123456")
			document.frmDangNhap.action = "Trangchu - Mod.html";
	else if(tendn == "Vip" && mk == "123456")
			document.frmDangNhap.action = "Trangchu - Vip.html";
	else if(tendn == "Member" && mk == "123456")
			document.frmDangNhap.action = "Trangchu - Member.html";
	else
			document.frmDangNhap.action = "Trangchu - Khach.html";
}