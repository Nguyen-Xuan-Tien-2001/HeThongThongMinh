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
<div class="content-wrapper " style="height: 100%; overflow: scroll">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-12">
					<ol class="breadcrumb ">
						<li class="breadcrumb-item"><a href="nhanvien/tongquan">Quản
								lý</a></li>
						<li class="breadcrumb-item active">Nhập hàng</li>
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
								<h3 class=" mt-2">Danh sách phiếu nhập hàng</h3>

								<button type="submit" class="btn bg-primary  mt-2"
									data-toggle="modal" data-target="#modal-add-new">
									<i class="fas fa-plus mr-2"></i>Thêm phiếu nhập mới
								</button>
							</div>
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
						<!-- /.card-header -->
						<div class="card-body">
							<table id="bangnhaphang"
								class="table table-bordered table-striped text-center">
								<thead class="bg-primary">
									<tr>
										<th>Mã phiếu nhập</th>
										<th>Tên NCC</th>
										<th>Ngày nhập</th>
										<th>Mã nhân viên</th>
										<th>Tổng tiền</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pn" items="${danhSachPhieuNhap }">
										<tr>
											<td>${pn.getMaPN() }</td>
											<td>${pn.getNhaCungCap().getTenNCC() }</td>
											<td>${pn.getThoiGian() }</td>
											<td>${pn.getNhanVien().getMaNV() }</td>
											<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
													value="${pn.getTongTien()}" type="currency"
													maxFractionDigits="0" currencySymbol="đ" /></td>

											<td>
												<div class="d-flex justify-content-between px-4">
													<a class=""
														href="nhanvien/phieunhap/${pn.getMaPN() }?thongtin"><i
														class="fas fa-info-circle"></i> </a>
													<c:if
														test="${ pn.getNhanVien().getMaNV() == user.getNhanVien().getMaNV()}">
														<a class="" href="" data-delete="${pn.getMaPN() }"
															data-toggle="modal" data-target="#exampleModalDelete">
															<i class="fas fa-trash-alt"></i>
														</a>
													</c:if>


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


<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Thêm
					phiếu nhập mới</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- 				<form method="post">
					
				</form> -->
				<form class="form-horizontal" method="post"
					action="nhanvien/phieunhap">
					<div class="form-group">
						<label for="" class="col-sm-2 col-form-label text-primary">Sản
							phẩm</label> <select name="ncc"
							class="form-control form-select select2bs4">
							<c:forEach var="ncc" items="${danhSachNhaCungCap}">
								<option value="${ncc.getMaNCC()}">${ncc.getTenNCC()}</option>
							</c:forEach>
						</select>
					</div>
					<%-- <div class="form-group">
						<label for="">Nhà cung cấp</label>
						<form:select path="nhaCungCap.maNCC"
							items="${danhSachNhaCungCap }" class="form-control form-select"
							itemValue="maNCC" itemLabel="tenNCC"></form:select>
						<form:errors path="nhaCungCap.maNCC" cssClass="text-danger" />
					</div> --%>

					<div class="modal-header bg-primary">
						<h5 class="modal-title" id="exampleModalScrollableTitle">Chi
							tiết phiếu nhập</h5>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-2 col-form-label text-primary">Sản
							phẩm</label> <select name="masp"
							class="form-control form-select select2bs4">
							<c:forEach var="sp" items="${danhSachSanPham}">
								<option value="${sp.getMaSP()}">${sp.getTenSP()}</option>
							</c:forEach>
						</select>
					</div>


					<div class="form-group">
						<label for="" class="col-sm-2 col-form-label text-primary">Size</label>
						<c:forEach var="size" items="${danhSachSize}" varStatus="status">
							<input type="radio" name="size" alt="Checkbox"
								value="${size.getMaSize() }">
							<label for="vehicle1" class="mr-3">${size.getTenSize()} </label>
						</c:forEach>
						<p class="text-danger">${size }</p>
					</div>

					<div class="form-group row">
						<label for="inputSkills"
							class="col-sm-2 col-form-label text-primary">Số lượng </label>
						<div class="col-sm-10">
							<input class="form-control" name="soluong" />
						</div>
						<p class="text-danger">${soluong }</p>
					</div>

					<div class="form-group row">
						<label for="inputSkills"
							class="col-sm-2 col-form-label text-primary">Giá </label>
						<div class="col-sm-10">
							<input class="form-control" name="gia" />
						</div>
						<p class="text-danger">${gia }</p>
					</div>

					<div class="form-group d-flex justify-content-end">
						<button type="submit" name="themCTPN" class="btn btn-primary">Thêm
							chi tiết</button>
					</div>


					<section class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-12">

									<div class="card">
										<div class="card-header ">
											<div class="d-flex justify-content-between">
												<h3 class="mt-2">Danh sách chi tiết sản phẩm</h3>
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
														<th>Tên sản phẩm</th>
														<th>Size</th>
														<th>Số lương</th>
														<th>Giá</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ctpn" items="${danhSachThongTinCTPN }">
														<tr>
															<td>${ctpn.getTenSP() }</td>
															<td>${ctpn.getTenSize() }</td>
															<td>${ctpn.getSoLuong() }</td>
															<td>${ctpn.getGia() }</td>


															<td>
																<div class="d-flex justify-content-between px-2">
																	<a class="" href=""
																		data-delete="${ctpn.getMaTTCTPN() }"
																		data-toggle="modal" data-target="#exampleModalDisable">
																		<i class="fas fa-trash-alt"></i>
																	</a>

																	<%-- <a class=""
																		href="quanly/thongtinctpn/${ctpn.getMaSP()}?suaThongtin">
																	</a> --%>

																	<!-- <a class="" href="#" data-toggle="modal" data-target="#exampleModalDisable"><i class="fas fa-lock"></i> </a> -->
																</div>

															</td>
														</tr>
													</c:forEach>


												</tbody>

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
					<div class="form-group d-flex justify-content-end">

						<button type="submit" name="themPN" class="btn btn-primary">Lưu</button>
						<a href="nhanvien/phieunhap?huypn" id="cancel-save-modal-phieunhap"
							class="mx-2 btn btn-secondary">Hủy</a>
					</div>

				</form>




			</div>

		</div>

	</div>
</div>
<!-- /.modal-dialog -->


<div class="modal fade " id="exampleModalDisable" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa chi tiết này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form action="nhanvien/phieunhap?xoactpn" method="post">
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maCTPN" id="input-delete-ctpn" value="" hidden />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="submit" class="btn btn-danger" name="xoaThongtin">Xóa</button>
				</div>
			</form:form>

		</div>
	</div>
</div>
<!-- /.modal -->


<div class="modal fade" id="modal-edit" isShow="${isOpenModalEdit }">
	<div class="modal-lg modal-dialog modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h5 class="modal-title" id="exampleModalScrollableTitle">Sửa
					thông tin phiếu nhập</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form class="form-horizontal" method="post"
					action="nhanvien/phieunhap/${thongTinPN.getMaPN()}?suaPN"
					modelAttribute="thongTinPN">
					<div class="form-group">
						<label for="">Nhà cung cấp</label>
						<form:select path="nhaCungCap.maNCC"
							items="${danhSachNhaCungCap }" class="form-control form-select"
							itemValue="maNCC" itemLabel="tenNCC"></form:select>
						<form:errors path="nhaCungCap.maNCC" cssClass="text-danger" />
					</div>
					<div class="form-group">
						<form:hidden path="nhanVien.maNV" class="form-control"
							value="${sessionScope['user'].getNhanVien().getMaNV() }" />
					</div>
					<div class="form-group">
						<label for="">Ngày nhập</label>
						<form:input path="thoiGian" type="date" class="form-control" />
						<form:errors path="thoiGian" cssClass="text-danger" />
					</div>
					<div class="form-group d-flex justify-content-end">

						<button type="submit" name="suaPN" class="btn btn-primary">Lưu</button>
						<a href="nhanvien/phieunhap" id="cancel-update-modal-phieunhap"
							class="mx-2 btn btn-secondary">Hủy</a>
					</div>

				</form:form>
			</div>

		</div>
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade " id="exampleModalDelete" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalDelete">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa phiếu nhập này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form action="nhanvien/phieunhap?xoapn" method="post">
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maPN" id="input-delete-pn" value="" hidden />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="submit" class="btn btn-danger" name="xoaThongtin">Xóa</button>
				</div>
			</form:form>

		</div>
	</div>
</div>

<!-- Modal thong tin chi tiet -->
<div class="modal fade" id="modal-info-detail"
	isShow="${isOpenModalInfo }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-primary">Thông tin phiếu nhập</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<!-- <a href="quanly/nhanvien" class="close">&times;</a> -->
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<form class="form-horizontal" modelAttribute="thongTinPN">
							<div class="row">
								<div class="col-md-12">
									<div class="card">
										<div class="card-body text-primary">

											<div class="form-group row">
												<label for="inputName" class="col-sm-2 col-form-label">Mã
													phiếu nhập</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputName"
														placeholder="" value="${thongTinPN.getMaPN() }" disabled>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail" class="col-sm-2 col-form-label">Nhân
													viên nhập</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputEmail"
														placeholder=""
														value="${user.getNhanVien().getHo() } ${user.getNhanVien().getTen() }"
														disabled>
												</div>
											</div>

											<div class="form-group row">
												<label for="inputExperience"
													class="col-sm-2 col-form-label ">Nhà cung cấp</label>
												<div class="col-sm-10">
													<input class="form-control" id="inputExperience"
														placeholder=""
														value="${thongTinPN.getNhaCungCap().getTenNCC() }"
														disabled></input>
												</div>
											</div>

											<div class="form-group row">
												<label for="inputSkills" class="col-sm-2 col-form-label ">Tổng
													tiền</label>


												<div class="col-sm-10 form-control" >
													<fmt:setLocale value="vi_VN" />
													<fmt:formatNumber value="${thongTinPN.getTongTien()}"
														type="currency" maxFractionDigits="0" currencySymbol="vnđ" />
													<%-- <input type="number" class="form-control" id="inputSkills"
														placeholder="" value="${thongTinPN.getTongTien() }"
														disabled> --%>
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>

						</form>
						<section class="content">
							<div class="container-fluid">
								<div class="row">
									<div class="col-12">

										<div class="card">
											<div class="card-header ">
												<div class="d-flex justify-content-between">
													<h3 class="mt-2">Danh sách chi tiết phiếu nhập</h3>
												</div>

											</div>
											<!-- /.card-header -->
											<div class="card-body">
												<table id="bangsanpham"
													class="table table-hover table-bordered table-striped text-center">
													<thead class="bg-primary">
														<tr>
															<th>Tên sản phẩm</th>
															<th>Size</th>
															<th>Số lương</th>
															<th>Giá</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach var="ctpn" items="${danhSachThongTinCTPN }">
															<tr>
																<td>${ctpn.getTenSP() }</td>
																<td>${ctpn.getTenSize() }</td>
																<td>${ctpn.getSoLuong() }</td>
																<td>${ctpn.getGia() }</td>

															</tr>
														</c:forEach>


													</tbody>

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
					</div>
					<!-- /.col -->
				</div>
			</div>
			<!-- <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            <button type="button" class="btn bg-dark">Lưu</button>
          </div> -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->