z<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

<title>Consultation</title>
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

<style type="text/css">
.form-horizontal .control-label {
	text-align: left !important;
}
</style>
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
				IndividuDAO indDAO = new IndividuDAO();
				List<Individu> individus = indDAO.listIndividuByFamille(idFamille);
			%>
			<div class="row">
				<div class="col-md-6 col-lg-offset-0">
					<a class="back" href="espaceUtilisateur.jsp"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-lg-6 col-md-6">
					<button type="button" data-toggle="modal" data-target="#myModal"
						style="float: right; border: none;">
						<i class="material-icons preced">add_circle_outline</i>
					</button>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>
									Liste des individus de la famille
									<%=famille.getNomFamille()%>
								</h4>
							</div>
						</div>
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
										<td><a href="suppInd.chu?id=<%=ind.getId()%>"
											onclick="return(confirm('Etes-vous sï¿½r de vouloir supprimer cet individu?'));"
											title="Supprimer Individu"> <i
												class="material-icons danger">close</i>
										</a> <a href="modIndividu.chu?id=<%=ind.getId()%>"
											title="Modifier Individu"> <i class="material-icons warn">edit</i>
										</a> <a href="compInd.chu?id=<%=ind.getId()%>"
											title="Completer Information"> <i class="material-icons">info</i></a></td>
									</tr>

									<!-- Modal suppression -->
									<%-- 		<div class="modal fade" id="modalDelete" role="dialog">
										<div class="container">
											<div class="col-md-6 col-md-offset-3 ">
												<div class="card">
													<form class="form-horizontal" role="form"
														action="suppInd.chu?id=<%=ind.getId()%>" method="post"
														enctype='multipart/form-data'>
														<div class="card-header card-header-info card-header-icon">
															<div class="card-icon" style="float: none !important;">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4>Supprimer Individu <%=ind.getPrenom() %></h4>
															</div>
														</div>
														<div class="card-body table-responsive">
															<div class="col-md-12 col-sm-12 text-center">
																<p>Etes-vous sur de vouloir supprimer cet individu?</p>
															</div>
															<div class="col-md-6 col-sm-6 text-center">
																<button type="button"
																	class="btn btn-purple waves-effect waves-light ">Annuler</button>
															</div>
															<div class="col-md-6 col-sm-6 text-center">
																<button type="submit"
																	class="btn btn-purple waves-effect waves-light" style="color:white;background: red;">Supprimer</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div> --%>
									<%
										}
									%>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal Ajout-->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="container">
					<div class="card">
						<form class="form-horizontal" role="form"
							action="ajoutIndividu.chu" method="post"
							enctype='multipart/form-data'>
							<!-- <div class="col-md-11  "> -->
							<div class="panel panel-default">

								<div class="card-header card-header-info card-header-icon">
									<div class="card-icon" style="float: none !important;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4>Ajouter un Individu</h4>
									</div>
								</div>

								<div class="card-body table-responsive">
									<div class="col-md-6 ">
										<div class="form-group">
											<input type="hidden" class="form-control" name="famille"
												value="<%=idFamille%>" style="width: 250px">
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="prenom">Pr&eacute;nom:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="prenom"
													id="prenom" placeholder="Entrer le prenom"
													style="width: 250px" required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="nom">Nom:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="nom" id="nom"
													placeholder="Entrer le nom" style="width: 250px" required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Naissance:</label>
											<div class="col-sm-10">
												<input type="text" name="dateNais" placeholder="jj/mm/aaaa"
													class="form-control" id="dateNais" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Sexe:</label>
											<div class="col-sm-10">
												<select class="form-control" name="sexe"
													style="width: 250px" required>
													<option>Masculin</option>
													<option>F&eacute;minin</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Image:</label>
											<div class="col-sm-10">
												<input type="file" class="form-control" name="file"
													id="file" style="width: 250px" required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Origine:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="origine"
													id="origine" placeholder="origine" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Ville:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="ville"
													id="ville" placeholder="La ville" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Adresse:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="adresse"
													id="adresse" placeholder="Adresse" style="width: 250px"
													required>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-md-offset-0">
										<div class="form-group">
											<label class="control-label col-sm-2" for="">R&eacute;gion:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="region"
													id="region" placeholder="La region" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Fixe:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="tel1"
													id="tel1" placeholder="0500000000" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Mobile:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="tel2"
													id="tel2" placeholder="0600000000" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">&Eacute;ducation:</label>
											<div class="col-sm-10">
												<select class="form-control" name="education"
													style="width: 250px" required>
													<option><%=Education.Aucune%></option>
													<option><%=Education.Primaire%></option>
													<option><%=Education.Secondaire%></option>
													<option><%=Education.Universitaire%></option>
													<option><%=Education.Informelle%></option>
													<option><%=Education.autre%></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Niveau:</label>
											<div class="col-sm-10">
												<select class="form-control" name="niveau"
													style="width: 250px" required>
													<option><%=NiveauSocial.BAS%></option>
													<option><%=NiveauSocial.MOYEN%></option>
													<option><%=NiveauSocial.HAUT%></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Couverture:</label>
											<div class="col-sm-10">
												<select class="form-control" name="couverture"
													style="width: 250px" required>
													<option><%=CouvertureMedicale.Aucune%></option>
													<option><%=CouvertureMedicale.Cnops%></option>
													<option><%=CouvertureMedicale.Cnss%></option>
													<option><%=CouvertureMedicale.Privée%></option>
													<option><%=CouvertureMedicale.Ramed%></option>
													<option><%=CouvertureMedicale.Autre%></option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">Travail:</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="occupation"
													id="occupation" placeholder="Travail" style="width: 250px"
													required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="">R&eacute;sidence:</label>
											<div class="col-sm-10">
												<div
													class="checkbox checkbox-info checkbox-circle col-sm-10 col-sm-offeset-1">
													<input id="urbain" type="checkbox" name="urbain"> <label
														for="urbain"> Urbaine </label>
												</div>
												<div
													class="checkbox checkbox-primary checkbox-circle col-sm-10 col-sm-offeset-1">
													<input id="rural" type="checkbox" name="rural"> <label
														for="rural"> Rurale </label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit"
													class="btn btn-purple waves-effect waves-light btnCardInfo">
													Enregistrer</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- </div> -->
						</form>
					</div>
					<!-- </div> -->
				</div>
				<!-- </div> -->
			</div>
		</div>
	</div>

</body>

<%@include file="piedUt.jsp"%>

</html>