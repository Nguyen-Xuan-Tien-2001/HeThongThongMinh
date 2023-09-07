<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>






<!-- <footer class="main-footer">
	<div class="float-right d-none d-sm-block">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright &copy; 2014-2022 <a
		href="https://adminlte.io">AdminLTE.io</a>.
	</strong> All rights reserved.
</footer> -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- resources/employee/wrapper -->

<!-- jQuery -->
<script
	src="<c:url value='resources/employee/plugins/jquery/jquery.min.js' />"></script>
<!-- Bootstrap 4 -->
<script
	src="<c:url value='resources/employee/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
<!-- Select2 -->
<script
	src="<c:url value='resources/employee/plugins/select2/js/select2.full.min.js' />"></script>
<!-- Bootstrap4 Duallistbox -->
<script
	src="<c:url value='resources/employee/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js' />"></script>
<!-- InputMask -->
<script
	src="<c:url value='resources/employee/plugins/moment/moment.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/inputmask/jquery.inputmask.min.js' />"></script>
<!-- date-range-picker -->
<script
	src="<c:url value='resources/employee/plugins/daterangepicker/daterangepicker.js' />"></script>
<!-- bootstrap color picker -->
<script
	src="<c:url value='resources/employee/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js' />"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="<c:url value='resources/employee/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
<!-- Bootstrap Switch -->
<script
	src="<c:url value='resources/employee/plugins/bootstrap-switch/js/bootstrap-switch.min.js' />"></script>
<!-- BS-Stepper -->
<script
	src="<c:url value='resources/employee/plugins/bs-stepper/js/bs-stepper.min.js' />"></script>
<!-- dropzonejs -->
<script
	src="<c:url value='resources/employee/plugins/dropzone/min/dropzone.min.js' />"></script>
<!-- DataTables  & Plugins -->
<script
	src="<c:url value='resources/employee/plugins/datatables/jquery.dataTables.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-responsive/js/dataTables.responsive.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-responsive/js/responsive.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-buttons/js/dataTables.buttons.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-buttons/js/buttons.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/jszip/jszip.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/pdfmake/pdfmake.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/pdfmake/vfs_fonts.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-buttons/js/buttons.html5.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-buttons/js/buttons.print.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/datatables-buttons/js/buttons.colVis.min.js' />"></script>
<script
	src="<c:url value='resources/employee/plugins/toastr/toastr.min.js'/>"></script>
<!--  ekko-lightbox show img--->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"
	integrity="sha512-Y2IiVZeaBwXG1wSV7f13plqlmFOx8MdjuHyYFVoYzhyRr3nH/NMDjTBSswijzADdNzMyWNetbLMfOpIPl6Cv9g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Alertify -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/alertify.min.js"
	integrity="sha512-JnjG+Wt53GspUQXQhc+c4j8SBERsgJAoHeehagKHlxQN+MtCCmFDghX9/AcbkkNRZptyZU4zC8utK59M5L45Iw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- AdminLTE App -->
<script
	src="<c:url value='resources/employee/dist/js/adminlte.min.js' />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='resources/employee/dist/js/demo.js' />"></script>
<!-- Page specific script -->
<!-- Custom js -->
<script src="<c:url value='resources/employee/dist/js/main.js' />"></script>
<script src="<c:url value='resources/employee/dist/js/phieunhap.js' />"></script>

<script>
   $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L',
       defaultDate: new Date()
    });

    //Date and time picker
    $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    })

  })
  
    // Click Open Img
    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
      event.preventDefault();
      $(this).ekkoLightbox();
    });

    // Datatable
    $(function () {
    
    $("#bangsanpham").DataTable({"responsive": true,
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
        columnDefs: [{
          orderable: false,
          targets: 6
        }, ] })
     
    
    $("#bangnhacc").DataTable({"responsive": true,
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
        columnDefs: [{
          orderable: false,
          targets: 4
        }, ] })
    
    
     $("#bangdanhmucsp").DataTable({"responsive": true,
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
        columnDefs: [{
          orderable: false,
          targets: 3
        }, ] })
    
    $("#bangdonhang").DataTable({"responsive": true,
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
        columnDefs: [{
          orderable: false,
          targets: 4
        }, ] })
    
    $("#bangnhaphang").DataTable({"responsive": true,
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
        columnDefs: [{
          orderable: false,
          targets: 5
        }, ] })
    
      $("#example3").DataTable({
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
        columnDefs: [{
          orderable: false,
          targets: 1
        }, {
          orderable: false,
          targets: 6
        }]

      })
      
      $("#bangnhanvien").DataTable({
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
        columnDefs: [{
          orderable: false,
          targets: 1
        }, {
          orderable: false,
          targets: 6
        }]

      })
      $("#example1").DataTable({
        "responsive": true,
        "lengthChange": false,
        "autoWidth": false,
        "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
      });
    });
    
   

  </script>
</body>

</html>
