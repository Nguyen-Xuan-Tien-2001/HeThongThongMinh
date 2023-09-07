<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Header -->
<%@include file="/WEB-INF/views/quantri/include/header.jsp"%>
<!-- Header end -->

<c:choose>
	<c:when test="${user.getVaitro().getMaVT() == 'NV' }">
		<%@include file="/WEB-INF/views/quantri/include/sidebar-nv.jsp"%>
	</c:when>
	<c:when test="${user.getVaitro().getMaVT()=='QL' }">
		<%@include file="/WEB-INF/views/quantri/include/sidebar-ql.jsp"%>
	</c:when>
</c:choose>
<!-- Sidebar -->

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
						<li class="breadcrumb-item active">Tài khoản</li>
					</ol>
				</div>
				<div class="col-sm-6"></div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>




	<!-- Main content -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">


				<div class="card">
					<div class="card-header">
						<h4 class="">Chỉnh sửa tài khoản</h4>
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
					<div class="card-body">
						<div class="row">
							<!-- /.col -->
							<div class="col-md-12">
								<div class="">
									<div class="card-header p-2">
										<ul class="nav nav-pills">
											<li class="nav-item"><a class="nav-link active"
												href="#activity" data-toggle="tab">Thông tin cá nhân</a></li>
											<li class="nav-item"><a class="nav-link"
												href="#settings" data-toggle="tab">Cài đặt</a></li>
										</ul>
									</div>
									<!-- /.card-header -->
									<div class="card-body">
										<div class="tab-content">
											<div class="active tab-pane" id="activity">
												<!-- Info profile -->

												<form:form
													action="tongquan/${thongTinNV.getMaNV()}?chinhsua"
													class="form-horizontal" modelAttribute="thongTinNV"
													enctype="multipart/form-data">

													<div class="row">
														<div class="col-md-4">
															<!-- Profile Image -->
															<div class="card card-primary card-outline">
																<div class="card-body box-profile">
																	<div class="text-center">
																		<img id="modal-update-avatar"
																			class="profile-user-img img-fluid img-circle"
																			src="resources/file/${thongTinNV.getAnh() }"
																			alt="User profile picture" style="width: 120px;" />
																	</div>
																	<input name="anhMoi" type="file"
																		id="input-update-avatar" class="mt-3 form-control" />



																</div>
																<!-- /.card-body -->
															</div>
															<!-- /.card -->

														</div>

														<div class="col-md-8">
															<div class="card">
																<div class="card-body text-primary">

																	<div class="form-group row">
																		<label for=""
																			class="col-sm-2 col-form-label text-primary">Email
																		</label>
																		<div class="col-sm-10">
																			<label class="form-control">${thongTinNV.getTaiKhoan().getEmail() }</label>

																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="" class="col-sm-2 col-form-label">Họ
																		</label>
																		<div class="col-sm-10">
																			<form:input path="ho" class="form-control" id=""
																				placeholder="" />
																			<form:errors path="ho" cssClass="text-danger" />
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="" class="col-sm-2 col-form-label">Tên
																		</label>
																		<div class="col-sm-10">
																			<form:input path="ten" class="form-control" id=""
																				placeholder="" />
																			<form:errors path="ten" cssClass="text-danger" />
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputName2"
																			class="col-sm-2 col-form-label">Giới tính</label>
																		<div class="col-sm-10">
																			<div class="form-check form-check-inline">
																				<form:radiobutton path="phai" value="true"
																					label="Nam" class="form-check-input"
																					checked="${thongtinNV.getPhai() == true ? 'checked' : '' }" />

																			</div>
																			<div class="form-check form-check-inline">
																				<form:radiobutton path="phai" value="false"
																					label="Nữ" class="form-check-input"
																					checked="${thongtinNV.getPhai() == false ? 'checked' : '' }" />
																				<form:errors path="phai" cssClass="text-danger" />
																			</div>


																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputExperience"
																			class="col-sm-2 col-form-label ">Ngày sinh</label>
																		<div class="col-sm-10">
																			<form:input path="ngaySinh" type="date"
																				value="${thongTinNV.getNgaySinh() }"
																				class="form-control" />
																			<form:errors path="ngaySinh" cssClass="text-danger" />
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputSkills"
																			class="col-sm-2 col-form-label text-primary">CCCD</label>
																		<div class="col-sm-10">
																			<form:input path="cccd" class="form-control" />
																			<form:errors path="cccd" cssClass="text-danger" />
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputSkills"
																			class="col-sm-2 col-form-label ">SĐT</label>
																		<div class="col-sm-10">
																			<form:input path="sdt" class="form-control" />
																			<form:errors path="sdt" cssClass="text-danger" />
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="inputSkills"
																			class="col-sm-2 col-form-label"> Địa chỉ</label>
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

																<button type="submit" class="btn btn-primary"
																	name="chinhsua">Sửa</button>
															</div>
														</div>

													</div>

												</form:form>
												<!-- /.Info profile -->
											</div>
											<!-- /.tab-pane -->


											<div class="tab-pane" id="settings">
												<form class="form-horizontal" method="post"
													action="tongquan/${thongTinNV.getMaNV() }?doimatkhau">
													<div class="form-group row">
														<label for="inputSkills"
															class="col-sm-2 col-form-label text-primary">Mật
															khẩu hiện tại</label>
														<div class="col-sm-10">
															<input type="password" name="s-password"
																class="form-control" placeholder="Mật khẩu hiện tại" />
															<p class="text-danger">${sPassword }</p>
														</div>
													</div>
													<div class="form-group row">
														<label for="confirmPassword-register"
															class="col-sm-2 col-form-label text-primary">Mật
															khẩu mới</label>
														<div class="col-sm-10">
															<input type="password" name="new-password"
																class="form-control" id="confirmPassword-register"
																placeholder="Mật khẩu mới">
															<p class="text-danger">${newPassword }</p>
														</div>
													</div>
													<div class="form-group row">
														<label for="confirmPassword-register"
															class="col-sm-2 col-form-label text-primary">Xác
															nhận mật khẩu</label>
														<div class="col-sm-10">
															<input type="password" name="confirm-password"
																class="form-control" id="confirmPassword-register"
																placeholder="Nhập lại mật khẩu">
															<p class="text-danger">${confirmPassword }</p>
														</div>
													</div>



													<div class="form-group row">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit" class="btn bg-primary"
																type="submit" name="doimatkhau" id="btn-change-mk">Xác
																nhận</button>
														</div>
													</div>
												</form>
												<!--<div class="col-12">
												<div class=" d-flex justify-content-end">
													
													<a href="quanly/tongquan" id="cancel-update-modal"
													class="mx-2 btn btn-secondary">Hủy</a>
													<button type="submit" class="btn btn-primary">Lưu</button>
												</div> -->
											</div>
											<!--<div class="form-group row">
												<div class=" col-sm-10">
													<button type="submit" name="resetmatkhau"
														class="btn bg-danger" id="btn-reset-mk">Reset mật
														khẩu</button>
												</div>
											</div>   -->

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
			<!-- /.card -->
		</div>
	</div>
	<!-- /.row -->

</div>


<!-- /.content -->

<!-- /.content-wrapper -->



<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->