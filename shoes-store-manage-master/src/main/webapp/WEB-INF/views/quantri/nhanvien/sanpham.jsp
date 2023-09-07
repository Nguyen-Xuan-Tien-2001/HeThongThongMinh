<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Header -->
<%@include file="/WEB-INF/views/quantri/include/header.jsp"%>
<!-- Header end -->

<!-- Sidebar -->
<%@include file="/WEB-INF/views/quantri/include/sidebar-nv.jsp"%>
<!-- Sidebar end -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<ol class="breadcrumb ">
						<li class="breadcrumb-item"><a href="nhanvien/tongquan">Quản
								lý</a></li>
						<li class="breadcrumb-item active">Sản phẩm</li>
					</ol>
				</div>
				<div class="col-sm-6"></div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card">
						<div class="card-header ">
							<div class="d-flex justify-content-between">
								<h3 class="mt-2">Danh sách sản phẩm</h3>

								<button type="submit" class="btn bg-primary  mt-2"
									data-toggle="modal" data-target="#modal-add-new">
									<i class="fas fa-plus mr-2"></i>Thêm sản phẩm mới
								</button>
							</div>
							<div>

								<div>
									<c:choose>
										<c:when test="${isSuccess }">
											<div
												class="mt-2 alert alert-success alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
										<c:when test="${isSuccess == false }">
											<div
												class="mt-2 alert alert-danger alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
									</c:choose>

								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="bangsanpham"
								class="table table-hover table-bordered table-striped text-center">
								<thead class="bg-primary">
									<tr>
										<th>Mã SP</th>
										<th>Hình ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá</th>
										<th>Giảm</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sp" items="${danhSachSanPham }">
										<tr>
											<td>${sp.getMaSP() }</td>
											<td class="text-center"><a
												href="${sp.getHinhAnh() }"
												data-toggle="lightbox"><img
													src="${sp.getHinhAnh() }"
													alt="Product Image" class="img-size-50" /></a></td>
											<td>${sp.getTenSP() }</td>
											<td>${sp.getDanhMuc().getTenDM() }</td>
											<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${sp.getGia()}" type="currency" currencySymbol="vnđ" /></td>
											</td>

											<td>${sp.getGiamGia() }</td>

											<td>
												<div class="d-flex justify-content-between px-2">
													<a class="" href="nhanvien/sanpham/${sp.getMaSP()}?thongtin"><i
														class="fas fa-info-circle"></i> </a> <a class=""
														href="nhanvien/sanpham/${sp.getMaSP()}?suaThongtin"><i
														class="fas fa-edit"></i> </a> <a class=""
														href="nhanvien/sanpham/${sp.getMaSP()}?thongtinchitiet">
														<i class="fas fa-pen-square"></i>
													</a>

												</div>

											</td>
										</tr>
									</c:forEach>


								</tbody>
								<!-- <tfoot class="bg-primary">
                      <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                      </tr>
                    </tfoot> -->
							</table>

						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.row -->

		</div>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="modal-info-ctsp"
	isShow="${isOpenModalInfoct }">
	<form action="">
		<div class="modal-dialog modal-xl role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary">
					<h5 class="modal-title" id="exampleModalLabel">Sửa chi tiết
						sản phẩm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">

					<table class="table table-hover table-striped">
						<thead class="bg-primary">
							<th>Mã chi tiết</th>
							<th>Hình ảnh</th>
							<th>Màu sản phẩm</th>
							<th>Size sản phẩm</th>
							<th>Số lượng</th>
							<th>Thao tác</th>
						</thead>
						<tbody>
							<c:forEach var="ctsp" items="${danhSachChiTietSanPham }">
								<tr>
									<td>${ctsp.getMaChiTietSP() }</td>
									<td class="text-center"><a
										href="${ctsp.getSanPham().getHinhAnh() }"
										data-toggle="lightbox"><img
											src="${ctsp.getSanPham().getHinhAnh() }"
											alt="Product Image" class="img-size-50" /></a></td>
									<td>${ctsp.getSanPham().getMauSanPham().getTenMau() }</td>
									<td>${ctsp.getSizeSanPham().getTenSize() }</td>
									<td>${ctsp.getSoLuong() }</td>

									<td><%-- <a class="" href=""
										data-delete="${ctsp.getMaChiTietSP() }" data-toggle="modal"
										data-target="#exampleModalDisable1"> <i
											class="fas fa-trash-alt"></i>
									</a> --%><c:choose>
											<c:when test="${ ctsp.getSoLuong()== 0}">
												<a class="" href="" data-delete="${ctsp.getMaChiTietSP() }"
													data-toggle="modal" data-target="#exampleModalDisable1">
													<i class="fas fa-trash-alt"></i>
												</a>
											</c:when>
										</c:choose></td>
								</tr>
							</c:forEach>


						</tbody>
						<p class="text-danger">${xoactsp }</p>

					</table>
				</div>
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade " id="exampleModalDisable1" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa chi tiết sản
					phẩm này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form action="nhanvien/sanpham?xoactsp" method="post">
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maChiTietSP" id="input-delete-ctsp"
						value="" hidden />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="submit" class="btn btn-danger">Xóa</button>
				</div>
			</form:form>

		</div>
	</div>
</div>


<div class="modal fade" id="modal-info-detail-sanpham"
	isShow="${isOpenModalInfo }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thông
					tin sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-primary">
				<div>

					<p>Mã sản phẩm:&nbsp;${thongTinSP.getMaSP() }</p>
					<p>
						Hình ảnh &nbsp;&nbsp;<img
							src="${thongTinSP.getHinhAnh() }" width="250px">
					</p>
					<p>Tên sản phẩm&nbsp;${thongTinSP.getTenSP() }</p>
					<p>
						Giá&nbsp;
						<fmt:setLocale value="vi_VN" />
						<fmt:formatNumber value="${thongTinSP.getGia()}" type="currency" maxFractionDigits="0"
							currencySymbol="đ" />
					</p>

					<p>Mô tả sản phẩm&nbsp;${thongTinSP.getMoTa() }</p>
					<p>Danh mục&nbsp;${thongTinSP.getDanhMuc().getTenDM() }</p>
					<p>Màu&nbsp;${thongTinSP.getMauSanPham().getTenMau() }</p>

				</div>
				<div>
					<table class="table table-hover table-striped text-center">
						<thead>
							<tr>
								<th class="bg-primary">Size</th>
								<th class="bg-primary">Số lượng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ctsp" items="${ thongTinSP.getChiTietSanPhams()}">
								<tr>
									<td>${ctsp.getSizeSanPham().getTenSize() }</td>
									<td>${ctsp.getSoLuong() }</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>

			</div>
			<div class="modal-footer d-flex justify-content-between">
				<!-- <button type="button" class="btn" style="background-color: none; border-color: rgb(0, 109, 172);" data-dismiss="modal">Đóng</button> -->
				<!-- <button type="button" class="btn btn-primary" >Đóng</button> -->
			</div>
		</div>
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thêm
					sản phẩm mới</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form action="nhanvien/sanpham?themSP" class="form-horizontal"
					method="post" modelAttribute="sanPhamMoi"
					enctype="multipart/form-data">
					<div class="row">


						<div class="col-md-12">
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Tên
									sản phẩm </label>
								<div class="col-sm-10">
									<form:input path="tenSP" class="form-control" />
									<form:errors path="tenSP" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Danh
									mục</label>
								<form:select path="danhMuc.maDM"
									items="${danhSachDanhMucSanPham }"
									class="form-control form-select" itemValue="maDM"
									itemLabel="tenDM"></form:select>
								<form:errors path="danhMuc.maDM" cssClass="text-danger" />
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Phái</label>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="True" label="Nam"
											class="form-check-input" checked="checked" />

									</div>
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="False" label="Nữ"
											class="form-check-input" />
									</div>
									<form:errors path="phai" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Mô
									tả </label>
								<div class="col-sm-10">
									<form:input path="moTa" class="form-control" />
									<form:errors path="moTa" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giá </label>
								<div class="col-sm-10">
									<form:input path="gia" class="form-control" />
									<form:errors path="gia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giảm giá </label>
								<div class="col-sm-10">
									<form:input path="giamGia" class="form-control" />
									<form:errors path="giamGia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Màu</label>
								<form:select path="mauSanPham.maMau" items="${danhSachMau }"
									class="form-control form-select" itemValue="maMau"
									itemLabel="tenMau"></form:select>

							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" name="size" alt="Checkbox"
										value="${size.getMaSize() }">


									<label for="vehicle1" class="mr-3">${size.getTenSize()} </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>

							<!--  <div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" id="vehicle1" name="size" value="maSize">
									<label for="vehicle1">"${size.getTenSize()}" </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>-->

							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img id="modal-update-avatar"
											class="profile-user-img img-fluid img-circle"
											src="${hinh }" alt="User profile picture"
											style="width: 120px;" />
									</div>
									<input name="anhMoi" type="file" id="input-update-avatar"
										class="mt-3 form-control" />



								</div>
								<!-- /.card-body -->
							</div>

							<div class="form-group row d-flex justify-content-end">
								<button type="submit" class="btn btn-primary">Thêm</button>
								<a href="nhanvien/sanpham" id="cancel-save-modal"
									class="mx-2 btn btn-secondary">Hủy</a>
							</div>

						</div>
					</div>

				</form:form>

			</div>

		</div>
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade" id="modal-edit-sanpham"
	isShow="${isOpenModalEdit }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Sửa thông tin sản phẩm</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="">
							<div class="card-header p-2">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active"
										href="#activity" data-toggle="tab">Thông tin sản phẩm</a></li>

								</ul>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content">
									<div class="active tab-pane" id="activity">
										<!-- Info profile -->

										<form:form
											action="nhanvien/sanpham/${thongTinSP.getMaSP() }?suaSP"
											class="form-horizontal" modelAttribute="thongTinSP"
											enctype="multipart/form-data">

											<div class="row">
												<div class="col-md-4">
													<!-- Profile Image -->
													<div class="card card-primary card-outline">
														<div class="card-body box-profile">
															<div class="text-center">
																<img id="modal-update-avatar"
																	class="profile-user-img img-fluid img-circle"
																	src="${thongTinSP.getHinhAnh() }"
																	alt="User profile picture" style="width: 120px;" />
															</div>
															<input name="anhMoi" type="file" id="input-update-avatar"
																class="mt-3 form-control" />



														</div>
														<!-- /.card-body -->
													</div>
													<!-- /.card -->
												</div>

												<div class="col-md-8">
													<div class="card">
														<div class="card-body text-primary">

															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Tên
																	sản phẩm </label>
																<div class="col-sm-10">
																	<form:input path="tenSP" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="tenSP" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Danh
																	mục</label>
																<form:select path="danhMuc.maDM"
																	items="${danhSachDanhMucSanPham }"
																	class="form-control form-select" itemValue="maDM"
																	itemLabel="tenDM" id="" placeholder=""></form:select>
																<form:errors path="danhMuc.maDM" cssClass="text-danger" />
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Phái</label>
																<div class="col-sm-10">
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="True" label="Nam"
																			class="form-check-input" checked="checked" />

																	</div>
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="False" label="Nữ"
																			class="form-check-input" />
																	</div>
																	<form:errors path="phai" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Mô
																	tả </label>
																<div class="col-sm-10">
																	<form:input path="moTa" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="moTa" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills" class="col-sm-2 col-form-label">Giá
																</label>
																<div class="col-sm-10">
																	<form:input path="gia" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="gia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills" class="col-sm-2 col-form-label">Giảm
																	giá </label>
																<div class="col-sm-10">
																	<form:input path="giamGia" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="giamGia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Màu</label>
																<form:select path="mauSanPham.maMau"
																	items="${danhSachMau }"
																	class="form-control form-select" itemValue="maMau"
																	itemLabel="tenMau"></form:select>

															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class=" d-flex justify-content-end">
														<button type="submit" class="btn btn-primary">Sửa</button>
														<a href="nhanvien/sanpham" id="cancel-update-modal"
															class="mx-2 btn btn-secondary">Hủy</a>
													</div>
												</div>

											</div>

										</form:form>
										<!-- /.Info profile -->
									</div>
									<!-- /.tab-pane -->


									<div class="tab-pane" id="settings">
										<form class="form-horizontal" method="post"
											action="nhanvien/nhanvien/${thongTinNV.getMaNV() }?resetmatkhau">
											<div class="form-group row">
												<div class=" col-sm-10">
													<input type="text" name="maNV"
														value="${thongTinNV.getMaNV() }" hidden />
												</div>
											</div>
											<div class="form-group row">
												<div class=" col-sm-10">
													<button type="submit" name="resetmatkhau"
														class="btn bg-danger" id="btn-reset-mk">Reset mật
														khẩu</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<!-- Modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-times"></i> Bạn muốn xóa chi tiết này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- <div class="modal-body">
                
              </div> -->
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger">Xóa</button>
			</div>
		</div>
	</div>
</div>
<button type="button" class="btn btn-primary">Lưu thay đổi</button>
</div>
</div>
</div>

<div class="modal fade" id="modal-edit1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Sửa
					chi tiết</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="inputEmail4">Mã chi tiết</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="M38789792">
					</div>
					<div class="form-group">
						<label for="inputEmail4">Thêm hình ảnh </label>
						<button type="submit" class="btn bg-dark">
							<i class="fas fa-upload"></i>
						</button>
					</div>
					<div class="form-group">
						<label for="inputAddress">Số lượng</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="300">
					</div>

					<div class="form-group">
						<label for="inputPassword4">Mã màu</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>
					<div class="form-group">
						<label for="inputPassword4">Mã size</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>

				</form>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#modal-delete">Xóa chi tiết</button>
				-->

				<!-- Modal mở -->
				<div class="modal fade " id="exampleModalConfirm" tabindex="-1"
					aria-labelledby="exampleModalConfirm" aria-hidden="true">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header bg-primary">
								<h5 class="modal-title" id="exampleModalLabel">
									<i class="fas fa-lock-open"></i>&nbsp; Bạn muốn mở hoạt động
									tài khoản này?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- <div class="modal-body">
            <p class="text-center">Bạn muốn mở hoạt động tài khoản này?</p>
          </div> -->
							<div class="modal-footer d-flex justify-content-end">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Tiếp tục</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
				<!-- Footer end -->






				<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Header -->
<%@include file="/WEB-INF/views/quantri/include/header.jsp"%>
<!-- Header end -->

<!-- Sidebar -->
<%@include file="/WEB-INF/views/quantri/include/sidebar-ql.jsp"%>
<!-- Sidebar end -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<ol class="breadcrumb ">
						<li class="breadcrumb-item"><a href="quanly/tongquan">Quản
								lý</a></li>
						<li class="breadcrumb-item active">Sản phẩm</li>
					</ol>
				</div>
				<div class="col-sm-6"></div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card">
						<div class="card-header ">
							<div class="d-flex justify-content-between">
								<h3 class="mt-2">Danh sách sản phẩm</h3>

								<button type="submit" class="btn bg-primary  mt-2"
									data-toggle="modal" data-target="#modal-add-new">
									<i class="fas fa-plus mr-2"></i>Thêm sản phẩm mới
								</button>
							</div>
							<div>

								<div>
									<c:choose>
										<c:when test="${isSuccess }">
											<div
												class="mt-2 alert alert-success alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
										<c:when test="${isSuccess == false }">
											<div
												class="mt-2 alert alert-danger alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
									</c:choose>

								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="bangsanpham"
								class="table table-hover table-bordered table-striped text-center">
								<thead class="bg-primary">
									<tr>
										<th>Mã SP</th>
										<th>Hình ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá</th>
										<th>Giảm</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sp" items="${danhSachSanPham }">
										<tr>
											<td>${sp.getMaSP() }</td>
											<td class="text-center"><a
												href="${sp.getHinhAnh() }"
												data-toggle="lightbox"><img
													src="${sp.getHinhAnh() }"
													alt="Product Image" class="img-size-50" /></a></td>
											<td>${sp.getTenSP() }</td>
											<td>${sp.getDanhMuc().getTenDM() }</td>
											<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${sp.getGia()}" type="currency" currencySymbol="vnđ" /></td>
											</td>

											<td>${sp.getGiamGia() }</td>

											<td>
												<div class="d-flex justify-content-between px-2">

													<a class="" href="nhanvien/sanpham/${sp.getMaSP()}?thongtin"><i
														class="fas fa-info-circle"></i> </a> <a class=""
														href="nhanvien/sanpham/${sp.getMaSP()}?suaThongtin"><i
														class="fas fa-edit"></i> </a> <a class=""
														href="nhanvien/sanpham/${sp.getMaSP()}?thongtinchitiet">
														<i class="fas fa-pen-square"></i>
													</a>

												</div>

											</td>
										</tr>
									</c:forEach>


								</tbody>
								<!-- <tfoot class="bg-primary">
                      <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                      </tr>
                    </tfoot> -->
							</table>

						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.row -->

		</div>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="modal-info-ctsp"
	isShow="${isOpenModalInfoct }">
	<form action="">
		<div class="modal-dialog modal-xl role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary">
					<h5 class="modal-title" id="exampleModalLabel">Sửa chi tiết
						sản phẩm</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">

					<table class="table table-hover table-striped">
						<thead class="bg-primary">
							<th>Mã chi tiết</th>
							<th>Hình ảnh</th>
							<th>Màu sản phẩm</th>
							<th>Size sản phẩm</th>
							<th>Số lượng</th>
							<th>Thao tác</th>
						</thead>
						<tbody>
							<c:forEach var="ctsp" items="${danhSachChiTietSanPham }">
								<tr>
									<td>${ctsp.getMaChiTietSP() }</td>
									<td class="text-center"><a
										href="${ctsp.getSanPham().getHinhAnh() }"
										data-toggle="lightbox"><img
											src="${ctsp.getSanPham().getHinhAnh() }"
											alt="Product Image" class="img-size-50" /></a></td>
									<td>${ctsp.getSanPham().getMauSanPham().getTenMau() }</td>
									<td>${ctsp.getSizeSanPham().getTenSize() }</td>
									<td>${ctsp.getSoLuong() }</td>

									<td><a class="" href=""
										data-delete="${ctsp.getMaChiTietSP() }" data-toggle="modal"
										data-target="#exampleModalDisable1"> <i
											class="fas fa-trash-alt"></i>
									</a></td>
								</tr>
							</c:forEach>


						</tbody>
						<p class="text-danger">${xoactsp }</p>

					</table>
				</div>
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade " id="exampleModalDisable1" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa chi tiết sản
					phẩm này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form action="nhanvien/sanpham?xoactsp" method="post">
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maChiTietSP" id="input-delete-ctsp"
						value="" hidden />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="submit" class="btn btn-danger">Xóa</button>
				</div>
			</form:form>

		</div>
	</div>
</div>


<div class="modal fade" id="modal-info-detail-sanpham"
	isShow="${isOpenModalInfo }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thông
					tin sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-primary">
				<div>

					<p>Mã sản phẩm:&nbsp;${thongTinSP.getMaSP() }</p>
					<p>
						Hình ảnh &nbsp;&nbsp;<img
							src="${thongTinSP.getHinhAnh() }" width="250px">
					</p>
					<p>Tên sản phẩm&nbsp;${thongTinSP.getTenSP() }</p>
					<p>
						Giá&nbsp;
						<fmt:setLocale value="vi_VN" />
						<fmt:formatNumber value="${thongTinSP.getGia()}" type="currency"
							currencySymbol="vnđ" />
					</p>

					<p>Mô tả sản phẩm&nbsp;${thongTinSP.getMoTa() }</p>
					<p>Danh mục&nbsp;${thongTinSP.getDanhMuc().getTenDM() }</p>
					<p>Màu&nbsp;${thongTinSP.getMauSanPham().getTenMau() }</p>

				</div>
				<div>
					<table class="table table-hover table-striped text-center">
						<thead>
							<tr>
								<th class="bg-primary">Size</th>
								<th class="bg-primary">Số lượng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ctsp" items="${ thongTinSP.getChiTietSanPhams()}">
								<tr>
									<td>${ctsp.getSizeSanPham().getTenSize() }</td>
									<td>${ctsp.getSoLuong() }</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>

			</div>
			<div class="modal-footer d-flex justify-content-between">
				<!-- <button type="button" class="btn" style="background-color: none; border-color: rgb(0, 109, 172);" data-dismiss="modal">Đóng</button> -->
				<!-- <button type="button" class="btn btn-primary" >Đóng</button> -->
			</div>
		</div>
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thêm
					sản phẩm mới</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form action="nhanvien/sanpham?themSP" class="form-horizontal"
					method="post" modelAttribute="sanPhamMoi"
					enctype="multipart/form-data">
					<div class="row">


						<div class="col-md-12">
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Tên
									sản phẩm </label>
								<div class="col-sm-10">
									<form:input path="tenSP" class="form-control" />
									<form:errors path="tenSP" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Danh
									mục</label>
								<form:select path="danhMuc.maDM"
									items="${danhSachDanhMucSanPham }"
									class="form-control form-select" itemValue="maDM"
									itemLabel="tenDM"></form:select>
								<form:errors path="danhMuc.maDM" cssClass="text-danger" />
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Phái</label>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="True" label="Nam"
											class="form-check-input" checked="checked" />

									</div>
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="False" label="Nữ"
											class="form-check-input" />
									</div>
									<form:errors path="phai" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Mô
									tả </label>
								<div class="col-sm-10">
									<form:input path="moTa" class="form-control" />
									<form:errors path="moTa" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giá </label>
								<div class="col-sm-10">
									<form:input path="gia" class="form-control" />
									<form:errors path="gia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giảm giá </label>
								<div class="col-sm-10">
									<form:input path="giamGia" class="form-control" />
									<form:errors path="giamGia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Màu</label>
								<form:select path="mauSanPham.maMau" items="${danhSachMau }"
									class="form-control form-select" itemValue="maMau"
									itemLabel="tenMau"></form:select>

							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" name="size" alt="Checkbox"
										value="${size.getMaSize() }">


									<label for="vehicle1">"${size.getTenSize()}" </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>

							<!--  <div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" id="vehicle1" name="size" value="maSize">
									<label for="vehicle1">"${size.getTenSize()}" </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>-->

							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img id="modal-update-avatar"
											class="profile-user-img img-fluid img-circle"
											src="${hinh }" alt="User profile picture"
											style="width: 120px;" />
									</div>
									<input name="anhMoi" type="file" id="input-update-avatar"
										class="mt-3 form-control" />



								</div>
								<!-- /.card-body -->
							</div>

							<div class="form-group row d-flex justify-content-end">
								<button type="submit" class="btn btn-primary">Thêm</button>
								<a href="nhanvien/sanpham" id="cancel-save-modal"
									class="mx-2 btn btn-secondary">Hủy</a>
							</div>

						</div>
					</div>

				</form:form>

			</div>

		</div>
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade" id="modal-edit-sanpham"
	isShow="${isOpenModalEdit }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Sửa thông tin sản phẩm</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="">
							<div class="card-header p-2">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active"
										href="#activity" data-toggle="tab">Thông tin sản phẩm</a></li>

								</ul>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content">
									<div class="active tab-pane" id="activity">
										<!-- Info profile -->

										<form:form
											action="nhanvien/sanpham/${thongTinSP.getMaSP() }?suaSP"
											class="form-horizontal" modelAttribute="thongTinSP"
											enctype="multipart/form-data">

											<div class="row">
												<div class="col-md-4">
													<!-- Profile Image -->
													<div class="card card-primary card-outline">
														<div class="card-body box-profile">
															<div class="text-center">
																<img id="modal-update-avatar"
																	class="profile-user-img img-fluid img-circle"
																	src="${thongTinSP.getHinhAnh() }"
																	alt="User profile picture" style="width: 120px;" />
															</div>
															<input name="anhMoi" type="file" id="input-update-avatar"
																class="mt-3 form-control" />



														</div>
														<!-- /.card-body -->
													</div>
													<!-- /.card -->
												</div>

												<div class="col-md-8">
													<div class="card">
														<div class="card-body text-primary">

															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Tên
																	sản phẩm </label>
																<div class="col-sm-10">
																	<form:input path="tenSP" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="tenSP" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Danh
																	mục</label>
																<form:select path="danhMuc.maDM"
																	items="${danhSachDanhMucSanPham }"
																	class="form-control form-select" itemValue="maDM"
																	itemLabel="tenDM" id="" placeholder=""></form:select>
																<form:errors path="danhMuc.maDM" cssClass="text-danger" />
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Phái</label>
																<div class="col-sm-10">
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="True" label="Nam"
																			class="form-check-input" checked="checked" />

																	</div>
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="False" label="Nữ"
																			class="form-check-input" />
																	</div>
																	<form:errors path="phai" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Mô
																	tả </label>
																<div class="col-sm-10">
																	<form:input path="moTa" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="moTa" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills" class="col-sm-2 col-form-label">Giá
																</label>
																<div class="col-sm-10">
																	<form:input path="gia" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="gia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills" class="col-sm-2 col-form-label">Giảm
																	giá </label>
																<div class="col-sm-10">
																	<form:input path="giamGia" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="giamGia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Màu</label>
																<form:select path="mauSanPham.maMau"
																	items="${danhSachMau }"
																	class="form-control form-select" itemValue="maMau"
																	itemLabel="tenMau"></form:select>

															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class=" d-flex justify-content-end">
														<button type="submit" class="btn btn-primary">Sửa</button>
														<a href="nhanvien/sanpham" id="cancel-update-modal"
															class="mx-2 btn btn-secondary">Hủy</a>
													</div>
												</div>

											</div>

										</form:form>
										<!-- /.Info profile -->
									</div>
									<!-- /.tab-pane -->


									<div class="tab-pane" id="settings">
										<form class="form-horizontal" method="post"
											action="nhanvien/nhanvien/${thongTinNV.getMaNV() }?resetmatkhau">
											<div class="form-group row">
												<div class=" col-sm-10">
													<input type="text" name="maNV"
														value="${thongTinNV.getMaNV() }" hidden />
												</div>
											</div>
											<div class="form-group row">
												<div class=" col-sm-10">
													<button type="submit" name="resetmatkhau"
														class="btn bg-danger" id="btn-reset-mk">Reset mật
														khẩu</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<!-- Modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-times"></i> Bạn muốn xóa chi tiết này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- <div class="modal-body">
                
              </div> -->
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger">Xóa</button>
			</div>
		</div>
	</div>
</div>
<button type="button" class="btn btn-primary">Lưu thay đổi</button>
</div>
</div>
</div>

<div class="modal fade" id="modal-edit1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Sửa
					chi tiết</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="inputEmail4">Mã chi tiết</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="M38789792">
					</div>
					<div class="form-group">
						<label for="inputEmail4">Thêm hình ảnh </label>
						<button type="submit" class="btn bg-dark">
							<i class="fas fa-upload"></i>
						</button>
					</div>
					<div class="form-group">
						<label for="inputAddress">Số lượng</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="300">
					</div>

					<div class="form-group">
						<label for="inputPassword4">Mã màu</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>
					<div class="form-group">
						<label for="inputPassword4">Mã size</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>

				</form>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#modal-delete">Xóa chi tiết</button>
				-->

				<!-- Modal mở -->
				<div class="modal fade " id="exampleModalConfirm" tabindex="-1"
					aria-labelledby="exampleModalConfirm" aria-hidden="true">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header bg-primary">
								<h5 class="modal-title" id="exampleModalLabel">
									<i class="fas fa-lock-open"></i>&nbsp; Bạn muốn mở hoạt động
									tài khoản này?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- <div class="modal-body">
            <p class="text-center">Bạn muốn mở hoạt động tài khoản này?</p>
          </div> -->
							<div class="modal-footer d-flex justify-content-end">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Tiếp tục</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
				<!-- Footer end -->






				<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Header -->
<%@include file="/WEB-INF/views/quantri/include/header.jsp"%>
<!-- Header end -->

<!-- Sidebar -->
<%@include file="/WEB-INF/views/quantri/include/sidebar-ql.jsp"%>
<!-- Sidebar end -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<ol class="breadcrumb ">
						<li class="breadcrumb-item"><a href="quanly/tongquan">Quản
								lý</a></li>
						<li class="breadcrumb-item active">Sản phẩm</li>
					</ol>
				</div>
				<div class="col-sm-6"></div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card">
						<div class="card-header ">
							<div class="d-flex justify-content-between">
								<h3 class="mt-2">Danh sách sản phẩm</h3>

								<button type="submit" class="btn bg-primary  mt-2"
									data-toggle="modal" data-target="#modal-add-new">
									<i class="fas fa-plus mr-2"></i>Thêm sản phẩm mới
								</button>
							</div>
							<div>

								<div>
									<c:choose>
										<c:when test="${isSuccess }">
											<div
												class="mt-2 alert alert-success alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
										<c:when test="${isSuccess == false }">
											<div
												class="mt-2 alert alert-danger alert-dismissible fade show"
												role="alert">
												${alertMessage }
												<button type="button" class="close" data-dismiss="alert"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
										</c:when>
									</c:choose>

								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="bangsanpham"
								class="table table-hover table-bordered table-striped text-center">
								<thead class="bg-primary">
									<tr>
										<th>Mã SP</th>
										<th>Hình ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá</th>
										<th>Giảm</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sp" items="${danhSachSanPham }">
										<tr>
											<td>${sp.getMaSP() }</td>
											<td class="text-center"><a
												href="${sp.getHinhAnh() }"
												data-toggle="lightbox"><img
													src="${sp.getHinhAnh() }"
													alt="Product Image" class="img-size-50" /></a></td>
											<td>${sp.getTenSP() }</td>
											<td>${sp.getDanhMuc().getTenDM() }</td>
											<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${sp.getGia()}" type="currency" currencySymbol="vnđ" /></td>
											</td>

											<td>${sp.getGiamGia() }</td>

											<td>
												<div class="d-flex justify-content-between px-2">

													<a class="" href="quanly/sanpham/${sp.getMaSP()}?thongtin"><i
														class="fas fa-info-circle"></i> </a> <a class="" 
														href="quanly/sanpham/${sp.getMaSP()}?suaThongtin"
														><i class="fas fa-edit"></i> </a> <a class="" href="#"
														data-toggle="modal" data-target="#exampleModalConfirm">
														<i class="fas fa-folder-plus"></i>
													</a> <a class="" href="#" data-toggle="modal"
														data-target="#exampleModal"> <i
														class="fas fa-pen-square"></i>
													</a>
													<!-- <a class="" href="#" data-toggle="modal" data-target="#exampleModalDisable"><i class="fas fa-lock"></i> </a> -->
												</div>

											</td>
										</tr>
									</c:forEach>


								</tbody>
								<!-- <tfoot class="bg-primary">
                      <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                      </tr>
                    </tfoot> -->
							</table>

						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.row -->

		</div>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl role="document">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h5 class="modal-title" id="exampleModalLabel">Sửa chi tiết sản
					phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">

				<table class="table table-hover table-striped">
					<thead class="bg-primary">
						<th>STT</th>
						<th>Mã chi tiết</th>
						<th>Hình ảnh</th>
						<th>Mã màu</th>
						<th>Mã size</th>
						<th>Số lượng</th>
						<th>Thao tác</th>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>SP1</td>
							<td class="d-flex justify-content-center"><img
								src="https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7348553c641f4da7b881adf80119295a_9366/Giay_NMD_V3_DJen_GX3373_01_standard.jpg"
								width="40px" height="40px"></td>
							<td>Black</td>
							<td>40</td>
							<td>100</td>
							<td>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#modal-edit1">
									<i class="far fa-edit"></i>
								</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>SP1</td>
							<td class="d-flex justify-content-center"><img
								src="https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7348553c641f4da7b881adf80119295a_9366/Giay_NMD_V3_DJen_GX3373_01_standard.jpg"
								width="40px" height="40px"></td>
							<td>Black</td>
							<td>40</td>
							<td>100</td>
							<td>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#modal-edit1">
									<i class="far fa-edit"></i>
								</button>
							</td>
						</tr>
						<tr>
							<td>1</td>
							<td>SP1</td>
							<td class="d-flex justify-content-center"><img
								src="https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7348553c641f4da7b881adf80119295a_9366/Giay_NMD_V3_DJen_GX3373_01_standard.jpg"
								width="40px" height="40px"></td>
							<td>Black</td>
							<td>40</td>
							<td>100</td>
							<td>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#modal-edit1">
									<i class="far fa-edit"></i>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-primary">Lưu thay đổi</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal edit1 -->
<div class="modal fade" id="modal-edit1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h5 class="modal-title" id="exampleModalLabel">Sửa chi tiết</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="inputEmail4">Mã chi tiết</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="M38789792">
					</div>
					<div class="form-group">
						<label for="inputEmail4">Hình ảnh </label>
						<button type="submit" class="btn bg-dark">
							<i class="fas fa-upload"></i>
						</button>
					</div>
					<img
						src="https://images.unsplash.com/photo-1533119408463-b0f487583ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"
						width="150px">
					<div class="form-group">
						<label for="inputAddress">Số lượng</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="300">
					</div>

					<div class="form-group">
						<label for="inputPassword4">Mã màu</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>
					<div class="form-group">
						<label for="inputPassword4">Mã size</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>

				</form>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#modal-delete">Xóa chi tiết</button>
				<button type="button" class="btn btn-primary">Lưu thay đổi</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal edit1 -->

<!-- Modal -->
<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-times"></i> &nbsp; Bạn muốn xóa chi tiết sản phẩm
					này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- <div class="modal-body">
        ...
      </div> -->
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-danger">Xóa</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-info-detail-sanpham"
	isShow="${isOpenModalInfo }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thông
					tin sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body text-primary">
				<div>

					<p>Mã sản phẩm:&nbsp;${thongTinSP.getMaSP() }</p>
					<p>
						Hình ảnh &nbsp;&nbsp;<img
							src="https://images.unsplash.com/photo-1533119408463-b0f487583ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"
							width="250px">
					</p>
					<p>Tên sản phẩm&nbsp;${thongTinSP.getTenSP() }</p>
					<p>
						Giá&nbsp;
						<fmt:setLocale value="vi_VN" />
						<fmt:formatNumber value="${thongTinSP.getGia()}" type="currency"
							currencySymbol="vnđ" />
					</p>

					<p>Mô tả sản phẩm&nbsp;${thongTinSP.getMoTa() }</p>
					<p>Danh mục&nbsp;${thongTinSP.getDanhMuc().getTenDM() }</p>
					<p>Màu&nbsp;${thongTinSP.getMauSanPham().getTenMau() }</p>

				</div>
				<div>
					<table class="table table-hover table-striped text-center">
						<thead>
							<tr>
								<th class="bg-primary">Size</th>
								<th class="bg-primary">Số lượng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ctsp" items="${ thongTinSP.getChiTietSanPhams()}">
								<tr>
									<td>${ctsp.getSizeSanPham().getTenSize() }</td>
									<td>${ctsp.getSoLuong() }</td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>

			</div>
			<div class="modal-footer d-flex justify-content-between">
				<!-- <button type="button" class="btn" style="background-color: none; border-color: rgb(0, 109, 172);" data-dismiss="modal">Đóng</button> -->
				<!-- <button type="button" class="btn btn-primary" >Đóng</button> -->
			</div>
		</div>
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-dialog modal-dialog-scrollable modal-lg"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thêm
					sản phẩm mới</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form action="quanly/sanpham?themSP" class="form-horizontal"
					method="post" modelAttribute="sanPhamMoi"
					enctype="multipart/form-data">
					<div class="row">


						<div class="col-md-12">
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Tên
									sản phẩm </label>
								<div class="col-sm-10">
									<form:input path="tenSP" class="form-control" />
									<form:errors path="tenSP" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Danh
									mục</label>
								<form:select path="danhMuc.maDM"
									items="${danhSachDanhMucSanPham }"
									class="form-control form-select" itemValue="maDM"
									itemLabel="tenDM"></form:select>
								<form:errors path="danhMuc.maDM" cssClass="text-danger" />
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Phái</label>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="True" label="Nam"
											class="form-check-input" checked="checked" />

									</div>
									<div class="form-check form-check-inline">
										<form:radiobutton path="phai" value="False" label="Nữ"
											class="form-check-input" />
									</div>
									<form:errors path="phai" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Mô
									tả </label>
								<div class="col-sm-10">
									<form:input path="moTa" class="form-control" />
									<form:errors path="moTa" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giá </label>
								<div class="col-sm-10">
									<form:input path="gia" class="form-control" />
									<form:errors path="gia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSkills"
									class="col-sm-2 col-form-label text-primary">Giảm giá </label>
								<div class="col-sm-10">
									<form:input path="giamGia" class="form-control" />
									<form:errors path="giamGia" cssClass="text-danger" />
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label text-primary">Màu</label>
								<form:select path="mauSanPham.maMau" items="${danhSachMau }"
									class="form-control form-select" itemValue="maMau"
									itemLabel="tenMau"></form:select>

							</div>

							<div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" name="size" alt="Checkbox"
										value="${size.getMaSize() }">


									<label for="vehicle1">"${size.getTenSize()}" </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>

							<!--  <div class="form-group">
								<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
								<c:forEach var="size" items="${danhSachSize}" varStatus="status">
									<input type="checkbox" id="vehicle1" name="size" value="maSize">
									<label for="vehicle1">"${size.getTenSize()}" </label>
								</c:forEach>
								<p class="text-danger">${size }</p>

							</div>-->

							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img id="modal-update-avatar"
											class="profile-user-img img-fluid img-circle"
											src="${hinh }" alt="User profile picture"
											style="width: 120px;" />
									</div>
									<input name="anhMoi" type="file" id="input-update-avatar"
										class="mt-3 form-control" />



								</div>
								<!-- /.card-body -->
							</div>

							<div class="form-group row d-flex justify-content-end">
								<button type="submit" class="btn btn-primary">Thêm</button>
								<a href="quanly/sanpham" id="cancel-save-modal"
									class="mx-2 btn btn-secondary">Hủy</a>
							</div>

						</div>
					</div>

				</form:form>

			</div>

		</div>
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade" id="modal-edit-sanpham"
	isShow="${isOpenModalEdit }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Sửa thông tin sản phẩm</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="">
							<div class="card-header p-2">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active"
										href="#activity" data-toggle="tab">Thông tin sản phẩm</a></li>

								</ul>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content">
									<div class="active tab-pane" id="activity">
										<!-- Info profile -->

										<form:form
											action="quanly/sanpham/${thongTinSP.getMaSP() }?suaSP"
											class="form-horizontal" modelAttribute="thongTinSP"
											enctype="multipart/form-data">

											<div class="row">
												<div class="col-md-4">
													<!-- Profile Image -->
													<div class="card card-primary card-outline">
														<div class="card-body box-profile">
															<div class="text-center">
																<img id="modal-update-avatar"
																	class="profile-user-img img-fluid img-circle"
																	src="${thongTinSP.getHinhAnh() }"
																	alt="User profile picture" style="width: 120px;" />
															</div>
															<input name="anhMoi" type="file" id="input-update-avatar"
																class="mt-3 form-control" />



														</div>
														<!-- /.card-body -->
													</div>
													<!-- /.card -->
												</div>

												<div class="col-md-8">
													<div class="card">
														<div class="card-body text-primary">

															<div class="form-group row">
																<label for="" class="col-sm-2 col-form-label">Tên
																	sản phẩm </label>
																<div class="col-sm-10">
																	<form:input path="tenSP" class="form-control" id=""
																		placeholder="" />
																	<form:errors path="tenSP" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label">Danh
																	mục</label>
																<form:select path="danhMuc.maDM"
																	items="${danhSachDanhMucSanPham }"
																	class="form-control form-select" itemValue="maDM"
																	itemLabel="tenDM" id="" placeholder=""></form:select>
																<form:errors path="danhMuc.maDM" cssClass="text-danger" />
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label">Phái</label>
																<div class="col-sm-10">
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="True" label="Nam"
																			class="form-check-input" checked="checked" />

																	</div>
																	<div class="form-check form-check-inline">
																		<form:radiobutton path="phai" value="False" label="Nữ"
																			class="form-check-input" />
																	</div>
																	<form:errors path="phai" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label">Mô
																	tả </label>
																<div class="col-sm-10">
																	<form:input path="moTa" class="form-control" id="" placeholder=""/>
																	<form:errors path="moTa" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills"
																	class="col-sm-2 col-form-label">Giá
																</label>
																<div class="col-sm-10">
																	<form:input path="gia" class="form-control" id="" placeholder=""/>
																	<form:errors path="gia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for="inputSkills"
																	class="col-sm-2 col-form-label">Giảm
																	giá </label>
																<div class="col-sm-10">
																	<form:input path="giamGia" class="form-control" id="" placeholder=""/>
																	<form:errors path="giamGia" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label">Màu</label>
																<form:select path="mauSanPham.maMau"
																	items="${danhSachMau }"
																	class="form-control form-select" itemValue="maMau"
																	itemLabel="tenMau"></form:select>

															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class=" d-flex justify-content-end">
														<button type="submit" class="btn btn-primary">Sửa</button>
														<a href="quanly/sanpham" id="cancel-update-modal"
															class="mx-2 btn btn-secondary">Hủy</a>
													</div>
												</div>

											</div>

										</form:form>
										<!-- /.Info profile -->
									</div>
									<!-- /.tab-pane -->


									<div class="tab-pane" id="settings">
										<form class="form-horizontal" method="post"
											action="quanly/nhanvien/${thongTinNV.getMaNV() }?resetmatkhau">
											<div class="form-group row">
												<div class=" col-sm-10">
													<input type="text" name="maNV"
														value="${thongTinNV.getMaNV() }" hidden />
												</div>
											</div>
											<div class="form-group row">
												<div class=" col-sm-10">
													<button type="submit" name="resetmatkhau"
														class="btn bg-danger" id="btn-reset-mk">Reset mật
														khẩu</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<div class="modal fade " id="exampleModalConfirm" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thêm
					chi tiết sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="inputEmail4">Mã chi tiết</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="M38789792">
					</div>
					<div class="form-group">
						<label for="inputEmail4">Thêm hình ảnh </label>
						<button type="submit" class="btn bg-dark">
							<i class="fas fa-upload"></i>
						</button>
					</div>
					<div class="form-group">
						<label for="inputAddress">Số lượng</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="300">
					</div>

					<div class="form-group">
						<label for="inputPassword4">Mã màu</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>
					<div class="form-group">
						<label for="inputPassword4">Mã size</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>

				</form>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn"
					style="background-color: none; border-color: rgb(0, 109, 199);"
					data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-primary">Lưu</button>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-danger">
					<h5 class="modal-title" id="exampleModalLabel">
						<i class="fas fa-times"></i> Bạn muốn xóa chi tiết này?
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- <div class="modal-body">
                
              </div> -->
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Xóa</button>
				</div>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-primary">Lưu thay đổi</button>
</div>
</div>
</div>

<div class="modal fade" id="modal-edit1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-secondary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Sửa
					chi tiết</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="inputEmail4">Mã chi tiết</label> <input type="email"
							class="form-control" id="inputEmail4" placeholder="M38789792">
					</div>
					<div class="form-group">
						<label for="inputEmail4">Thêm hình ảnh </label>
						<button type="submit" class="btn bg-dark">
							<i class="fas fa-upload"></i>
						</button>
					</div>
					<div class="form-group">
						<label for="inputAddress">Số lượng</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="300">
					</div>

					<div class="form-group">
						<label for="inputPassword4">Mã màu</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>
					<div class="form-group">
						<label for="inputPassword4">Mã size</label> <input type="password"
							class="form-control" id="inputPassword4" placeholder="ABCDEF">
					</div>

				</form>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#modal-delete">Xóa chi tiết</button>
				-->

				<!-- Modal mở -->
				<div class="modal fade " id="exampleModalConfirm" tabindex="-1"
					aria-labelledby="exampleModalConfirm" aria-hidden="true">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header bg-primary">
								<h5 class="modal-title" id="exampleModalLabel">
									<i class="fas fa-lock-open"></i>&nbsp; Bạn muốn mở hoạt động
									tài khoản này?
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- <div class="modal-body">
            <p class="text-center">Bạn muốn mở hoạt động tài khoản này?</p>
          </div> -->
							<div class="modal-footer d-flex justify-content-end">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Tiếp tục</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
				<!-- Footer end --> --%>