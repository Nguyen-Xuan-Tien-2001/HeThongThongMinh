<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--<%@include file="/WEB-INF/views/taglib/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">-->

<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JUNO</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"
	integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Google Font: Source Sans Pro -->
<!-- <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="shortcut icon" href="https://file.hstatic.net/1000003969/file/favicon-juno_8afc5c05a55941aa88438ce9264f03f3.png" type="image/png">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<!-- Font Awesome Icons -->

<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/fontawesome-free/css/all.min.css' />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/daterangepicker/daterangepicker.css' />">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css' />">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">
<!-- Select2 -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/select2/css/select2.min.css' />">
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css' />">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css' />">
<!-- BS Stepper -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/bs-stepper/css/bs-stepper.min.css' />">
<!-- dropzonejs -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/dropzone/min/dropzone.min.css' />">
<!-- DataTables -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css' />">
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/datatables-responsive/css/responsive.bootstrap4.min.css' />">
<link rel="stylesheet"
	href="<c:url value='resources/employee/plugins/datatables-buttons/css/buttons.bootstrap4.min.css'/> ">
<!-- ekko-lightbox show img -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
	integrity="sha512-Velp0ebMKjcd9RiCoaHhLXkR1sFoCCWXNp6w4zj1hfMifYB5441C+sKeBl/T/Ka6NjBiRfBBQRaQq65ekYz3UQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Alertify -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<link href="resources/employee/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='resources/employee/dist/css/adminlte.min.css' />">
</head>
<link rel="stylesheet"
	href="<c:url value='resources/employee/dist/css/style-d.css' />">


<!-- <body class="hold-transition sidebar-mini"> -->

<body class="hold-transition">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">


				<!-- Notifications Dropdown Menu -->
				<!-- <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-item dropdown-header">15 Notifications</span>
            <div class="dropdown-divider"></div>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> 3 new reports
              <span class="float-right text-muted text-sm">2 days</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
          </div>
        </li>-->
				<li class="nav-item dropdown user-menu"><a href="#"
					class="nav-link dropdown-toggle" data-toggle="dropdown"> <img
						src="resources/file/${user.getNhanVien().getAnh() }"
						class="user-image img-circle elevation-2" alt="User Image">
						<span class="d-none d-md-inline">${user.getNhanVien().getHo() }
							${user.getNhanVien().getTen() } </span>
				</a>
					<div class="dropdown-menu " style="width: 160px;">
						<a href="tongquan/${user.getNhanVien().getMaNV()}?chinhsua"
							class="dropdown-item">Tài khoản</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" tabindex="-1" href="dangxuat">Đăng
							xuất</a>
					</div></li>

				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>


		<!-- /.navbar -->