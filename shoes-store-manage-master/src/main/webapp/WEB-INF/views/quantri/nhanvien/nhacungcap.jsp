<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
                <li class="breadcrumb-item"><a href="nhanvien/tongquan">Quản lý</a></li>
                <li class="breadcrumb-item active">Nhà cung cấp</li>
              </ol>
            </div>
            <div class="col-sm-6">

            </div>

          </div>
        </div><!-- /.container-fluid -->
      </section>


	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card">
						<div class="card-header d-flex flex-column ">
							<div class="d-flex align-items-center justify-content-between">
								<h3 class="card-title">Danh sách nhà cung cấp</h3>
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
							<table id="bangnhacc" class="table table-bordered table-striped">
								<thead class="bg-primary">
									<tr>
										<th>Mã NCC</th>
										<th>Tên NCC</th>
										<th>SĐT</th>
										<th>Địa chỉ</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ncc" items="${danhSachNhaCungCap }">
										<tr>
											<td>${ncc.getMaNCC() }</td>
											<td>${ncc.getTenNCC() }</td>
											<td>${ncc.getSdt() }</td>
											<td>${ncc.getDiaChi() }</td>

											<td>
												<div class="d-flex justify-content-between px-4">
													<a class=""
														href="nhanvien/nhacungcap/${ncc.getMaNCC()}?thongtin"><i
														class="fas fa-info-circle"></i> </a> <%-- <a class=""
														href="nhanvien/nhacungcap/${ncc.getMaNCC() }?suaThongtin"><i
														class="fas fa-edit"></i> </a>
														 <a class=""
														href="" data-delete="${ncc.getMaNCC()}"data-toggle="modal"
														data-target="#xoanhacungcap"> <i
														class="fas fa-trash-alt"></i></a> --%>

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

<!-- Modal them moi nha cung cap -->
<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-primary" style="font-weight: 600;">Thêm
					nhà cung cấp</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<form:form action="nhanvien/nhacungcap?themNCC"
							class="form-horizontal" method="post"
							modelAttribute="nhaCungCapMoi" enctype="multipart/form-data">
							<div class="row">


								<div class="col-md-12">

									<div class="form-group row">
										<label for="" class="col-sm-2 col-form-label text-primary">Tên
											nhà cung cấp </label>
										<div class="col-sm-10">
											<form:input path="tenNCC" class="form-control" />
											<form:errors path="tenNCC" cssClass="text-danger" />
										</div>
									</div>
									<div class="form-group row">
										<label for="" class="col-sm-2 col-form-label text-primary">Số
											điện thoại </label>
										<div class="col-sm-10">
											<form:input path="sdt" class="form-control" />
											<form:errors path="sdt" cssClass="text-danger" />
										</div>
									</div>
									<div class="form-group row">
										<label for="" class="col-sm-2 col-form-label text-primary">Địa
											chỉ </label>
										<div class="col-sm-10">
											<form:input path="diaChi" class="form-control" />
											<form:errors path="diaChi" cssClass="text-danger" />
										</div>
									</div>


									<div class="form-group row d-flex justify-content-end">
										<button type="submit" class="btn btn-primary">Thêm</button>
										<a href="nhanvien/nhacungcap" id="cancel-save-modal"
											class="mx-2 btn btn-secondary">Hủy</a>
									</div>
								</div>
							</div>

						</form:form>
					</div>
					<!-- /.col -->
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal sua thong tin danh muc -->

<div class="modal fade" id="modal-edit-nhacungcap"
	isShow="${isOpenModalEdit }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Sửa nhà cung cấp</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
										href="#activity" data-toggle="tab">Thông tin nhà cung cấp</a></li>
								</ul>	
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content">
									<div class="active tab-pane" id="activity">
										<!-- Info profile -->

										<form:form
											action="nhanvien/nhacungcap/${thongTinNCC.getMaNCC() }?suaThongtin"
											class="form-horizontal" modelAttribute="thongTinNCC"
											enctype="multipart/form-data">

											<div class="row">


												<div class="col-md-12">
													<div class="card">
														<div class="card-body text-primary">


															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label text-primary">Tên
																	nhà cung cấp </label>
																<div class="col-sm-10">
																	<form:input path="tenNCC" class="form-control" />
																	<form:errors path="tenNCC" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label text-primary">Số
																	điện thoại </label>
																<div class="col-sm-10">
																	<form:input path="sdt" class="form-control" />
																	<form:errors path="sdt" cssClass="text-danger" />
																</div>
															</div>
															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label text-primary">Địa
																	chỉ </label>
																<div class="col-sm-10">
																	<form:input path="diaChi" class="form-control" />
																	<form:errors path="diaChi" cssClass="text-danger" />
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class=" d-flex justify-content-end">
														<button type="submit" class="btn btn-primary">Sửa</button>
														<a href="nhanvien/nhacungcap" id="cancel-update-modal"
															class="mx-2 btn btn-secondary">Hủy</a>
													</div>
												</div>

											</div>

										</form:form>
										<!-- /.Info profile -->
									</div>

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


<!-- Modal thong tin chi tiet -->
<div class="modal fade" id="modal-info-detail"
	isShow="${isOpenModalInfo }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-primary">Thông tin nhà cung cấp</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
				<!-- <a href="nhanvien/nhacungcap" class="close">&times;</a> -->
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<form class="form-horizontal" modelAttribute="thongTinNCC">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body text-primary">

											<div class="form-group row">
												<label for="inputName" class="col-sm-2 col-form-label">Mã
													nhà cung cấp</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputName"
														placeholder="" value="${thongTinNCC.getMaNCC() }" disabled>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail" class="col-sm-2 col-form-label">Tên
													nhà cung cấp</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputEmail"
														placeholder="" value=" ${thongTinNCC.getTenNCC() }"
														disabled>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail" class="col-sm-2 col-form-label">Số
													điện thoại</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputEmail"
														placeholder="" value=" ${thongTinNCC.getSdt() }" disabled>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail" class="col-sm-2 col-form-label">Địa
													chỉ</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputEmail"
														placeholder="" value=" ${thongTinNCC.getDiaChi() }"
														disabled>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</form>
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

<div class="modal fade " id="xoanhacungcap" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa nhà cung cấp
					này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- <div class="modal-body">
            <p class="text-center">Bạn muốn tắt hoạt động tài khoản này?</p>
          </div> -->
			<form action="nhanvien/nhacungcap?xoancc"  method="post">
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maNCC" id="input-delete-ncc" value="" hidden />
					<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-danger" >Xóa</button>
				</div>
			</form>
			
		</div>
	</div>
</div>


<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->