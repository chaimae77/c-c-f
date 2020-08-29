<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html lang="fr">

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

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<div class="row">
				<div class="col-md-1 col-lg-offset-0">
					<a href="gestionUtilisateurs.jsp"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-lg-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Modifier un Utilisateur</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" action="modUtilisateur.chu" method="post">
								<%
									Utilisateur user = (Utilisateur) session.getAttribute("user");
								%>

								<div class="form-group">

									<input type="hidden" class="form-control" name="idUser"
										value="<%=user.getId()%>" placeholder="">
								</div>

								<div class="form-group">
									<label class="col-sm-4 control-label">Nom</label> <input
										type="text" class="form-control" name="nom"
										value="<%=user.getNom()%>" required>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Prénom</label> <input
										type="text" class="form-control" name="prenom"
										value="<%=user.getPrenom()%>" required>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Email</label> <input
										type="email" class="form-control" name="email"
										value="<%=user.getEmail()%>" required>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Login</label> <input
										type="text" class="form-control" name="login"
										value="<%=user.getLogin()%>" required>
								</div>
								<div class="form-group">
									<label class="col-sm-12 control-label">Role</label> <select
										class="form-control" name="role" style="width: 250px" required>
										<option>Medecin</option>
										<option>Infirmier</option>
										<option>Utilisateur</option>
									</select>
								</div>
								<button type="submit"
									class="btn btn-purple waves-effect waves-light btnCardInfo">Modifier</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- End row -->

		</div>
		<!-- /#wrapper -->
	</div>
</body>
</html>
