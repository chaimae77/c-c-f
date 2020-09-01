<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Dossiers médicaux</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
			<div class="container-fluid">
				<%@include file="navbar.jsp"%>
				
				<%
					FamilleDAO famDAO = new FamilleDAO();
					List<Famille> familles = new ArrayList<>();
					familles = famDAO.lister();
				%>
				<!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-info card-header-icon">
								<div class="card-icon" style="float: none !important;">
									<h4>Liste des familles</h4>
								</div>
							</div>
							<div class="card-body table-responsive">
								<table class="table table-hover" id="idDataTable">
									<thead class="text-warning">
										<tr>
											<th>Nom de Famille</th>
											<th>Cas Index</th>
											<th>Diagnostic</th>
											<th>Consulter</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (Famille famille : familles) {
										%>
										<tr>
											<td><%=famille.getNomFamille()%></td>
											<td><%=famille.getCasIndex()%></td>
											<td><%=famille.getDiagnostic()%></td>
											<td><a href="listIndDoss.chu?id=<%=famille.getId()%>">
													<i class="material-icons" title="consulter dossier">remove_red_eye</i> 
											    </a>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@include file="piedUt.jsp"%>
</body>
</html>