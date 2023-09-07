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
					<ol class="breadcrumb mt-1">
						<li class="breadcrumb-item"><a href="quanly/thongke">Quản
								lý</a></li>
						<li class="breadcrumb-item active">Thống kê</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->

	<div>
		<h1 class="text-center text-info">THỐNG KÊ DOANH THU THEO SẢN
			PHẨM</h1>

		<div class="row px-xl-5 d-flex justify-content-center">
			<div class="col-8 ">
				<canvas id="myProductStatsChart"></canvas>
			</div>
		</div>


		<div class="col-8">
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
		</div>
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
							<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber
									value="${sp.getDoanhThu() }" type="currency"
									currencySymbol="vnđ" /></td>
						</tr>
					</c:forEach>
				</tbody>



			</table>
		</div>


	</div>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
	productLabels = [], productInfo = []
	<c:forEach items="${danhSachThongKeTheoSP}" var="p">
		productLabels.push('${p.getTenSP()}')
		productInfo.push('${p.getDoanhThu()}')
	</c:forEach>
	/* var rows = $('tbody>tr');
	var row;
	for (let i = 0; i < rows.length; i++) {
		productLabels.push($($(rows[i]).children()[1]).text());
		productInfo.push(parseFloat($($(rows[i]).children()[2]).text()));
		console.log($($(rows[i]).children()[1]).text());
		console.log(parseFloat($($(rows[i]).children()[2]).text()));
	} */

	window.onload = function() {
		productChart("myProductStatsChart", productLabels, productInfo)
	}
</script>


<!-- Footer -->
<%@include file="/WEB-INF/views/quantri/include/footer.jsp"%>
<!-- Footer end -->


