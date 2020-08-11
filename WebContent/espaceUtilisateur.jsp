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

<title></title>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<!-- Bootstrap Core CSS -->
<link href="assetss/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="css/plugins/morris.css" rel="stylesheet">


<style type="text/css">
.navbar-nav>li {
	float: none !important;
	display: flex;
	justify-content: center;
}
</style>
<!--  -->
<script src="assetss/js/scripts.js"></script>

</head>

<body>

	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header" style="text-align: center">
							<img class="img" src="images\logo.png " width="" height=""
								alt="logo" /><small></small>
						</h3>
						<h3 class="page-header">
							Gestion des familles <small></small>
						</h3>
					</div>
					<div class="container-fluid"></div>
					<!-- /.row -->
					<div class="row">

						<div class="col-lg-12">
							<div class="panel-actions">
								<button type="button" class="btn btn-info btn-sm pull-right"
									data-toggle="modal" data-target="#myModal">Ajouter</button>
							</div>
							</br> </br>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">Liste des familles</h3>
								</div>

								<div class="panel-body">
									<%
										FamilleDAO famDAO = new FamilleDAO();
										List<Famille> familles = new ArrayList<>();
										familles = famDAO.lister();
									%>
									<table id="idDataTable" class="table table-striped">
										<thead>
											<tr>
												<th></th>
												<th>Nom de Famille</th>
												<th>Cas Index</th>
												<th>Diagnostic</th>
											</tr>
										</thead>
										<tbody>
											<%
												int i = 1;
												for (Famille famille : familles) {
											%>
											<tr>
												<td><%=i%></td>
												<td><%=famille.getNomFamille()%></td>
												<td><%=famille.getCasIndex()%></td>
												<td><%=famille.getDiagnostic()%></td>
												<td><a href="listInd.chu?id=<%=famille.getId()%>">
														<i class="fa fa-eye"> </i> Consulter
												</a> <a href="modFamille.chu?id=<%=famille.getId()%>"><i
														class="fa fa-pencil-square-o"></i> Modifier </a> <a
													href="arbre.chu?id=<%=famille.getId()%>"><i
														class="fa fa-eye"></i> Arbre Genealogique</a></td>
											</tr>

											<%
												i++;
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
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Ajout d'une famille</h4>
					</div>
					<div class="modal-body">
						<form role="form" action="ajoutFamille.chu" method="post">
							<div class="form-group">
								<label for="nomFamille">Nom de la famille</label> <input
									type="text" class="form-control" name="nomFamille"
									placeholder="Entrer le nom de la famille">
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">Dignostic:</label>
								<div class="col-sm-8">
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
							</br> </br>
							<button type="submit"
								class="btn btn-purple waves-effect waves-light">Enregistrer</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>


		<script src="assetss/js/common/jquery.min.js"></script>
		<script src="assetss/bootstrap/js/bootstrap.min.js"></script>

</body>
<%@include file="piedUt.jsp"%>
</html>
