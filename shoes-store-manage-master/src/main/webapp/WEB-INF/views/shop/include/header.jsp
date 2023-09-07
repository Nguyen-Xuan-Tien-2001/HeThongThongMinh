<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/taglib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<title>Trang chủ</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">
<link rel="shortcut icon" href="https://file.hstatic.net/1000003969/file/favicon-juno_8afc5c05a55941aa88438ce9264f03f3.png" type="image/png">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="<c:url value='resources/user/lib/animate/animate.min.css '/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/owlcarousel/assets/owl.carousel.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/alertify.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/themes/default.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='resources/user/lib/alertify/css/themes/semantic.min.css'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<%-- --%>

<!-- Customized Bootstrap Stylesheet -->
<!-- <link href="css/style.css" rel="stylesheet"> -->
<%-- <c:url value='resources/user/'/> --%>
<link rel="stylesheet"
	href="<c:url value='resources/user/scss/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='resources/user/scss/custom.css'/>">
<link href="<c:url value='resources/user/css/style2.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-t.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-n.css'/>"
	rel="stylesheet">
<link href="<c:url value='resources/user/css/custom-d.css'/>"
	rel="stylesheet">

<link
	href="<c:url value='resources/employee/plugins/toastr/toastr.min.css'/>"
	rel="stylesheet">
<style>
	.button {
    -webkit-user-select: none;
    user-select: none;
	}
</style>
	
</head>

<body>
	<div style="z-index: 2000;
  position: fixed;
  top: 0;
  left: 0;
  right:0;">
	<!-- Topbar Start -->
	<div class="container-fluid " >
		<div class="row py-1 px-xl-5" style=" background-color: rgb(255, 255, 255);
  border-bottom: 1px solid rgb(204, 204, 204);
  ">
			<div class="col-lg-6 d-none d-lg-block leader">
				<div class="d-inline-flex align-items-center h-100 topbar-font">
					<a class="text-body mr-3" href="">About</a> <a
						class="text-body mr-3" href="">Liên hệ</a> <a
						class="text-body mr-3" href="">Trợ giúp</a> <a
						class="text-body mr-3" href="">Câu hỏi thường gặp<span
						class="fa fa-question-circle ml-1"></span></a>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<c:choose>
						<c:when test="${user == null }">
							<div class="btn-group">
								<!-- <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Tài khoản</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">Đăng nhập</button>
                            <button class="dropdown-item" type="button">Đăng ký</button>
                            <button class="dropdown-item" type="button">Đăng xuất</button>
                        </div> -->
								<a class="btn bg-border" href="dangnhap" role="button">Đăng
									nhập</a> <a class="btn  bg-border ml-2 text-dark" href="dangky"
									role="button">Đăng ký</a>
							</div>
						</c:when>
						<c:when test="${user != null }">

							<c:choose>
								<c:when test="${user.getKhachHang() != null }">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">

										<c:choose>
											<c:when
												test="${user.getKhachHang().getAnh().trim() == null }">
												<img class="avatar" alt=""
													src="https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg" />
											</c:when>
											<c:otherwise>
												<img class="avatar" alt=""
													src="resources/file/${user.getKhachHang().getAnh() }" />
											</c:otherwise>
										</c:choose>


										${user.getKhachHang().getHo() }&nbsp;${user.getKhachHang().getTen() }
									</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="taikhoan" class="dropdown-item">Tài Khoản </a> <a
											href="dangxuat" class="dropdown-item">Đăng xuất </a>
									</div>
								</c:when>
								<c:when test="${user.getNhanVien() != null }">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">
										<c:choose>
											<c:when test="${user.getNhanVien().getAnh().trim() != null }">
												<img src="resources/file/${user.getNhanVien().getAnh() }"
													class="avatar">
											</c:when>
											<c:otherwise>
												<img class="avatar" alt=""
													src="https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg" />
											</c:otherwise>
										</c:choose>

										${user.getNhanVien().getHo() }&nbsp;${user.getNhanVien().getTen() }
									</button>
									<div class="dropdown-menu dropdown-menu-right">

										<c:choose>
											<c:when test="${user.getVaitro().getMaVT() == 'NV' }">
												<a href="nhanvien/tongquan" class="dropdown-item">Tài
													Khoản </a>
											</c:when>
											<c:when test="${user.getVaitro().getMaVT()=='QL' }">
												<a href="quanly/tongquan" class="dropdown-item">Quản lý
												</a>
											</c:when>
										</c:choose>
										<a href="dangxuat" class="dropdown-item">Đăng xuất </a>
									</div>
								</c:when>
							</c:choose>


						</c:when>
					</c:choose>

				</div>
				<div class="d-inline-flex align-items-center d-block d-lg-none">
					<%-- <a href="" class="btn px-0 ml-2"> <i class="fa fa-search"></i>
					</a>
					<div class="btn px-0 ml-2">
						<button type="button" class="btn btn-sm btn-light dropdown-toggle"
							data-toggle="dropdown">
							<i class="fas fa-user text-dark"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="" class="dropdown-item">${user.getKhachHang().getHo() }&nbsp;${user.getKhachHang().getTen() }
							</a> <a href="dangxuat" class="dropdown-item">Đăng xuất </a>
						</div>
					</div> --%>
					<!-- <a href="user.html" class="btn px-0 ml-2">
                        <i class="fas fa-user text-dark"></i>
                    </a> -->
					<c:choose>
						<c:when test="${empty user == false }">
							<c:choose>
								<c:when test="${user.getVaitro().getMaVT() == 'KH' }">
									<a href="giohang" class="btn px-0 ml-2"> <i
										class="fas fa-shopping-cart text-primary"></i> <span
										class="badge text-dark border border-dark rounded-circle"
										style="padding-bottom: 2px;">${giohang.size()}</span>
									</a>
								</c:when>
							</c:choose>

						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		<div
			class="header-fixed row align-items-center bg-light py-3 px-xl-5">
			<div class="col-lg-3">
				<a href="trangchu" class="text-decoration-none"> <!-- <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span> -->
					<!-- <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span> -->
					<span class="h1 text-uppercase px-2 ml-n1"
					style="color:#f40000;font-weight: 800;">JUNO</span>
				</a>
			</div>
			<div class="col-lg-5 col-6">
				<form action="sanpham" method="post">
					<div class="input-group justify-content-center">
						<input type="text" name="tensp" class="form-control"
							placeholder="Nhập sản phẩm cần tìm">
						<div class="input-group-append">
							<button name="timsp" class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search text-dark"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div
				class="col-lg-3 offset-lg-1 col-6 d-flex text-right text-white bg-border py-2 rounded-service" style="
    			max-width: 280px;
				">
				<div>
					<span class="fa fa-phone" style="
    					margin: 16px 10px;
    					color:var(--primary);
					"></span>
				</div>
				<div class="text-dark" style="margin-left:20px">
					<p class="m-0">Chăm sóc khách hàng</p>
					<h5 class="m-0 text-dark" >Tel:+012 345 6789</h5>
				</div>

			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid mb-30" style=" background-color: rgb(255, 255, 255);
  border: 1px solid rgb(204, 204, 204)">
		<div class="row">
			<div class="col-lg-2 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px;">
					<h6 class="text-dark m-0">
						<i class="fa fa-bars mr-2"></i>DANH MỤC
					</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical"
					style="width: calc(100% - 30px); z-index: 999;">
					<div class="shadow navbar-nav w-100 dropdown-menu rounded-0 border-0">

						<c:forEach var="danhmuc" items="${danhSachDanhMucSanPham }">
							<div class="d-flex justify-content-between px-4">
								<a class="nav-item nav-link text-dark"
									href="danhmuc/${danhmuc.getMaDM()}?ds">${danhmuc.tenDM}</a>

							</div>
							<%-- <a href="danhmuc/${danhmuc.maDM }?ds" class="nav-item nav-link">${danhmuc.tenDM}</a> --%>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg navbar-dark py-3 py-lg-0 px-0 text-black">
					<a href="" class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-uppercase text-light px-2 ml-n1">JUNO</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="dexuat" class="nav-item nav-link text-dark"><span>ĐỀ
									XUẤT </span></a>
							<a href="sanpham" class="nav-item nav-link text-dark"><span>SẢN
									PHẨM </span></a>
							<!--<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle text-dark"
									data-toggle="dropdown">MUA SẮM<i
									class="fa fa-angle-down ml-1 mt-1"></i></a>
								<div class="dropdown-menu bg-border rounded-0 border-0 m-0">
									<a href="muasam/nam?ds" class="dropdown-item">NAM</a> <a
										href="muasam/nu?ds" class="dropdown-item">NỮ</a>
								</div>
							</div>
							 <a href="detail.html" class="nav-item nav-link">CHI TIẾT SẢN
								PHẨM</a> <a href="contact.html" class="nav-item nav-link">LIÊN
								HỆ </a> -->
						</div>
						<c:choose>
							<c:when test="${empty user == false }">
								<c:choose>
									<c:when test="${user.getVaitro().getMaVT() == 'KH' }">
										<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
											<!-- 	<a href="user.html" class="btn px-0"> <i
										class="fas fa-user text-primary"></i>
									</a> -->
											<a href="giohang" class="btn px-0 ml-3"> <i
												class="fas fa-shopping-cart text-primary"></i> <span
												class="badge text-secondary border border-secondary rounded-circle" id="giohang" data-sl="${giohang.size() }"
												style="padding-bottom: 2px;">${giohang.size() }</span>

											</a>
										</div>
									</c:when>
								</c:choose>

							</c:when>
						</c:choose>

					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->
	</div>
	