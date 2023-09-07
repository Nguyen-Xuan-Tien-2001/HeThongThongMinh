<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JavaScript Libraries -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='resources/user/lib/easing/easing.min.js'/>"></script>
<script
	src="<c:url value='resources/user/lib/owlcarousel/owl.carousel.min.js'/>"></script>
<script
	src="<c:url value='resources/employee/plugins/toastr/toastr.min.js'/>"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="<c:url value='resources/user/lib/alertify/alertify.min.js'/>"></script>

<!-- Contact Javascript File -->
<script
	src="<c:url value='resources/user/mail/jqBootstrapValidation.min.js'/>"></script>
<script src="<c:url value='resources/user/mail/contact.js'/>"></script>

<!-- Template Javascript -->
<script src="<c:url value='resources/user/js/main.js'/>"></script>
<script src="<c:url value='resources/user/js/product.js'/>"></script>
<script src="<c:url value='resources/user/js/handleScroll.js'/>"></script>
<script src="<c:url value='resources/user/js/multiStep.js'/>"></script>

<script>
  
   	window.addEventListener( "pageshow", function ( event ) {
  var historyTraversal = event.persisted || 
                         ( typeof window.performance != "undefined" && 
                              window.performance.navigation.type === 2 );
  if ( historyTraversal && !window.location.href.includes("sanpham")) {
    // Handle page restore.
    window.location.reload();
  }
});
   </script>
