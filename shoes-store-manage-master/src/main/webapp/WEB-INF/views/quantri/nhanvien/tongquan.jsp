<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<ol class="breadcrumb mt-1">
						<li class="breadcrumb-item"><a href="nhanvien/tongquan">Nhân
								viên</a></li>
						<li class="breadcrumb-item active">Tổng quan</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">

		<div class="row">
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachKhachHang.size() }</h3>

						<p>Khách hàng</p>
					</div>
					<div class="icon">
						<i class=" fas fa-users text-info"></i>
					</div>
					<a href="nhanvien/khachhang" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->

			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachDanhMucSanPham.size() }</h3>

						<p>Danh mục sản phẩm</p>
					</div>
					<div class="icon">
						<i class="nav-icon "></i> <i class="fab fa-elementor text-info"></i>
					</div>
					<a href="nhanvien/danhmucsp" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachSanPham.size() }</h3>

						<p>San pham</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph text-info"></i>
					</div>
					<a href="nhanvien/sanpham" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachDonHang.size()}</h3>

						<p>Đơn hàng</p>
					</div>
					<div class="icon">
						<i class="ion ion-bag text-info"></i>
					</div>
					<a href="nhanvien/donhang" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachPhieuNhap.size() }</h3>

						<p>Đơn hàng nhập</p>
					</div>
					<div class="icon">
						<i class="nav-icon fas fa-clipboard-list text-info"></i>
					</div>
					<a href="nhanvien/phieunhap" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>${danhSachNhaCungCap.size() }</h3>

						<p>Nhà cung cấp</p>
					</div>
					<div class="icon">
						<i class="fas fa-dolly-flatbed text-info"></i>
					</div>
					<a href="nhanvien/nhacungcap" class="small-box-footer bg-info">Chi
						tiết <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box border border-info">
					<div class="inner">
						<h3>&nbsp;</h3>

						<p>Thống kê</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph text-info"></i>
					</div>
					<a href="#" class="small-box-footer bg-info">Chi tiết <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->

	</section>
	<!-- /.content -->
	<%-- <div>
		<h1 class="text-center text-info">THỐNG KÊ DOANH THU THEO SẢN
			PHẨM</h1>

		<div>
			<canvas id="myProductStatsChart"></canvas>
		</div>

		<form action="" method="post">
			<!-- <div class="form-group">
					<label>Từ khóa</label> <input type="text" name="kw"
						class="form-control" />
				</div> -->
			<div class="form-group">
				<label>Từ thời điểm</label> <input type="date" name="fromDate"
					class="form-control" />
			</div>
			<p class="text-danger">${fromdate }</p>
			<div class="form-group">
				<label>Từ thời điểm</label> <input type="date" name="toDate"
					class="form-control" />
			</div>
			<p class="text-danger">${todate }</p>
			<button type="submit" name="thongke" class="btn btn-success">Báo
				cáo</button>

		</form>
		<div class="card-body">
			<table
				class="table table-hover table-bordered table-striped text-center">
				<thead>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm</th>
					<th>Doanh thu</th>
				</thead>

				<tbody>
					<c:forEach var="sp" items="${danhSachThongKeTheoSP }">
						<tr>
							<td>${sp.getMaSP() }</td>
							<td>${sp.getTenSP() }</td>
							<td>${sp.getDoanhThu() }VNĐ</td>
						</tr>
					</c:forEach>
				</tbody>



			</table>
		</div>


	</div> --%>
	<p id="alertMessage" data-message="${alertMessage }" data-success=${isSuccess }></p>
</div>
<!-- /.content-wrapper -->

<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->

<script>
let isSuccess = $("#alertMessage").data("success")
			if(isSuccess){
			
			toastr.success($("#alertMessage").data("message"))
		}
		else if(isSuccess==false && isSuccess != ''){
			 toastr.error($("#alertMessage").data("message"))		
		}
	productLabels = [], productInfo = []
	/* <c:forEach items="${danhSachThongKeTheoSP}" var="p">
	productLabels.push('${p.getTenSP()}')
	productInfo.push('${p.getDoanhThu()}')
	</c:forEach> */
	var rows = $('tbody>tr');
	var row;
	for (let i = 0; i < rows.length; i++) {
		productLabels.push($($(rows[i]).children()[1]).text());
		productInfo.push(parseFloat($($(rows[i]).children()[2]).text()));
		console.log($($(rows[i]).children()[1]).text());
		console.log(parseFloat($($(rows[i]).children()[2]).text()));
	}

	window.onload = function() {
		productChart("myProductStatsChart", productLabels, productInfo)
	}
</script>

