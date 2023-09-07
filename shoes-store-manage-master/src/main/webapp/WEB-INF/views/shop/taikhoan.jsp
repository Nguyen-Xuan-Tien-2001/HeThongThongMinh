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
					<a class="breadcrumb-item text-dark" href="#">Trang chủ</a> <span class="breadcrumb-item active">Tài
						khoản</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Start -->
	<div class="container-fluid">
		<div class="row px-xl-5 ">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-md-3 tab-space">
						<ul class="nav nav-pills mb-3 flex-column" id="pills-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill"
									href="#pills-profile" role="tab" aria-controls="pills-home" aria-selected="true">TÀI
									KHOẢN CỦA TÔI</a></li>
							<li class="nav-item"><a class="nav-link" isChoose="${tabListPassword }"
									id="pills-profile-tab" data-toggle="pill" href="#pills-change-password" role="tab"
									aria-controls="pills-profile" aria-selected="false">ĐỔI MẬT
									KHẨU</a></li>


							<li class="nav-item"><a class="nav-link" isChoose="${tabListOrder }" id="pills-contact-tab"
									data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-contact"
									aria-selected="false">ĐƠN HÀNG</a></li>
						</ul>
					</div>
					<div class="col-md-9">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab">
								<div class="container rounded bg-white mb-2">
									<form:form action="taikhoan" method="post" modelAttribute="khachhang"
										enctype="multipart/form-data" id="form-suattcn">
										<div class="row">
											<div class="col-md-5 border-right">
												<div class="d-flex flex-column align-items-center text-center p-3 py-5">
													<img id="modal-add-avatar" class="rounded-circle mt-5 mb-3"
														src="resources/file/${user.khachHang.anh }" width="250px"><span
														class="text-black-50 ">${user.email }</span>

													<input name="anhMoi" type="file" id="input-add-avatar"
														class="mt-3 form-control" />
												</div>
											</div>
											<div class="col-md-7">
												<div class="p-3 py-5 tab-space">
													<p class="h5 font-weight-bold mb-5 text-center">CÀI ĐẶT
														TÀI KHOẢN</p>
													<div class="row mt-2">
														<div class="col-md-6">
															<label class="labels">HỌ</label>
															<form:input path="ho" id="lastName" class="form-control" placeholder="Họ"
																value="" />
															<form:errors path="ho" cssClass="text-danger" />
															<p class="text-danger" id="ho-error"></p>
														</div>
														<div class="col-md-6">
															<label class="labels">TÊN</label>
															<form:input path="ten" id="firstName" class="form-control"
																placeholder="Tên" value="" />
															<form:errors path="ten" cssClass="text-danger" />
															<p class="text-danger" id="ten-error"></p>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="form-check form-check-inline">
																<form:radiobutton data-phai="phai" path="phai" value="true" label="Nam"
																	class="form-check-input"
																	checked="${khachhang.getPhai() == true ? 'checked' : '' }" />

															</div>
															<div class="form-check form-check-inline">
																<form:radiobutton data-phai="phai" path="phai" value="false" label="Nữ"
																	class="form-check-input"
																	checked="${khachhang.getPhai() == false ? 'checked' : '' }" />
																<form:errors path="phai" cssClass="text-danger" />
															</div>
															<p class="text-danger" id="phai-error"></p>
														</div>
														<div class="col-md-12">
															<label class="labels">NGÀY SINH</label>
															<form:input path="ngaySinh" type="date"
																value="${khachhang.getNgaySinh() }" id="datePickerId"
																class="form-control" />
															<form:errors path="ngaySinh" cssClass="text-danger" />
															<p class="text-danger" id="ngaysinh-error"></p>

														</div>
														<div class="col-md-12">
															<label class="labels">SỐ ĐIỆN THOẠI</label>

															<form:input path="sdt" id="phone" class="form-control" placeholder=""
																value="" />
															<form:errors path="sdt" cssClass="text-danger" />
															<p class="text-danger" id="sdt-error"></p>
														</div>
														<div class="col-md-12">
															<label class="labels">ĐỊA CHỈ</label>
															<form:input path="diaChi" class="form-control" id="address"
																placeholder="" value="" />
															<form:errors path="diaChi" cssClass="text-danger" />
															<p class="text-danger" id="diachi-error"></p>
														</div>

													</div>

													<div class="mt-2 text-center">
														<button name="updatethongtin"
															class="btn btn-primary profile-button h5 w-100"
															type="submit">LƯU THAY ĐỔI</button>
													</div>
												</div>
											</div>

										</div>
									</form:form>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-change-password" role="tabpanel"
								aria-labelledby="pills-logout-tab">

								<div class="container rounded bg-white mb-2">
									<div class="row">
										<div class="col-10">
											<div class="mt-3">
												<p class="h5 font-weight-bold mb-5 text-center">ĐỔI MẬT KHẨU</p>
											</div>
											<form action="taikhoan" method="post">
												<div class="col-8">
													<label class="labels">MẬT KHẨU</label>
													<input type="password" name="matkhau" class="form-control" />
													<p class="text-danger" id="mk-error">${matkhau } </p>
												</div>
												<div class="col-8 mt-4">
													<label class="labels">MẬT KHẨU MỚI</label>
													<input type="password" name="matkhaumoi" class="form-control" />
													<p class="text-danger" id="mkmoi-error">${matkhaumoi } </p>
												</div>
												<div class="col-8 mt-4">
													<label class="labels">NHẬP LẠI MẬT KHẨU</label>
													<input type="password" name="nlmatkhaumoi" class="form-control" />
													<p class="text-danger" id="remkmoi-error">${nlmatkhaumoi } </p>
												</div>
												<div class="col-8 mt-4">
													<button name="doimatkhau" type="submit"
														class="btn btn-primary">Lưu</button>
												</div>
											</form>
										</div>
									</div>

								</div>
							</div>



							<div class="tab-pane fade" id="pills-order" role="tabpanel"
								aria-labelledby="pills-logout-tab">

								<div class="container bootdey  bg-white">
									<div class="panel panel-default panel-order">
										<div class="panel-heading pt-3 mb-5">
											<span class="h5 font-weight-bold">TÌNH TRẠNG ĐƠN HÀNG</span>
											<div class="btn-group float-right">
												<div class="btn-group">
													<button type="button" class="btn btn-default btn-xs dropdown-toggle"
														data-toggle="dropdown">
														Lọc<i class="fa fa-filter"></i>
													</button>
													<ul class="px-3 dropdown-menu dropdown-menu-right">
														<li><a class="text-black" href="donhang">Tất cả</a></li>
														<li><a class="text-black" href="donhang/1?trangthaidh">Đơn
																mới</a></li>
														<li><a class="text-black" href="donhang/2?trangthaidh">Đã xác
																nhận</a></li>
														<li><a class="text-black" href="donhang/3?trangthaidh">Đang giao
																hàng</a></li>
														<li><a class="text-black" href="donhang/4?trangthaidh">Đã
																giao</a></li>
														<li><a class="text-black" href="donhang/5?trangthaidh">Đã
																hủy</a></li>
													</ul>
												</div>
											</div>
										</div>

										<div class="panel-body">
											<c:forEach var="dh" items="${dsdonhang }">
												<%-- <c:choose>

													<c:when test="${dh.trangThaiDH.maTTDH == 1 }"> --%>
												<div class="row">
													<!-- <div class="col-md-2">
														<img
															src=""
															class="media-object img-thumbnail" />
													</div> -->
													<div class="col-md-12">
														<div class="row">
															<div class="col-md-12">
																<div class="float-right">
																	<c:choose>
																		<c:when test="${dh.trangThaiDH.maTTDH == 1 }">
																			<label
																				class="badge badge-pills badge-primary">Đơn
																				hàng mới</label>
																		</c:when>
																		<c:when test="${dh.trangThaiDH.maTTDH == 2 }">
																			<label
																				class="badge badge-pills badge-info">Đã
																				nhận đơn</label>
																		</c:when>
																		<c:when test="${dh.trangThaiDH.maTTDH == 3 }">
																			<label
																				class="badge badge-pills badge-light">Đang
																				giao </label>
																		</c:when>
																		<c:when test="${dh.trangThaiDH.maTTDH == 4 }">
																			<label
																				class="badge badge-pills badge-success">Đã
																				giao</label>
																		</c:when>
																		<c:when test="${dh.trangThaiDH.maTTDH == 5 }">
																			<label
																				class="badge badge-pills badge-danger">Đã
																				hủy</label>
																		</c:when>

																	</c:choose>

																</div>
																<span><strong>MÃ ĐƠN: ${dh.maDH }</strong></span><br />
																Tổng sản phẩm : 2<br /> <span>Giá:
																	<fmt:setLocale value="vi_VN" />
																	<fmt:formatNumber maxFractionDigits="0"
																		value="${dh.tongTien} " type="currency"
																		currencySymbol="vnđ" />
																</span><br> <span>THANH TOÁN:
																	${dh.hinhThucTT.kieuTT }</span>

															</div>
															<div class="col-md-12">
																<span>Ngày đặt: ${dh.thoiGian }</span> <br> <span>Tên
																	người nhận: ${dh.tenNguoiNhan }</span> <br> <span>Số
																	điện thoại: ${dh.sdtKH }</span> <br> <span>Địa
																	chỉ: ${dh.diaChi }</span> <br> <span>Ghi chú:
																	${dh.ghiChu }</span> <br>
															</div>
															<div class="col-12">
																<a href="donhang/${dh.maDH }"
																	class="btn btn-warning text-white float-right my-3 ">
																	Chi tiết đơn hàng</a>
																<c:if test="${dh.trangThaiDH.maTTDH == 1 }">
																	<a href="" data-toggle="modal"
																		data-delete="${dh.maDH }"
																		data-target="#huydonhang"
																		class="btn btn-danger text-white float-right my-3 mr-3 ">
																		Hủy đơn hàng</a>
																</c:if>

															</div>
														</div>
													</div>
												</div>

												<%-- 	</c:when>
												</c:choose> --%>
											</c:forEach>


											<div class="row">
												<div class="col-md-2">

												</div>

											</div>
										</div>


									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Shop End -->

		<!-- Modal Detail Order  -->

		<div class="modal fade" id="modalDetailOrder" tabindex="-1" aria-labelledby="modalDetailOrderLabel"
			aria-hidden="true" isShow="${isShowModalInfo }">
			<div class="modal-dialog modal-dialog-scrollable modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalDetailOrderLabel">Chi tiết
							đơn hàng</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-12">


								<h6>MÃ ĐƠN HÀNG: ${donhang.maDH }</h6>

								<div class="track">
									<c:choose>
										<c:when test="${donhang.trangThaiDH.maTTDH == 5 }">

										</c:when>

										<c:otherwise>
											<div class="step ${donhang.trangThaiDH.maTTDH >= 1 ? 'active' : ''  }">
												<span class="icon"> <i class="fa fa-check"></i>
												</span> <span class="text">Đơn mới</span>
											</div>
											<div class="step ${donhang.trangThaiDH.maTTDH >= 2 ? 'active' : ''  }">
												<span class="icon"> <i class="fa fa-user"></i>
												</span> <span class="text">Nhận đơn hàng</span>
											</div>
											<div class="step ${donhang.trangThaiDH.maTTDH >= 3 ? 'active' : ''  }">
												<span class="icon"> <i class="fa fa-truck"></i>
												</span> <span class="text">Đang giao hàng</span>
											</div>
											<div class="step ${donhang.trangThaiDH.maTTDH ==4  ?'active' : ''  }">
												<span class="icon"> <i class="fa fa-box"></i>
												</span> <span class="text"></span>Đã giao hàng
											</div>
										</c:otherwise>
									</c:choose>


								</div>

								<hr>

							</div>
						</div>
						<table id="bangchitietdonhang" class="display" style="width: 100%">
							<thead class="bg-primary">
								<tr>
									<th>Mã sản phẩm</th>
									<th>Sản phẩm</th>
									<th>Màu</th>
									<th>Size</th>
									<th>Số lượng</th>
									<th>Giá</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ctsp" items="${ctdh }">
									<tr>
										<td>${ctsp.chiTietSP.sanPham.maSP }</td>
										<td class="d-flex justify-content-center"><img
												src="resources/file/${ctsp.chiTietSP.sanPham.hinhAnh }" width="40px"
												height="40px"> <span class="p-2">${ctsp.chiTietSP.sanPham.tenSP }</span>
										</td>
										<td>${ctsp.chiTietSP.sanPham.mauSanPham.tenMau }</td>
										<td>${ctsp.chiTietSP.sizeSanPham.tenSize }</td>
										<td>${ctsp.soLuong }</td>
										<td>
											<fmt:setLocale value="vi_VN" />
											<fmt:formatNumber maxFractionDigits="0"
												value="${ctsp.chiTietSP.sanPham.gia} " type="currency"
												currencySymbol="đ" />
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="mr-3 mt-3">
							<p class="float-right">
								Tổng tiền:
								<fmt:setLocale value="vi_VN" />
								<fmt:formatNumber maxFractionDigits="0" value="${donhang.tongTien }" type="currency"
									currencySymbol="đ" />
							</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- Modal Detail Order End -->


		<!-- Modal Cancel Order  -->
		<div class="modal fade " id="huydonhang" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header bg-primary">
						<h5 class="modal-title" id="exampleModalLabel">
							<i class="fas fa-trash-alt"></i>&nbsp; Bạn chắc chắn muốn hủy đơn
							hàng này?
						</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<form action="donhang" method="post">
						<div class="modal-footer d-flex justify-content-between">
							<input type="text" name="maDH" id="input-cancel-order" value="" hidden />
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							<button type="submit" name="huydonhang" class="btn btn-danger">Xác
								nhận</button>
						</div>
					</form>

				</div>
			</div>
		</div>
		<!-- Modal Cancel Order End -->
		<p id="alertMessage" data-message="${alertMessage }" data-success=${isSuccess }></p>
</main>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- Footer -->
<%@include file="/WEB-INF/views/shop/include/footer.jsp"%>
<!-- Footer End -->


<!-- JS Lib -->
<%@include file="/WEB-INF/views/shop/include/jsLib.jsp"%>
<!-- JS Lib End -->
<script src="resources/user/js/account.js"></script>

<script>
	function getIdDeleteIntoForm(idInput) {

		$("a[data-delete]").on("click", function () {
			console.log($(this).data("delete"))
			let id = $(this).data("delete")
			$(idInput).attr("value", id)
		})
	}

	function showModalConfirm(idButton, title, ok) {
		$(idButton).on("click", function (e) {
			let btn = $(this)
			e.preventDefault();
			alertify.confirm(title, '', function () {
				$(btn).unbind("click")
				$(btn)[0].click()
			}, function () {}).set('labels', {
				ok: ok,
				cancel: 'Thoát'
			});

		})
	}

	function isShowModal() {

		let modalShow = $(".modal.fade[isShow=true]");

		if (modalShow) {
			modalShow.modal('show')
		}

	}

	function isChooseTab() {
		let chooseTab = $(".nav-link[isChoose=true]")

		if (chooseTab) {
			chooseTab.tab('show');
		}
	}

	function updateAvatar(idInput, idModal) {
		//alertify.notify("Kiểu file ảnh không hợp lệ. Vui lòng chọn ảnh .PNG hoặc .JPG", "success", 7);

		let inpChangeAvatar = $(idInput)

		inpChangeAvatar.on("change", function (e) {
			console.log(inpChangeAvatar)
			let imgAvatar = $(idModal)
			imgAvatar.attr("src", URL.createObjectURL(inpChangeAvatar[0].files[0]))
			imgAvatar.on("load", function () {
				URL.revokeObjectURL(imgAvatar.attr("src"))
			})
		})
	}
	$(document).ready(function () {

		updateAvatar("#input-add-avatar", "#modal-add-avatar");
		let isSuccess = $("#alertMessage").data("success")

		if (isSuccess) {

			toastr.success($("#alertMessage").data("message"))
		} else if (isSuccess == false && isSuccess.trim() != '') {
			toastr.error($("#alertMessage").data("message"))
		}

		isShowModal();

		isChooseTab();

		datePickerId.max = new Date().toISOString().split("T")[0];
		getIdDeleteIntoForm("#input-cancel-order");


		$('#bangchitietdonhang').DataTable({
			"responsive": true,
			"ordering": true,
			"autoWidth": false,
			"language": {
				"lengthMenu": "Hiện _MENU_ dòng ",
				"zeroRecords": "Không có kết quả tương tự",
				"info": "Trang _PAGE_ / _PAGES_",
				"infoEmpty": "Không tìm thấy kết quả nào",
				"infoFiltered": "(filtered from _MAX_ total records)",
				"loadingRecords": "Đang tìm kiếm...",
				"search": "Tìm kiếm:",
				paginate: {
					previous: '‹',
					next: '›'
				},
			},
		});

	});
</script>