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

<title>Completer les informations</title>
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
				Individu ind = new Individu();
				ind = (Individu) session.getAttribute("Individu");
				int idFamille = ind.getFamille().getId();
			%>
			<div class="row">
				<div class="col-md-12 col-lg-offset-0">
					<a class="back" href="listInd.chu?id=<%=idFamille%>"><i class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-md-6 col-sm-12 ">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>D&eacute;clarer une consanguinit&eacute;</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form"
								action="ajoutConsang.chu" method="post">
								<div class="form-group">
									<label  class="form-control-label">Membre concern&eacute;:</label>
									<div>
										<input type="text" name="" value="<%=ind.toString()%>"
											class="form-control" required> <input type="hidden"
											name="individu" value="<%=ind.getId()%>" class="form-control"
											required>
									</div>
								</div>
								<div class="form-group">
									<label for="degre" >Degr&eacute;:</label>
									<input type="text" class="form-control" name="degre" id="degre"
										placeholder="degre" required>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 ">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Enregistrer le consentement sign&eacute;</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form"
								action="ajoutConsentement.chu" method="post">

								<div class="form-group">
									<label class="control-label">Individu:</label>
									<div class="">
										<input type="text" name="" value="<%=ind.toString()%>"
											class="form-control" required> <input type="hidden"
											name="individu" value="<%=ind.getId()%>" class="form-control"
											required>
									</div>
								</div>
								<div class="form-group">
									<label for="date" class="control-label">Date:</label>
									<div class="">
										<input type="text" name="dateCons" placeholder="jj/mm/aaaa"
											class="form-control" id="dateCons" required>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Ajouter un couple</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form"
								action="ajoutCouple.chu" method="post">
								<div class="form-group">
									<label class="control-label">Femme:</label>
									<%
										List<Individu> individus = new ArrayList<>();
										IndividuDAO indDAO = new IndividuDAO();
										String nom_Famille = ind.getFamille().getNomFamille();
										individus = indDAO.listIndividuByNomFamille(nom_Famille);
									%>
									<div class="">
										<select class="form-control" name="ind1" required>
											<option>Inconue</option>
											<%
												if (nom_Famille != null) {
													if (!individus.isEmpty()) {
														for (Individu d1 : individus) {
											%>
											<option value="<%=d1.getId()%>"><%=d1%></option>
											<%
												}
													}
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label">Mari:</label>
									<div class="">
										<select class="form-control" name="ind2" required>
											<option>Inconu</option>
											<%
												if (nom_Famille != null) {
													if (!individus.isEmpty()) {
														for (Individu d2 : individus) {
											%>
											<option value="<%=d2.getId()%>"><%=d2%></option>
											<%
												}
													}
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
							</form>
						</div>
					</div>

				</div>
				<div class="col-md-6 col-sm-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Compl&eacute;ter un couple</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form"
								action="ajoutMembre.chu" method="post">
								<div class="form-group">
									<label class="control-label">Conjoint:</label>
									<div class="">
										<input type="text" name="" value="<%=ind.toString()%>"
											class="form-control" required> <input type="hidden"
											name="menbre" value="<%=ind.getId()%>" class="form-control"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label">Couple:</label>
									<div class="">
										<%
											List<Couple> couples = new ArrayList<>();
											couples = indDAO.listCoupleByNomFamille(nom_Famille);
										%>
										<select class="form-control" name="couple" required>
											<%
												if (nom_Famille != null) {
													if (!couples.isEmpty()) {
														for (Couple couple : couples) {
											%>
											<option value="<%=couple.getId()%>"><%=couple%></option>
											<%
												}
													}
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>D&eacute;clarer un fils d'un couple</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form" action="ajoutFils.chu"
								method="post">
								<div class="form-group">
									<label class="control-label">Fils:</label>
									<div class="">
										<input type="text" name="" value="<%=ind.toString()%>"
											class="form-control" required> <input type="hidden"
											name="fils" value="<%=ind.getId()%>" class="form-control"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label">Couple:</label>
									<div class="">
										<select class="form-control" name="couple" required>
											<%
												if (nom_Famille != null) {
													if (!couples.isEmpty()) {
														for (Couple couple : couples) {
											%>
											<option value="<%=couple.getId()%>"><%=couple%></option>
											<%
												}
													}

												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 ">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>D&eacute;clarer un cas de d&eacute;c&egrave;s</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form class="form-horizontal" role="form"
								action="ajoutDecces.chu" method="post">
								<div class="form-group">
									<label class="control-label">D&eacute;funt:</label>
									<div>
										<input type="text" name="" value="<%=ind.toString()%>"
											class="form-control" required> <input type="hidden"
											name="individu" value="<%=ind.getId()%>" class="form-control"
											required>
									</div>
								</div>
								<div class="form-group">
									<label for="date" class="control-label">Date:</label>
									<div>
										<input type="text" name="dateDeces" placeholder="jj/mm/aaaa"
											class="form-control" id="dateDeces" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label">Cause:</label>
									<div class="">
										<%
											MotifDeccesDAO motifDAO = new MotifDeccesDAO();
											List<MotifDecces> motifs = new ArrayList<>();
											motifs = motifDAO.listerLesMotif();
										%>
										<select class="form-control" name="motif" required>
											<%
												for (MotifDecces motif : motifs) {
											%>
											<option value="<%=motif.getId()%>"><%=motif%>
											</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</div>
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