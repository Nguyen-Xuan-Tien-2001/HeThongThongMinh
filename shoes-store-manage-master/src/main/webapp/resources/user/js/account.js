
function checkInputAccount(){
	let check = true;
	
	$("button[name=updatethongtin]").click(function(e) {
		check = true; 
		e.preventDefault();
		
		let lastName  = $("#lastName").val();
   		let regexLastname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$/);
		if(!regexLastname.test(lastName)){
			check = false;
			$("#ho-error").text("Họ không được để trống và không được có kí tự đặc biệt!")
		}else {
			$("#ho-error").text("")
			let namearr = lastName.split(" ")
			lastName = "";
			namearr.forEach((item) => {
				item = item.trim().replace(/\s+/g, '')
				if(item.length > 0){
					lastName += item + " " 
				}
			})
			lastName = lastName.trim()
			$("#lastName").val(lastName)
		}
		
		let firstName = $("#firstName").val();
		let regexFirstname = new RegExp(/^[\sa-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹếẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/);
		if(!regexFirstname.test(firstName)){
			check = false;
			$("#ten-error").text("Tên không được để trống và không được có kí tự đặc biệt!")
		}else {
			$("#ten-error").text("")
			firstName = firstName.trim().replace(/\s+/g, '')
			$("#firstName").val(firstName)
		}
		
		let phai = $("input[name=phai]").val()
		if(phai != 'true' && phai != 'false'){
			check = false;
			$("#phai-error").text("????");
		}else {
			$("#phai-error").text("")
		}
		
		let ngaysinh = $("input[name=ngaySinh]").val()
		if(!ngaysinh){
			check = false;
			$("#ngaysinh-error").text("Ngày sinh không được để trống");
		}else {
			$("#ngaysinh-error").text("");
		}
		
		let sdt = $("#phone").val();
		let regexSdt = new RegExp(/(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/);
		if(!regexSdt.test(sdt)){
			check = false;
			$("#sdt-error").text("Số điện thoại phải hợp lệ");
		}else {
			$("#sdt-error").text("");
		}
		
		let diachi = $("#address").val();
		if(!diachi){
			check = false;
			$("#diachi-error").text("Địa chỉ không được bỏ trống");
		}else {
			$("#diachi-error").text("")
		}
		
		if(check){
			$("button[name=updatethongtin]").unbind('click')
			$("button[name=updatethongtin]")[0].click()
			//$("#form-suattcn").submit();
		}
	})
}

function checkPw(){
	let check = true;
	$("button[name=doimatkhau]").click(function (e){
		e.preventDefault();
		check = true;
		
		let pw = $("input[name=matkhau]").val();
		if(pw && pw.length >= 6){
			$("#mk-error").text("")
		}else{
			check = false;
			$("#mk-error").text("Mật khẩu không được bỏ trống");
		}
		
		let pwmoi = $("input[name=matkhaumoi]").val();
		if(pwmoi && pwmoi.length >= 6){
			$("#mkmoi-error").text("")
		}else{
			check = false;
			$("#mkmoi-error").text("Mật khẩu không được bỏ trống và tối thiểu 6 kí tự");
		}
		
		let repw = $("input[name=nlmatkhaumoi]").val();
		if(pw && pw != repw){
			check = false;
			$("#remkmoi-error").text("Mật khẩu nhập lại không trùng");
		}else {
			$("#remkmoi-error").text("");
		}
		
		if(check){
			$("button[name=doimatkhau]").unbind('click')
			$("button[name=doimatkhau]")[0].click()
		}
	})
}

$(document).ready(function() {
	
	checkInputAccount();
	
	checkPw();
});