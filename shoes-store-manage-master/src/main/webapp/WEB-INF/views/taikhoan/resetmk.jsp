<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/taglib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<title>Trang chủ</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="<c:url value='resources/user/lib/animate/animate.min.css '/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/owlcarousel/assets/owl.carousel.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/alertify.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/themes/default.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/themes/semantic.min.css'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<%-- --%>

<!-- Customized Bootstrap Stylesheet -->
<!-- <link href="css/style.css" rel="stylesheet"> -->
<%-- <c:url value='resources/user/'/> --%>
<link rel="stylesheet"
	href="<c:url value='resources/user/scss/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='resources/user/scss/custom.css'/>">
<link href="<c:url value='resources/user/css/style.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-t.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-n.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-d.css'/>"
	rel="stylesheet">

<link
	href="<c:url value='resources/employee/plugins/toastr/toastr.min.css'/>"
	rel="stylesheet">
<style>
.form-resetmk-container {
	margin-top: 120px;
	display: flex;
	justify-content: center;
}

.form-resetmk {
	background-color: #fff;
	width: 300px;
	padding: 30px;
}
</style>
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid" style="margin-top: 160px;">
		<div class="row bg-white py-1 px-xl-5">
			<div class="col-lg-6 d-none d-lg-block leader">
				<!-- <div class="d-inline-flex align-items-center h-100 topbar-font">
					<a class="text-body mr-3" href="">About</a> <a
						class="text-body mr-3" href="">Liên hệ</a> <a
						class="text-body mr-3" href="">Trợ giúp</a> <a
						class="text-body mr-3" href="">Câu hỏi thường gặp<span
						class="fa fa-question-circle ml-1"></span></a>
				</div> -->
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class=" d-inline-flex align-items-center">
					<c:choose>
						<c:when test="${user == null }">
							<div class="btn-group">
								<!-- <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Tài khoản</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">Đăng nhập</button>
                            <button class="dropdown-item" type="button">Đăng ký</button>
                            <button class="dropdown-item" type="button">Đăng xuất</button>
                        </div> -->
								<a class="btn btn-primary" href="dangnhap" role="button">Đăng
									nhập</a> <a class="btn  bg-danger ml-2 text-white" href="dangky"
									role="button">Đăng ký</a>
							</div>
						</c:when>
						<c:when test="${user != null }">

							<c:choose>
								<c:when test="${user.getKhachHang() != null }">
									<button type="button"
										class="btn btn-sm btn-secondary dropdown-toggle"
										data-toggle="dropdown">

										<c:choose>
											<c:when
												test="${user.getKhachHang().getAnh().trim() == null }">
												<img class="avatar" alt=""
													src="https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg" />
											</c:when>
											<c:otherwise>
												<img class="avatar" alt=""
													src="resources/file/${user.getKhachHang().getAnh() }" />
											</c:otherwise>
										</c:choose>


										${user.getKhachHang().getHo() }&nbsp;${user.getKhachHang().getTen() }
									</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="dangxuat" class="dropdown-item">Đăng xuất </a>
									</div>
								</c:when>
								<c:when test="${user.getNhanVien() != null }">
									<button type="button"
										class="btn btn-sm btn-secondary dropdown-toggle"
										data-toggle="dropdown">
										<c:choose>
											<c:when test="${user.getNhanVien().getAnh().trim() != null }">
												<img src="resources/file/${user.getNhanVien().getAnh() }"
													class="avatar">
											</c:when>
											<c:otherwise>
												<img class="avatar" alt=""
													src="https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg" />
											</c:otherwise>
										</c:choose>

										${user.getNhanVien().getHo() }&nbsp;${user.getNhanVien().getTen() }
									</button>
									<div class="dropdown-menu dropdown-menu-right">


										<a href="dangxuat" class="dropdown-item">Đăng xuất </a>
									</div>
								</c:when>
							</c:choose>


						</c:when>
					</c:choose>

				</div>

			</div>
		</div>

	</div>
	<!-- Topbar End -->

	<main>
		<div class="container d-flex align-items-center">

			<div class="row px-xl-5 mx-auto form-resetmk-container">
				<h2 class="text-uppercase ">ĐỔI MẬT KHẨU</h2>
				<div class="col-lg-12 form-resetmk mt-3">

					<form action="resetmk" method="post" id="form-resetpw">
						<div class="form-floating mb-3">
							<input type="password" name="matkhaumoi"
								class="form-control border-top-0 border-left-0 border-right-0 border-size-2"
								id="password-login" placeholder="MẬT KHẨU MỚI" />
							<p class="text-danger float-left" id="matkhaumoi-error">${matkhaumoi }</p>
						</div>

						<div class="form-floating mb-3">
							<input type="password" name="rematkhaumoi"
								class="form-control border-top-0 border-left-0 border-right-0 border-size-2"
								id="password-login" placeholder="XÁC NHẬN MẬT KHẨU" />
							<p class="text-danger float-left" id="rematkhaumoi-error">${rematkhaumoi }</p>
						</div>

						<div class="form-floating mb-3">
							<button id="btn-resetpw" class="w-100 btn btn-primary h5 mt-4"
								type="submit">LƯU</button>
						</div>


					</form>

				</div>

			</div>

		</div>
	</main>

	<p id="alertMessage" data-message="${alertMessage }" data-success=${isSuccess }></p>

	<!-- JS Lib -->
	<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
	<!-- JS Lib End -->

	<script>
		let isSuccess = $("#alertMessage").data("success")
			if(isSuccess){
			
			toastr.success($("#alertMessage").data("message"))
		}
		else if(isSuccess==false && isSuccess != ''){
			 toastr.error($("#alertMessage").data("message"))		
		}
	</script>
	<script src="resources/user/js/auth.js"></script>
</body>
</html>