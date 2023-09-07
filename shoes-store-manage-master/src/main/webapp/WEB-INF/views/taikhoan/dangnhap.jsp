<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<%@include file="/WEB-INF/views/shop/include/header.jsp"%>
<!-- Header End -->

<%@include file="/WEB-INF/views/taglib/tag.jsp"%>

<main>
	<!-- Breadcrumb Start -->
	<div class="container-fluid" style="margin-top: 160px;">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="">Trang chủ</a> <span
						class="breadcrumb-item active">Đăng nhập</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Start -->
	<div class="container">

		<div class="row px-xl-5 d-flex justify-content-center">
			<div class="col-lg-12 form-sign-in ">
				<ul class="nav nav-pills mb-3  justify-content-center "
					id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active h2"
						style="    cursor: default;background: white;color: #000;" id="pills-home-tab" data-toggle="pill"
						href="#login-form" role="tab" aria-controls="pills-home"
						aria-selected="true">ĐĂNG NHẬP</a></li>
					<!-- <li class="nav-item"><a class="nav-link h4"
						id="pills-profile-tab" data-toggle="pill" href="#register-form"
						role="tab" aria-controls="pills-profile" aria-selected="false">ĐĂNG
							KÝ</a></li> -->

				</ul>

				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="login-form"
						role="tabpanel" aria-labelledby="pills-home-tab">


						<form:form action="dangnhap" method="post" id="form-login"
							modelAttribute="taikhoan">
							<div class="form-floating mb-3">
								<form:input path="email" id="email-login" placeholder="EMAIL"
									class="form-control border-top-0 border-left-0 border-right-0 border-size-2" />

								<form:errors path="email" cssClass="text-danger" />
								<p class="text-danger" id="error-email-login"></p>
							</div>
							<div class="form-floating mb-3">
								<form:password path="matKhau"
									class="  form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="password-login" placeholder="MẬT KHẨU" />
								<form:errors path="matKhau" cssClass="text-danger" />
								<p class="text-danger" id="error-password-login"></p>

							</div>
							<p class="text-danger">${message }</p>

							<div class="form-floating mb-3 float-left">
								<span></span> <a style="color: var(--primary);" href="quenmatkhau">Quên mật khẩu</a>
							</div>
							<div class="form-floating mb-3 float-right">
								<span>Chưa có tài khoản </span> <a style="color: var(--primary);" href="dangky">Đăng ký</a>
							</div>

							<button id="btn-login" class="w-100 btn bg-border text-dark h5 mt-4"
								type="submit">ĐĂNG NHẬP</button>
						</form:form>


					</div>
					<div class="tab-pane fade" id="register-form" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<%-- <form:form action="dangky" method="post" modelAttribute="tkdangky">

							<div class="form-floating">
								<form:input path="ho" class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="lastName-register" placeholder="HỌ"/>
								<form:errors path="ho" cssClass="text-danger" />
								
							</div>
							<div class="form-floating">
								<form:input path="ten"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="fistName-register" placeholder="TÊN"/>
								<form:errors path="ten" cssClass="text-danger" />
							</div>
							<div class="form-floating">
								<input type="email" name="email-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="email-register" placeholder="EMAIL"/>
								<form:errors path="email" cssClass="text-danger" />
							</div>
							<div class="form-floating">
								<input type="password" name="password-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="password-register" placeholder="MẬT KHẨU"/>
								
							</div>
							<div class="form-floating">
								<input type="password" name="confirm-password-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="confirmPassword-register" placeholder="NHẬP LẠI MẬT KHẨU">
								
							</div>
							<div class="form-floating">
								<form:input path="sdt"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="phone-register" placeholder="SỐ ĐIỆN THOẠI" />
								<form:errors path="sdt" cssClass="text-danger" />
							</div>
							<div class="form-floating">
								<form:input path="diaChi"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="address-register" placeholder="ĐỊA CHỈ"/>
								<form:errors path="diaChi" cssClass="text-danger" />
							</div>
							<button class="btn btn-primary h5 mt-4 w-100" type="submit">ĐĂNG
								KÝ</button>
						</form:form> --%>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Shop End -->

</main>


<!-- Footer -->
<%@include file="/WEB-INF/views/shop/include/footer.jsp"%>
<!-- Footer End -->



<!-- JS Lib -->
<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
<!-- JS Lib End -->

<script src="resources/user/js/auth.js"></script>
</body>

</html>

