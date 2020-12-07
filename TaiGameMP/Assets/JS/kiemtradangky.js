// JavaScript Document
function KiemTra()
{
	var ten = window.document.frmDangKy.txtHoten.value;
	var re = /^(\w{3,180})$/; 
	if(re.test(ten) == false)
		{
			alert("Độ dài của tên phải từ 3 đến 180 ký tự , Viết liền không dấu và không được có kí tự đặc biệt");
			return false;
		}
	
	var nam = window.document.frmDangKy.txtNam.value;
	if(isNaN(nam) == true)
		{
			alert("Vui lòng nhập năm là kí tự số!");
			return false;
		}
	
	var email = window.document.frmDangKy.email.value;
	var re4 = /[\w_]+@[a-z0-9]+\.{1}([a-z0-9]{2,9})$/;
	if(re4.test(email) == false)
		{
			alert("Sai định dạng email, Định dạng chuẩn: abc@xyz.xxx");
			return false;
		}
	
	var tendn = window.document.frmDangKy.txtTenDangNhap.value;
	var re2 = /^\w{3,18}$/;
	if(re2.test(tendn) == false)
		{
			alert("Độ dài của tên đăng nhập phải từ 3 tới 18 kí tự và không có kí tự đặc biệt!");
			return false;
		}
	
	var mk = window.document.frmDangKy.txtPass.value;
	var re3= /^[a-zA-Z0-9_@&]{6,25}$/;
	if(re3.test(mk) == false)
		{
			alert("Độ dài của mật khẩu phải từ 6 đến 25 kí tự và chỉ được phép có kí tự @ ,& và_");
			return false;
		}
	
	var mknhaplai = window.document.frmDangKy.txtNhapLai.value;
	if(mk != mknhaplai)
		{
			alert("Hai mật khẩu không trùng khớp!");
			return false;
		}
	alert("Đăng ký thành công, Bạn sẽ được đưa về trang chủ !");
}