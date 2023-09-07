<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="test" class="form-horizontal" method="post"
		modelAttribute="test1">
		<form:input path="size" class="form-control" />
		<form:input path="soluong" class="form-control" />
		<form:input path="size" class="form-control" />
		<form:input path="soluong" class="form-control" />

		<div class="form-group row d-flex justify-content-end">
			<button type="submit" class="btn btn-primary">Thêm</button>
			<a href="quanly/danhmucsp" id="cancel-save-modal"
				class="mx-2 btn btn-secondary">Hủy</a>
		</div>
	</form:form>

</body>
</html>