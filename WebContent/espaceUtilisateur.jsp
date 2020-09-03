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

<title>Gestion des familles</title>
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
	<!--principal wrapper-->
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<%@include file="navbar.jsp"%>

			<%
				FamilleDAO famDAO = new FamilleDAO();
				List<Famille> familles = new ArrayList<>();
				familles = famDAO.lister();
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
										<th></th>
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
										<td><a href="listInd.chu?id=<%=famille.getId()%>"> <i
												class="material-icons " title="Liste Individu">remove_red_eye</i>
										</a> <a href="modFamille.chu?id=<%=famille.getId()%>"> <i
												class="material-icons " title="Modifier">edit</i>
										</a> <a href="arbre.chu?id=<%=famille.getId()%>"> <i
												class="material-icons " title="Arbre Généalogique">account_tree</i>
										</a></td>
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
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>Ajouter une famille</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" action="ajoutFamille.chu" method="post">
								<div class="form-group">
									<label for="nomFamille">Nom de la famille</label> <input
										type="text" class="form-control" name="nomFamille"
										placeholder="Entrer le nom de la famille">
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
								<button type="submit"
									class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="piedUt.jsp"%>

</html>