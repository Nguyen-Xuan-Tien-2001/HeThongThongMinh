let accountInfo = {}

function checkInputLogin() {
	$("#email-login").change(function() {
		let email = $(this).val();
		let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
		if (!regexEmail.test(email)) {
			$("#error-email-login").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
			return false;
		} else {
			$("#error-email-login").text("")
		}


		accountInfo.email = email;
	})

	$("#password-login").bind("change", function() {
		let password = $(this).val();
		if (password.length < 1) {
			$("#error-password-login").text("Xin vui lòng nhập mật khẩu !")
			return false;
		} else {
			$("#error-password-login").text("")
		}

		accountInfo.password = password;
	})
}

function checkForgetpw() {
	accountInfo = {}
	$("#email-forgetpw").change(function() {
		let email = $(this).val();
		let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
		if (!regexEmail.test(email)) {
			$("#error-email-fogetpw").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
			accountInfo.email = ""
			return false;
		} else {
			$("#error-email-fogetpw").text("")
		}


		accountInfo.email = email;
	})


}

function checkResetpw() {

	let check = true;
	let pw = '';
	let repw = '';
	$("#btn-resetpw").click(function(e) {
		check = true; pw = ''; repw = '';
		e.preventDefault();
		pw = $("input[name=matkhaumoi]").val();
		repw = $("input[name=rematkhaumoi]").val();

		if (pw && pw.length >= 6) {
			$("#matkhaumoi-error").text("")
		}
		else {
			$("#matkhaumoi-error").text("Mật khẩu không được để trống và phải tối thiểu 6 kí tự")
			check = false;
		}

		if (repw && repw.length >= 6) {
			$("#rematkhaumoi-error").text("")
		}
		else {
			$("#rematkhaumoi-error").text("Xác nhận mật khẩu không được để trống và phải tối thiểu 6 kí tự")
			check = false;
		}

		if (check) {
			if (pw != repw) {
				$("#rematkhaumoi-error").text("Xác nhận mật khẩu không trùng")
				check = false;
			} else {
				$("#rematkhaumoi-error").text("")
			}
		}

		if (check) {
			$("#form-resetpw").submit();
		}
	})
}

function checkInputRegister() {
	let check = true;


	$("#btn-register").click(function(e) {
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
		
		
		let email = $("#email").val();
		let regexEmail = new RegExp(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/);
		if (!regexEmail.test(email)) {
			$("#email-error").text("Vui lòng không bỏ trống và nhập Email hợp lệ")
			check = false;
		} else {
			$("#email-error").text("")
		}
		
		let pw = $("#password").val();
		if(pw && pw.length >= 6){
			$("#mk-error").text("")
		}else{
			check = false;
			$("#mk-error").text("Mật khẩu không được bỏ trống và tổi thiểu 6 kí tự");
		}
		
		let repw = $("#confirmPassword").val();
		if(pw && pw != repw){
			check = false;
			$("#remk-error").text("Mật khẩu nhập lại không trùng");
		}else {
			$("#remk-error").text("");
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
		
		if (check) { 
			$("#form-dk").submit();
		}
	})

}

$(document).ready(function() {


	checkInputLogin();
	checkForgetpw();
	checkResetpw();
	checkInputRegister();

	$("#btn-forgetpw").click(function(e) {

		e.preventDefault();
		if (accountInfo.email) {
			$("#form-forgetpw").submit();

		} else {
			$("#error-email-fogetpw").text("Vui lòng nhập Email")
		}
	});

	$("#btn-login").click(function(e) {
		e.preventDefault();
		if (!jQuery.isEmptyObject(accountInfo)) {
			$("#form-login").submit();

		} else {
			$("#error-email-login").text("Vui lòng nhập Email")
			$("#error-password-login").text("Xin vui lòng nhập mật khẩu !")
		}
	});


})
