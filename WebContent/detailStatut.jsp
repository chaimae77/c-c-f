<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>D�tail statut</title>

  <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    
    


</head>
<body>

    <div id="wrapper">
	<%@include file="enteteUt.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">
    <%@include file="navbar.jsp"%>
              
                <!-- /.row -->
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>D�tail des Statuts</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<%
									String idStatut = (String) session.getAttribute("idStatut");
									int id = Integer.parseInt(idStatut);
									StatutDAO type = new StatutDAO();
									StatutCancereux statut = type.trouverStautById(id);
								%>
									<th>Type Statut</th>
									<th>Ann�e</th>
									<th>Age</th>
									<th>Site</th>
									<th>T</th>
									<th>M</th>
									<th>N</th>
									</thead>
								<tbody>
								<tr>
											<td><%=statut.getTypeStatut()%></td>
											<td><%=statut.getAnnee()%></td>
											<td><%=statut.getAge()%></td>
											<td><%=statut.getSite()%></td>
											<td><%=statut.getT()%></td>
											<td><%=statut.getM()%></td>
											<td><%=statut.getN()%></td>
										</tr>

							
								
								
									</tbody>
								</table>
							</div>
						

						</div>
						
					</div>
				
	</div> <!-- End row -->
				
            </div>
         
			
        </div>
        <!-- /#page-wrapper -->
        
	<%@include file="piedUt.jsp" %>
    </div>
    <!-- /#wrapper -->
    
    </div>
    </body>
    
	
</html>