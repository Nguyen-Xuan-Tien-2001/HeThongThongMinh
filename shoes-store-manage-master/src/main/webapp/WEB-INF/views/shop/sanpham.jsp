<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!-- Header -->
<%@include file="/WEB-INF/views/shop/include/header.jsp"%>
<!-- Header End -->
<main>
	<!-- Breadcrumb Start -->
	<div class="container-fluid" style ="margin-top: 235px;">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Trang chủ</a> <span
						class="breadcrumb-item active">Mua sắm</span>
					${danhSachSanPham.size() }
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-4">
				<!-- Status Start -->
				<!-- <h5 class="section-title position-relative text-uppercase mb-3"
					data-toggle="collapse" href="#collapseStatus" role="button"
					aria-expanded="true" aria-controls="collapseStatus">
					<span class="bg-secondary pr-3">Sale <i
						class="fas fa-chevron-down"></i></span>
				</h5>
				<div class="collapse show" id="collapseStatus">
					<div class="bg-light p-4 mb-30">
						<form>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input"
									id="status-all" checked> <label
									class="custom-control-label" for="status-all">All</label> <span
									class="badge border font-weight-normal"></span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
								<input type="checkbox" class="custom-control-input"
									id="status-sale-off"> <label
									class="custom-control-label" for="status-sale-off">Sale
									off</label> <span class="badge border font-weight-normal"></span>
							</div>
						</form>
					</div>
				</div> -->
				<!-- Status End -->
				<!-- Categories Start -->
				<h5 class="section-title position-relative text-uppercase mb-3"
					data-toggle="collapse" href="#collapseCategories" role="button"
					aria-expanded="true" aria-controls="collapseCategories">
					<span class="bg-secondary pr-3">Danh mục <i
						class="fas fa-chevron-down"></i></span>
				</h5>
				<div class="collapse show" id="collapseCategories">
					<div class="bg-light p-4 mb-30">
						<form>

							<c:forEach var="dm" items="${danhSachDanhMucSanPham }">
								<div data-dmid="${dm.maDM }"
									class="category-item custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
									<input type="checkbox" class="custom-control-input"
										id="category-${dm.maDM}"> <label
										class="custom-control-label" for="category-${dm.maDM }">${dm.getTenDM() }</label>
									<span class="badge border font-weight-normal"></span>
								</div>
							</c:forEach>

						</form>
					</div>
				</div>
				<!-- Categories End -->
				<!-- Price Start -->
				<!-- <h5 class="section-title position-relative text-uppercase mb-3"
					data-toggle="collapse" href="#collapsePrice" role="button"
					aria-expanded="true" aria-controls="collapsePrice">
					<span class="bg-secondary pr-3">Price <i
						class="fas fa-chevron-down"></i></span>
				</h5>
				<div class="collapse show" id="collapsePrice">
					<div class="bg-light p-4 mb-30">
						<form>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input" checked
									id="price-all"> <label class="custom-control-label"
									for="price-all">All Price</label> <span
									class="badge border font-weight-normal">1000</span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input" id="price-1">
								<label class="custom-control-label" for="price-1">$0 -
									$100</label> <span class="badge border font-weight-normal">150</span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input" id="price-2">
								<label class="custom-control-label" for="price-2">$100 -
									$200</label> <span class="badge border font-weight-normal">295</span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input" id="price-3">
								<label class="custom-control-label" for="price-3">$200 -
									$300</label> <span class="badge border font-weight-normal">246</span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
								<input type="checkbox" class="custom-control-input" id="price-4">
								<label class="custom-control-label" for="price-4">$300 -
									$400</label> <span class="badge border font-weight-normal">145</span>
							</div>
							<div
								class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
								<input type="checkbox" class="custom-control-input" id="price-5">
								<label class="custom-control-label" for="price-5">$400 -
									$500</label> <span class="badge border font-weight-normal">168</span>
							</div>
						</form>
					</div>
				</div> -->
				<!-- Price End -->

				<!-- Color custom start-->
				<h5 class="section-title position-relative text-uppercase mb-3"
					data-toggle="collapse" href="#collapseColor" role="button"
					aria-expanded="true" aria-controls="collapseColor">
					<span class="bg-secondary pr-3">Màu <i
						class="fas fa-chevron-down"></i></span>
				</h5>
				<div class="collapse show" id="collapseColor">
					<div class="bg-light p-4 mb-30">
						<div class="d-flex flex-wrap g-2">
							<label class=" btn-filter-color" id="btn-color--#dc3545">
								<span class=" btn-filter-color-item" data-colorid="3"
								style="background-color: #dc3545"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#007bff">
								<span class=" btn-filter-color-item" data-colorid="5"
								style="background-color: #007bff"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#6f42c1">
								<span class=" btn-filter-color-item" data-colorid="11"
								style="background-color: #6f42c1"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#ffc107">
								<span class=" btn-filter-color-item" data-colorid="12"
								style="background-color: #ffc107"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#fff"> <span
								class=" btn-filter-color-item" style="background-color: #fff" data-colorid="1"></span>
								<input type="checkbox" name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#28a745">
								<span class=" btn-filter-color-item" data-colorid="13"
								style="background-color: #28a745"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#343a40">
								<span class=" btn-filter-color-item" data-colorid="2"
								style="background-color: #343a40"></span> <input type="checkbox"
								name="" hidden />
							</label> <label class=" btn-filter-color" id="btn-color--#e83e8c">
								<span class=" btn-filter-color-item" data-colorid="4"
								style="background-color: #e83e8c"></span> <input type="checkbox"
								name="" hidden />
							</label> 

						</div>
					</div>
				</div>
				<!-- Color custom end -->

				<!-- Size Start -->
				<h5 class="section-title position-relative text-uppercase mb-3"
					data-toggle="collapse" href="#collapseSize" role="button"
					aria-expanded="true" aria-controls="collapseSize">
					<span class="bg-secondary pr-3">size <i
						class="fas fa-chevron-down"></i></span>
				</h5>
				<div class="collapse show" id="collapseSize">
					<div class="bg-light p-4 mb-30">
						<div class="d-flex flex-wrap g-2">
							<c:forEach var="s" items="${danhSachSize }">
								<button data-mafsize="${s.getMaSize() }"
									class="btn border m-1 btn-filter-size"
									id="btn-size--${s.getTenSize() }">${s.getTenSize() }</button>
							</c:forEach>


						</div>


						<!-- <div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-2">
							<input type="checkbox" class="custom-control-input" id="size-5">
							<label class="custom-control-label ml-1" for="size-5">Tất
								cả</label>

						</div> -->
					</div>
				</div>

				<!-- Size End -->
				<div>
					<button class="btn btn-info" id="btn-fitler">Lọc</button>
				</div>
			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-8">
				<div class="row pb-3">
					<div class="col-12">
						<!-- <div
							class="d-flex align-items-center justify-content-between mb-4">
							<div>
								<button class="btn btn-sm btn-light">
									<i class="fa fa-th-large"></i>
								</button>
								<button class="btn btn-sm btn-light ml-2">
									<i class="fa fa-bars"></i>
								</button>
							</div>
							<div class="ml-2">
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">Sắp xếp</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">Mới nhất</a> <a
											class="dropdown-item" href="#">Phổ biến</a> <a
											class="dropdown-item" href="#">Đánh giá tốt</a>
									</div>
								</div>
								<div class="btn-group ml-2">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">Hiển thị</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">10</a> <a
											class="dropdown-item" href="#">20</a> <a
											class="dropdown-item" href="#">30</a>
									</div>
								</div>
							</div>
						</div> -->
					</div>
					<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder" />
					<c:url value="/sanpham" var="pagedLink">
						<c:param name="p" value="~" />
					</c:url>
					<%-- <c:forEach var="sp" items="${danhSachSanPham }"> --%>
					<c:forEach var="sp" items="${pagedListHolder.pageList}">
						<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
							<div class="product-item bg-light mb-4">
								<div class="product-img position-relative overflow-hidden"
									style="height: 320px;">
									<!-- <span class="badge bg-warning">NEW</span>  -->
									<img class="img-fluid w-100"
										src="${sp.getHinhAnh() }" alt="">

									<div class="product-action d-flex">
										<div class="d-flex flex-row">
											<!--<a class="btn btn-outline-dark btn-square" href=""><i
												class="fa fa-shopping-cart"></i></a>
												 <a
											class="btn btn-outline-dark btn-square" href=""><i
											class="fa fa-sync-alt"></i></a> <a
											class="btn btn-outline-dark btn-square" href=""><i
											class="fa fa-search"></i></a> -->
										</div>

										<button data-id="${sp.getMaSP() }"
											class="btn text-uppercase btn-product-buynow"
											style="display: inline-block;">mua ngay</button>
									</div>



								</div>
								<div class="text-center py-4 text-pd"
									style="overflow-wrap: break-word;">
									<a class="h6 text-decoration-none text-truncate d-block"
										style="word-wrap: break-word" href="sanpham/${sp.getMaSP() }">${sp.getTenSP() }</a>
									<div
										class="d-flex align-items-center justify-content-center mt-2">
										<h5>
											<fmt:setLocale value="vi_VN" />
											<fmt:formatNumber maxFractionDigits="0" value="${sp.gia - sp.gia* (sp.giamGia/100)}"
												type="currency" currencySymbol="đ" />
										</h5>
										<h6 class="text-muted ml-2">
											<del>

												<c:if test="${sp.giamGia > 0 }">
													<fmt:setLocale value="vi_VN" />
													<fmt:formatNumber maxFractionDigits="0"
														value="${(sp.gia) }"
														type="currency" currencySymbol="đ" />
												</c:if>



											</del>
										</h6>
									</div>
									<!-- <div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
								</div> -->
								</div>
							</div>
						</div>
					</c:forEach>




					<!-- <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-2.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>

								</div>

							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star-half-alt text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-3.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star-half-alt text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-4.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">

								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-5.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-6.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star-half-alt text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-7.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star-half-alt text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-8.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<span class="badge bg-warning">NEW</span> <img
									class="img-fluid w-100" src="resources/user/img/product-9.jpg"
									alt="">
								<div class="product-action">
									<a class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-shopping-cart"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-sync-alt"></i></a> <a
										class="btn btn-outline-dark btn-square" href=""><i
										class="fa fa-search"></i></a>
								</div>
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div
									class="d-flex align-items-center justify-content-center mb-1">
									<small class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="fa fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small
										class="far fa-star text-primary mr-1"></small> <small>(99)</small>
								</div>
							</div> -->
				</div>
			</div>
			<div class="col-12">
				<div>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</div>
				<!-- <nav>
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav> -->
			</div>
		</div>
	</div>
	<!-- Shop Product End -->
	</div>
	</div>
	<!-- Shop End -->
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
