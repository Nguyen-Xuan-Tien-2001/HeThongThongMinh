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
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark"
						href="#">Shop</a> <span class="breadcrumb-item active">Shop Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">
		<div class="row px-xl-5">

			<form action="sanpham/${ctsanpham.getMaSP() }" method="post" class="d-flex row">
				<div class="col-sm-12 col-md-12 col-lg-5 mb-30">
					<%-- <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="resources/file/${ctsanpham.getHinhAnh() }" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-2.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-3.jpg" alt="Image">
                        </div>
                        <div class="carousel-item">
                            <img class="w-100 h-100" src="img/product-4.jpg" alt="Image">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div> --%>
					<div class="product-item">
						<img class="w-100 h-100" src="${ctsanpham.getHinhAnh() }" alt="Image">
					</div>
				</div>

				<div class="col-sm-12 col-md-12 col-lg-7 h-auto mb-30">
					<div class="h-100 bg-light p-30">
						<h3>${ctsanpham.getTenSP() }</h3>
						<!-- <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1">(99 Reviews)</small>
                    </div> -->
						<h3 class="font-weight-semi-bold mb-4">
							<fmt:setLocale value="vi_VN" />
							<fmt:formatNumber maxFractionDigits="0"
								value="${ctsanpham.getGia() - ctsanpham.getGia() * (ctsanpham.giamGia/100)}"
								type="currency" currencySymbol="đ" />

							<c:choose>
								<c:when test="${ctsanpham.giamGia > 0 }">
									<span class="font-italic" style="font-size: 16px;"><del>
											<fmt:setLocale value="vi_VN" />
											<fmt:formatNumber maxFractionDigits="0" value="${ctsanpham.getGia()} "
												type="currency" currencySymbol="đ" />
										</del></span>
								</c:when>
							</c:choose>


						</h3>

						<p class="mb-4">${ctsanpham.getMoTa() }</p>
						<div class="d-flex mb-3">
							<strong class="text-dark mr-3">Sizes:</strong>


							<c:forEach var="s" items="${ctsanpham.getChiTietSanPhams()}">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" value="${s.getSizeSanPham().getMaSize() }"
										data-ctsp="${s.getMaChiTietSP() }" data-cosan="${s.soLuong }"
										class="custom-control-input" required
										id="size-${s.getSizeSanPham().getMaSize() }" name="size">
									<label class="custom-control-label"
										for="size-${s.getSizeSanPham().getMaSize() }">${s.getSizeSanPham().getTenSize()}
									</label>
								</div>

							</c:forEach>



						</div>
						<%--<c:choose>
							 <c:when test="${isSuccess }">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									${message }
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</c:when> --%>
						<%-- <c:when test="${isSuccess == false }">
								<div class="alert alert-warning alert-dismissible fade show"
									role="alert">
									${alertMessage }
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close" data-success="${isSuccess }">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</c:when> 
						</c:choose>--%>

						<div class="d-flex align-items-center mb-1 pt-2">
							<div class="input-group quantity mr-3" style="width: 130px;">
								<div class="input-group-btn">
									<button type="button" class="btn btn-primary btn-minus">
										<i class="fa fa-minus"></i>
									</button>
								</div>
								<input type="text" name="soluong"
									oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"
									class="form-control bg-secondary border-0 text-center" value="1">

								<div class="input-group-btn">
									<button type="button" class="btn btn-primary btn-plus">
										<i class="fa fa-plus"></i>
									</button>
								</div>

							</div>

							<button type="submit" id="themvaogiohang" name="themvaogiohang" data-success="${isSuccess }"
								class="btn btn-primary px-3" data-sp="${ctsanpham.getMaSP() }">
								<i class="fa fa-shopping-cart mr-1"></i> Thêm vào giỏ hàng
							</button>

						</div>
						<div>
							<p class="font-italic mb-0" id="spcosan" hidden>sản phẩm có sẵn</p>
							<p class="font-italic text-danger" id="texterror"> </p>
						</div>

					</div>
				</div>
			</form>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="bg-light p-30">
					<div class="nav nav-tabs mb-4">
						<a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
						<!--  <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a> -->
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">Mô tả sản phẩm</h4>
							<p>${ ctsanpham.moTa}</p>
						</div>
						<!-- <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Additional Information</h4>
                            <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                      </ul> 
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">
                                            Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                        </li>
                                        <li class="list-group-item px-0">
                                            Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                        </li>
                                      </ul> 
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">1 review for "Product Name"</h4>
                                    <div class="media mb-4">
                                        <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                        <div class="media-body">
                                            <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                            <div class="text-primary mb-2">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star-half-alt"></i>
                                                <i class="far fa-star"></i>
                                            </div>
                                            <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Leave a review</h4>
                                    <small>Your email address will not be published. Required fields are marked *</small>
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">Your Rating * :</p>
                                        <div class="text-primary">
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                    </div>
                                    <form>
                                        <div class="form-group">
                                            <label for="message">Your Review *</label>
                                            <textarea id="message" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Your Name *</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Your Email *</label>
                                            <input type="email" class="form-control" id="email">
                                        </div>
                                        <div class="form-group mb-0">
                                            <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->


	<!-- Products Start -->
	<div class="container-fluid py-5">
		<h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Sản phẩm cùng loại</span>
		</h2>
		<div>
			<div class="row px-xl-5">
				<c:forEach var="sp" items="${sanPhamTrongCT }">

					<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden" style="height: 320px;">
								<!-- <span class="badge bg-warning">NEW</span>  -->
								<img class="img-fluid w-100" src="${sp.getHinhAnh() }" alt="">

							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate"
									href="sanpham/${sp.getMaSP() }">${sp.getTenSP() }</a>
								<div class="d-flex align-items-center justify-content-center mt-2">
									<h5>
										<fmt:setLocale value="vi_VN" />
										<fmt:formatNumber maxFractionDigits="0" value="${sp.gia}" type="currency"
											currencySymbol="đ" />
									</h5>
									<h6 class="text-muted ml-2">
										<del>

											<c:if test="${sp.giamGia > 0 }">
												<fmt:setLocale value="vi_VN" />
												<fmt:formatNumber maxFractionDigits="0"
													value="${(sp.gia - sp.gia* (sp.giamGia/100))}" type="currency"
													currencySymbol="đ" />
											</c:if>



										</del>
									</h6>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Products End -->
</main>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- Footer -->
<%@include file="/WEB-INF/views/shop/include/footer.jsp"%>
<!-- Footer End -->


<!-- JS Lib -->
<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
<!-- JS Lib End -->

<script>
	$(document).ready(function () {

		let isSuccess = $("#themvaogiohang").data("success")
		console.log(isSuccess)
		if (isSuccess) {

			toastr.success('Thêm vào giỏ hàng thành công!')
		} else if (isSuccess == false && typeof isSuccess != 'string') {
			toastr.error('Thêm vào giỏ hàng thất bại!')
		}

		$(".custom-control-input").click(function () {
			let slcosan = $(this).data("cosan")
			$("#spcosan").text(slcosan + " sản phẩm có sẵn")
			$("#spcosan").removeAttr("hidden")
			
			let soluong = $("input[name=soluong]").val()
			if(soluong > slcosan) {
				$("input[name=soluong]").val(slcosan)
			}
		})
		
		let data = {}
		let dataInput = {}
		$("input[name=soluong]").on('click', function() {
			dataInput.mactsp = $(this).data("ctsp")
			dataInput.soluong = $(this).val()
		})
		
		$("input[name=soluong]").on('blur', function() {
			if(!$(this).val()){
					$(this).val(dataInput.soluong ? dataInput.soluong : '')
			}else if($(this).val() == 0){
					$(this).val(1)
					dataInput.mactsp = $(this).data("ctsp")
					dataInput.soluong = $(this).val()
			}else {
				let inputRadio = $("input[name=size]:checked")
				let soluong = $("input[name=soluong]").val()
				let slcosan = $("input[name=size]:checked").data("cosan")
				if(soluong > slcosan){
					$("input[name=soluong]").val(slcosan)
				}
			}
					
		})

		$("button[name=themvaogiohang]").on('click', function (e) {

			e.preventDefault();
			let inputRadio = $("input[name=size]:checked")
			let soluong = $("input[name=soluong]").val()
			console.log(inputRadio)
			console.log(soluong)
			if (!inputRadio || inputRadio.length == 0 || !soluong) {
				$("#texterror").text("Vui lòng chọn size và số lượng phù hợp")
			} else {
				$("#texterror").text("")
				//$(this).unbind('click')
				//$(this)[0].click();
				
				// goi api
				let data = {
					size: inputRadio.val(),
					soluong: soluong,
					maSP: $(this).data("sp")
				}
				
				$.ajax({
								url: "api/themvaogiohang",
								type: "post",
								data: data,
								success: function(result){
									console.log('result', result);
									console.log('type', typeof result);
									
									if(result === 'candangnhap') {
										window.location.href="dangnhap"
										
									}else if(result === 'themfalse'){
										toastr.error('Thêm vào giỏ hàng thất bại!')
									}else if(result === 'capnhatfalse'){
										toastr.error('Cập nhật vào giỏ hàng thất bại!')
										
									}else if(result === 'themtrue'){
										toastr.success('Thêm vào giỏ hàng thành công!')
										console.log($("#giohang"))
										if($("#giohang")){
											let sl = $("#giohang").data("sl")
											
											if(sl){
												sl = parseInt(sl)+1
												$("#giohang").text(sl)
												$("#giohang").data("sl", sl)
											}
										}
										
									}else if(result === 'capnhattrue'){
										toastr.success('Cập nhật vào giỏ hàng thành công!')
									}
									
								},
								error: function(error){
									console.log(error);
								}
							})
			}
		})

	})
</script>