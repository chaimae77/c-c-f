<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Détail génétique</title>
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
		<%@include file="enteteUt.jsp"%>
	
			<div class="container-fluid">
			 <%@include file="navbar.jsp"%>
			 	<div class="col-lg-12 ">
                    <div class="panel-body">
                        <a href="statut.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:100px">Satut</button></a>
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Génétique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Traitement</button></a>
                    </div>                       
                </div>
                
         
				
			
					<div class="row">
					<div class="col-md-8 col-md-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détail de génétiques</h4>
							</div>
						</div>

								<div class="panel-body">
									<%
										Genetique gen = (Genetique)session.getAttribute("Genetique");
										System.out.println("genetique "+gen);
									%>
									<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
											<tr>
										        <th>Hopital</th>
												<th>Numero Dossier Genetique</th>
												<th>Instabilite Macroscopique</th>
												<th>Mutation BRAF</th>
												<th>Mutation Kras</th>
												<th>Mutation APC</th>
												<th>Mutation MYH</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><%=gen.getHopital() %></td>
												<td><%=gen.getNumeroDossierGenetique() %></td>
												<td><%=gen.getInstabiliteMacroscopique() %></td>
												<td><%=gen.getMutaBRAF() %></td>
												<td><%=gen.getMutaKras() %></td>
												<td><%=gen.getMutaAPC() %></td>
												<td><%=gen.getMutaMYH() %></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- panel-body -->

							</div>
							<!-- panel -->
						</div>

					</div>
					<!-- End row -->

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

			<%@include file="piedUt.jsp"%>
		</div>
		<!-- /#wrapper -->

	</div>
</body>


</html>