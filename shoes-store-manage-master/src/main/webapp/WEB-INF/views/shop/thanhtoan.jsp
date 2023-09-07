<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<%@include file="/WEB-INF/views/shop/include/header.jsp"%>
<!-- Header End -->
<main>
	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="">Trang chủ</a> 
					<a class="breadcrumb-item text-dark" href="giohang">Giỏ hàng</a> <span
						class="breadcrumb-item active">Thanh toán</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Checkout Start -->
	<div class="container-fluid">

		<div class="row px-xl-5">
			<div class="col-lg-8">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3"><strong>THÔNG TIN
							ĐẶT HÀNG</strong></span>
				</h5>
				<form:form action="thanhtoan" method="post" modelAttribute="donhang">
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label>HỌ TÊN NGƯỜI NHẬN</label>
								<form:input class="form-control" path="tenNguoiNhan"
									value="${user.khachHang.ho } ${user.khachHang.ten }" />
								<form:errors path="tenNguoiNhan" cssClass="text-danger" />
							</div>
							<div class="col-md-6 form-group">
								<label>SỐ ĐIỆN THOẠI</label>
								<form:input class="form-control" path="sdtKH"
									value="${user.khachHang.sdt }" />
								<form:errors path="sdtKH" cssClass="text-danger" />
							</div>
							<div class="col-md-6 form-group">
								<label>ĐỊA CHỈ</label>
								<form:input class="form-control" path="diaChi"
									value="${user.khachHang.diaChi }" />
								<form:errors path="diaChi" cssClass="text-danger" />
							</div>
							<div class="col-md-6 form-group">
								<label>GHI CHÚ</label>
								<form:input class="form-control" path="ghiChu" value="" />
								<form:errors path="ghiChu" cssClass="text-danger" />
							</div>





						</div>
					</div>
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3"><strong>Thanh toán</strong></span>
					</h5>
					<div class="bg-light p-30 mb-5">

						<div class="row">
							<div class="mb-5">

								<div class="bg-light p-30">
									<div class="form-group">
										<div class="">
											<ul style="list-style: none; padding-left: 0px;">
												<form:radiobuttons element="li" path="hinhThucTT.maHTTT"
													itemValue="maHTTT" itemLabel="kieuTT" items="${dsHTTT}" />
												 <form:errors path="hinhThucTT.maHTTT" cssClass="text-danger"/>
											</ul>
										</div>

									</div>

									<!-- <div class="form-group">
										<div class="custom-control custom-radio">
											<input type="radio" class="custom-control-input"
												name="payment" id="directcheck"> <label
												class="custom-control-label" for="directcheck">Thanh
												toán khi nhận hàng</label>
										</div>
									</div> -->

									<button type="submit" name="muahang"
										class="btn btn-block btn-primary font-weight-bold py-3"
										style="font-size: 20px" >ĐẶT HÀNG</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-body bg-primary p-3" style="height: 150px">
													<div class="d-flex flex-column text-center">
														<span><i class="fas fa-check"></i></span>
														<h5 class="modal-title text-white"
															style="padding: 10px; margin-bottom: 20px"
															id="exampleModalLabel">
															<strong>ĐẶT HÀNG THÀNH CÔNG!</strong>
														</h5>
													</div>

												</div>
												<div class="modal-footer">
													<p class="text-center">Cảm ơn quý khách đã đặt hàng tại
														Shoeniverse. Mã đơn hàng của quý khách là M12340989.</p>
													<div style="height: 30px">
														<a class="" href=""
															style="position: absolute; left: 50%; transform: translateX(-50%)">Xem
															đơn hàng</a>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
			<div class="col-lg-4">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3"><strong>TỔNG THANH
							TOÁN</strong></span>
				</h5>
				<div class="bg-primary p-30 mb-5">
					<div class="border-bottom">
						<h6 class="mb-3">${giohang.size()}&nbsp;Sản phẩm</h6>
						<c:forEach var="sp" items="${giohang }">
							<div class="d-flex justify-content-between">
							<p class="text-truncate">${sp.chiTietSP.sanPham.tenSP }</p>
							<p class="price-item"><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
										maxFractionDigits="0"
										value="${(sp.chiTietSP.sanPham.gia - sp.chiTietSP.sanPham.gia* (sp.chiTietSP.sanPham.giamGia/100)) * sp.soLuong}"
										type="currency" currencySymbol="đ" />
							
							</p>
						</div>
						</c:forEach>
						
						
					</div>
					<div class="border-bottom pt-3 pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Tạm tính</h6>
							<h6><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
										maxFractionDigits="0"
										value="${tongtien}"
										type="currency" currencySymbol="đ" /></h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Phí giao hàng</h6>
							<h6 class="font-weight-medium">30.000 đ</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Tổng tiền</h5>
							<h5><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
										maxFractionDigits="0"
										value="${tongtien + 30000}"
										type="currency" currencySymbol="đ" /></h5>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<%-- <form:form> --%>
	</div>
	<!-- Checkout End -->
	<p id="alertMessage" data-message="${alertMessage }" data-success=${isSuccess }></p>
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

<script>
	$(document).ready(function() {
	
		let isSuccess = $("#alertMessage").data("success")
			if(isSuccess){
				
				toastr.success($("#alertMessage").data("message"))
			}else if(isSuccess == false && isSuccess.trim() != ''){
				toastr.error($("#alertMessage").data("message"))
			}
	})
</script>