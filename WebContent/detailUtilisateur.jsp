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
	
    <title>Espace Utilisateur</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	


    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    
    


</head>
<body>

    <div id="wrapper">
	<%@include file="enteteAdmin.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                  <h3 class="page-header" style="text-align:center">
                            <img class="img"  src="images\logo.png " width="" height="" alt="logo"/><small></small>
                   </h3>
                <!-- /.row -->
				<div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                <h3 class="page-header">D�tail des status</h3>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Detail de Statut</h3>
							</div>

							<div class="panel-body">
								<%
									Utilisateur utilisateur =(Utilisateur)session.getAttribute("Utilisateur");
								%>
								<table id="basic-datatables" class="table table-striped">
									<thead>
										<tr>
											<th>Nom</th>
											<th>Prenom</th>
											<th>Email</th>
											<th>Login</th>
											<th>Photo</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=utilisateur.getNom()%></td>
											<td><%=utilisateur.getPrenom()%></td>
											<td><%=utilisateur.getEmail()%></td>
											<td><%=utilisateur.getLogin()%></td>
											<td><%=utilisateur.getPhoto()%></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- panel-body -->

						</div>
						<!-- panel -->
					</div>
				
	</div> <!-- End row -->
				
            </div>
            <!-- /.container-fluid -->
			
        </div>
        <!-- /#page-wrapper -->
        
	<%@include file="piedUt.jsp" %>
    </div>
    <!-- /#wrapper -->
    
    </div>
    </body>
    
	
</html>