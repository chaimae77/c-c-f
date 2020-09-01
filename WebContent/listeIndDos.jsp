<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
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


			<!-- /.row -->
			<div class="row">
				<div class="col-md-1 col-lg-offset-0">
					<a href="gestionDossier.jsp"><i class="material-icons preced">arrow_back</i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Liste des individus de la famille :</h4>
							</div>
						</div>
						<%
									String id_Famille = (String) session.getAttribute("idFamille");
									int idFamille = Integer.parseInt(id_Famille);
									IndividuDAO indDAO = new IndividuDAO();
									List<Individu> individus = indDAO.listIndividuByFamille(idFamille);
								%>
						<div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
									<tr>
										<th>Nom</th>
										<th>Prenom</th>
										<th>Date de Naissance</th>
										<th></th>

									</tr>
								</thead>
								<tbody>
									<%
													for (Individu ind : individus) {
													SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
													String dateFormatee = formatDateJour.format(ind.getDateNaissance());
											%>

									<tr>
										<td><%=ind.getNom()%></td>
										<td><%=ind.getPrenom()%></td>
										<td><%=dateFormatee%></td>
										<%
												if (ind.getDossier() == null) {
											%>
										<td><a href="dossier.chu?id=<%=ind.getId()%>"><i
												class="material-icons" title="Ajouter dossier">library_add</i></a></td>
										<%
												} else {
											%>
										<td><a
											href="modifier.chu?id=<%=ind.getDossier().getId()%>"><i
												class="material-icons " title="modifier le dossier">edit</i></a>
											<a href="examen.chu?id=<%=ind.getDossier().getId()%>"> <i
												class="material-icons" title="consulter le dossier">remove_red_eye</i></a><a
											href="rapportMedical.chu?id=<%=ind.getDossier().getId()%>">
												<i class="material-icons" title="consulter le rapport">text_snippet</i>
										</a></td>
										<%
												}
													}
											%>
									
								</tbody>
							</table>
						</div>
						<!-- panel-body -->

					</div>
					<!-- panel -->
				</div>
				<!-- col-->

			</div>
			<!-- End row -->
		</div>
		<!-- /.container-fluid -->



	</div>
	<!-- /#wrapper -->
	</div>
	<%@include file="piedUt.jsp"%>
</body>
</html>