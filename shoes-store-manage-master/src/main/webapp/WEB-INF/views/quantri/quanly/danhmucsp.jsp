<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<li class="breadcrumb-item active">Danh Mục Sản Phẩm</li>
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
						<div class="card-header d-flex flex-column ">
							<div class="d-flex align-items-center justify-content-between">
								<h3 class="card-title">Danh sách danh mục sản phẩm</h3>
								<button type="submit" class="btn bg-primary  mt-2"
									data-toggle="modal" data-target="#modal-add-new">
									<i class="fas fa-plus mr-2"></i>Thêm mới
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
							<table id="bangdanhmucsp" class="table table-bordered table-striped">
								<thead class="bg-primary">
									<tr>
										<th>Mã danh mục</th>
										<th>Tên danh mục</th>
										<th>Số lượng sản phẩm</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dm" items="${danhSachDanhMucSanPham }">
										<tr>
											<td>${dm.getMaDM() }</td>
											<td>${dm.getTenDM() }</td>
											<td>${dm.getSanPhams().size() } </td>

											<td>
												<div class="d-flex justify-content-between px-4">
													<a class=""
														href="quanly/danhmucsp/${dm.getMaDM()}?thongtin"><i
														class="fas fa-info-circle"></i> </a> <a class=""
														href="quanly/danhmucsp/${dm.getMaDM() }?suaThongtin"><i
														class="fas fa-edit"></i> </a> <a class=""
														href="" data-delete="${dm.getMaDM() }" data-toggle="modal"
														data-target="#exampleModalDisable"> <i
														class="fas fa-trash-alt"></i>
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

<!-- Modal them moi danh muc -->
<div class="modal fade" id="modal-add-new"
	isShow="${isShowModalAddNew }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-primary" style="font-weight: 600;">Thêm
					danh mục</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<form:form action="quanly/danhmucsp?themDM"
							class="form-horizontal" method="post" modelAttribute="danhMucMoi"
							enctype="multipart/form-data">
							<div class="row">


								<div class="col-md-12">

									<div class="form-group row">
										<label for="" class="col-sm-2 col-form-label text-primary">Tên
											danh mục </label>
										<div class="col-sm-10">
											<form:input path="tenDM" class="form-control" />
											<form:errors path="tenDM" cssClass="text-danger" />
										</div>
									</div>

									<div class="form-group row d-flex justify-content-end">
										<button type="submit" class="btn btn-primary">Thêm</button>
										<a href="quanly/danhmucsp" id="cancel-save-modal"
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

<div class="modal fade" id="modal-edit-danhmuc"
	isShow="${isOpenModalEdit }">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Sửa danh mục</h4>
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
										href="#activity" data-toggle="tab">Thông tin danh mục</a></li>
								</ul>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="tab-content">
									<div class="active tab-pane" id="activity">
										<!-- Info profile -->

										<form:form
											action="quanly/danhmucsp/${thongTinDM.getMaDM() }?suaThongtin"
											class="form-horizontal" modelAttribute="thongTinDM"
											enctype="multipart/form-data">

											<div class="row">


												<div class="col-md-12">
													<div class="card">
														<div class="card-body text-primary">


															<div class="form-group row">
																<label for=""
																	class="col-sm-2 col-form-label text-primary">Tên
																	danh mục </label>
																<div class="col-sm-10">
																	<form:input path="tenDM" class="form-control" />
																	<form:errors path="tenDM" cssClass="text-danger" />
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class=" d-flex justify-content-end">
														<button type="submit" class="btn btn-primary">Sửa</button>
														<a href="quanly/danhmucsp" id="cancel-update-modal"
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
				<h4 class="modal-title text-primary">Thông tin danh mục</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<!-- <a href="quanly/danhmucsp" class="close">&times;</a> -->
			</div>
			<div class="modal-body">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<form class="form-horizontal" modelAttribute="thongTinDM">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body text-primary">

											<div class="form-group row">
												<label for="inputName" class="col-sm-2 col-form-label">Mã
													danh mục</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputName"
														placeholder="" value="${thongTinDM.getMaDM() }" disabled>
												</div>
											</div>
											<div class="form-group row">
												<label for="inputEmail" class="col-sm-2 col-form-label">Tên
													danh mục</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="inputEmail"
														placeholder="" value=" ${thongTinDM.getTenDM() }" disabled>
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


<div class="modal fade " id="exampleModalDisable" tabindex="-1"
	aria-labelledby="exampleModalConfirm" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="exampleModalLabel">
					<i class="fas fa-trash-alt"></i>&nbsp; Bạn muốn xóa danh mục
					này?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form:form action="quanly/danhmucsp?xoadm" method="post" >
				<div class="modal-footer d-flex justify-content-between">
					<input type="text" name="maDM" id="input-delete-dm" value="" hidden />
					<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-danger" name="xoaThongtin">Xóa</button>
				</div>
			</form:form>
			
		</div>
	</div>
</div>



<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->