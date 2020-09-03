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

<title>Modification d'une famille</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>

		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<%
				String id_Famille = (String) session.getAttribute("idFamille");
				int idFamille = Integer.parseInt(id_Famille);
				FamilleDAO famDAO = new FamilleDAO();
				Famille famille = famDAO.trouverFamilleById(idFamille);
			%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<a class="back" href="espaceUtilisateur.jsp"><i class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-lg-8 col-md-8 col-md-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Modification du  Dossier de <strong><%=famille.getNomFamille() %></strong></h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" action="modFamilleTrait.chu" method="post">
								<div class="form-group">
									<input type="hidden" class="form-control"
										name="idAncienFamille" value="<%=famille.getId()%>"
										placeholder="">
								</div>
								<div class="form-group">
									<label for="nomFamille">Nom de la famille</label> <input
										type="text" class="form-control" name="nomFamille"
										value="<%=famille.getNomFamille()%>">
								</div>
								<div class="form-group">
									<label class="control-label">Dignostic:</label>
									<div class="">
										<%
											SyndromeFamilleDAO diagDAO = new SyndromeFamilleDAO();
											List<SyndromeFamille> diagnostics = new ArrayList<>();
											diagnostics = diagDAO.listerDiagnostic();
										%>
										<select class="form-control" name="diagnostic">
											<option value="<%=famille.getDiagnostic().getId()%>">
												<%=famille.getDiagnostic()%></option>
											<%
												for (SyndromeFamille diag : diagnostics) {
											%>

											<option value="<%=diag.getId()%>"><%=diag%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<br> <br>
								<button type="submit"
									class="btn btn-info waves-effect waves-light">Modifier</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>