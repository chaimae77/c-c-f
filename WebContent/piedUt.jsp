<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"
	defer></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"
	defer></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#idDataTable').DataTable();
	});
</script>
<!-- <script type="text/javascript">

		/* $(".nav-item a").on("click", function() {
			$(".nav-item a").removeClass("active");
			$(this).addClass("active");
		}); */
		$('.nav-item a').trigger('click');
		$(".nav-item a").removeClass("active");
		$(this).addClass("active");
</script> -->