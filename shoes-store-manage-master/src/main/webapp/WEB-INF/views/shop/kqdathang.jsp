<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<%@include file="/WEB-INF/views/shop/include/header.jsp"%>
<!-- Header End -->
<main>
	<!-- Breadcrumb Start -->
	<div class="container-fluid" style ="margin-top: 235px;">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Trang chủ</a>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12 ">
				<c:choose>
					<c:when test="${isSuccess }">
						<div class="alert alert-success text-center" role="alert">
							<h2>Đặt hàng thành công !!!</h2>

						</div>
						<div class="text-center">
							<a href="sanpham" class="btn btn-primary">Tiếp tục mua sắm</a>
						</div>
					</c:when>
					<c:when test="${isSuccess == false }">
						<div class="alert alert-danger text-center" role="alert">
							<h2>Đặt hàng thất bại !!!</h2>

						</div>
					</c:when>
				</c:choose>


			</div>
		</div>
	</div>

</main>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i
	class="fa fa-angle-double-up"></i></a>

<!-- Footer -->
<%@include file="/WEB-INF/views/shop/include/footer.jsp"%>
<!-- Footer End -->


<!-- JS Lib -->
<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
<!-- JS Lib End -->