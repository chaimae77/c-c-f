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

<title>Espace Utilisateur</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
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
				UtilisateurDAO userDAO = new UtilisateurDAO();
				List<Utilisateur> users = new ArrayList<>();
				users = userDAO.listerUsers();
				SimpleDateFormat formatDateJour = new SimpleDateFormat("yyyy-MM-dd");
			%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<button type="button" data-toggle="modal" data-target="#myModal"
						style="float: right; border: none;">
						<i class="material-icons preced">add_circle_outline</i>
					</button>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Liste des Utilisateurs</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
									<tr>
										<th>Nom</th>
										<th>Prenom</th>
										<th>Email</th>
										<th>Login</th>
										<th>Role</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Utilisateur user : users) {
									%>
									<tr>
										<td><%=user.getNom()%></td>
										<td><%=user.getPrenom()%></td>
										<td><%=user.getEmail()%></td>
										<td><%=user.getLogin()%></td>
										<td><%=user.getRole().getRoleName()%></td>
										<td><a href="modUser.chu?id=<%=user.getId()%>">
											<i class="material-icons warn" title="Modifier user">edit</i>
											</a> 
											<a href="suppUtilisateur.chu?id=<%=user.getId()%>"
											onclick="return(confirm('Etes-vous sûr de vouloir supprimer cet Utilisateur?'));">
											<i class="material-icons danger" title="supprimer user">close</i>
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

			<!-- /.container-fluid -->
		</div>
		<!-- /#wrapper -->
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="card">
					<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>Ajouter un nouveau Utilisateur</h4>
						</div>
					</div>
					<div class="card-body table-responsive">
						<form role="form" action="ajoutUtilisateur.chu" method="post">
							<div class="form-group">
								<label class="col-sm-4 control-label">Nom</label> <input
									type="text" class="form-control" name="nom" required>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Prénom</label> <input
									type="text" class="form-control" name="prenom" required>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Email</label> <input
									type="email" class="form-control" name="email" required>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Login</label> <input
									type="text" class="form-control" name="login" required>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Mot de passe</label> <input
									type="password" class="form-control" name="password" required>
							</div>
							<div class="form-group">
								<label class="col-sm-12 control-label">Role</label> <select
									class="form-control" name="role"  required>
									<option>Medecin</option>
									<option>Infirmier</option>
									<option>Utilisateur</option>
								</select>
							</div>
							<button type="submit"
								class="btn btn-purple waves-effect waves-light btnCardInfo">Enregistrer</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="piedUt.jsp"%>
</body>
</html>

