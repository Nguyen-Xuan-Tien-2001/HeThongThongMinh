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
						class="breadcrumb-item active">Đăng ký</span>
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
					<!-- <li class="nav-item"><a class="nav-link active h4"
						id="pills-home-tab" data-toggle="pill" href="#login-form"
						role="tab" aria-controls="pills-home" aria-selected="true">ĐĂNG
							NHẬP</a></li> -->
					<li class="nav-item"><a class="text-dark nav-link active h2" style="background:#fff; cursor: default;"
						id="pills-profile-tab" data-toggle="pill" href="#register-form"
						role="tab" aria-controls="pills-profile" aria-selected="true">ĐĂNG
							KÝ</a></li>

				</ul>

					<div class="tab-pane fade show active" id="register-form" role="tabpanel"
						aria-labelledby="pills-profile-tab">
					 <form:form action="dangky" method="post" modelAttribute="tkdangky" id="form-dk">

							<div class="form-floating">
								<form:input path="ho" class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="lastName" placeholder="HỌ"/>
								<form:errors path="ho" cssClass="text-danger" />
								<p class="text-danger" id="ho-error"></p>
								
							</div>
							<div class="form-floating">
								<form:input path="ten"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="firstName" placeholder="TÊN"/>
								<form:errors path="ten" cssClass="text-danger" />
								<p class="text-danger" id="ten-error"></p>
							</div>
							<div class="form-floating">
								<input type="email" name="email-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="email" placeholder="EMAIL"/>
									<p class="text-danger" id="email-error">${email }</p>
							</div>
							<div class="form-floating">
								<input type="password" name="password-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="password" placeholder="MẬT KHẨU"/>
									<p class="text-danger" id="mk-error">${password }</p>
							</div>
							<div class="form-floating">
								<input type="password" name="confirm-password-register"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="confirmPassword" placeholder="NHẬP LẠI MẬT KHẨU">
									<p class="text-danger" id="remk-error">${confirmPassword }</p>
							</div>
							<div class="form-floating">
								<form:input path="sdt"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="phone" placeholder="SỐ ĐIỆN THOẠI" />
								<form:errors path="sdt" cssClass="text-danger" />
								<p class="text-danger" id="sdt-error"></p>
							</div>
							<div class="form-floating">
								<form:input path="diaChi"
									class=" mb-3 form-control border-top-0 border-left-0 border-right-0 border-size-2"
									id="address" placeholder="ĐỊA CHỈ"/>
								<form:errors path="diaChi" cssClass="text-danger" />
								<p class="text-danger" id="diachi-error"></p>
							</div>
							
							<p class="text-danger">${message }</p>
							<div class="form-floating mb-3 float-right">
								<span>Đã có tài khoản </span> <a style="color:var(--primary)" href="dangnhap">Đăng nhập</a>
							</div>
							<button id="btn-register" class="btn bg-border h5 mt-4 w-100" type="submit">ĐĂNG
								KÝ</button>
						</form:form> 
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
