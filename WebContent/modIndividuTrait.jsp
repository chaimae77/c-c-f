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
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Individu</title>
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
				Individu ind = new Individu();
				ind = (Individu) session.getAttribute("Individu");
			%>
			<div class="row">
				<div class="col-md-12 col-lg-offset-0">
					<a class="back" href="listInd.chu?id=<%=ind.getFamille().getId()%>"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-md-12 col-sm-12 ">
					<div class="card">
						<form class="form-horizontal" role="form"
							action="modIndividuTrait.chu" method="post">
							<div class="card-header card-header-info card-header-icon">
								<div class="card-icon" style="float: none !important;">
									<h4>
										Modification des Informations de <strong><%=ind.getNom()%>
											<%=ind.getPrenom()%></strong>
									</h4>
								</div>
							</div>
							<div class="card-body table-responsive">
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<input type="hidden" class="form-control" name="idIndividu"
											value="<%=ind.getId()%>">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" name="famille"
											value="<%=ind.getFamille().getId()%>">
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="nom">Nom:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="nom" id="nom"
												value="<%=ind.getNom()%>" style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="prenom">Pr&eacute;nom:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="prenom"
												id="prenom" value="<%=ind.getPrenom()%>"
												style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Naissance:</label>
										<%
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(ind.getDateNaissance());
										%>
										<div class="col-sm-10">
											<input type="text" name="dateNais" value="<%=dateFormatee%>"
												class="form-control" id="dateNais" style="width: 250px"
												required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Sexe:</label>
										<div class="col-sm-10">
											<select class="form-control" name="sexe" style="width: 250px"
												required>
												<option><%=ind.getSexe()%></option>
												<option>Masculin</option>
												<option>F&eacute;minin</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Origine:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="origine"
												id="origine" value="<%=ind.getOrigine()%>"
												style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Ville:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="ville"
												id="ville" value="<%=ind.getVille()%>" style="width: 250px"
												required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Adresse:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="adresse"
												id="adresse" value="<%=ind.getAdresse()%>"
												style="width: 250px" required>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label class="control-label col-sm-2" for="">R&eacute;gion:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="region"
												id="region" value="<%=ind.getRegion()%>"
												style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Fixe:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="tel1" id="tel1"
												value="<%=ind.getTel1()%>" style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">Mobile:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="tel2" id="tel2"
												value="<%=ind.getTel2()%>" style="width: 250px" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="">&Eacute;ducation:</label>
										<div class="col-sm-10">
											<select class="form-control" name="education"
												style="width: 250px" required>
												<option><%=ind.getEducation()%></option>
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
												<option><%=ind.getNiveauSocial()%></option>
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
												<option><%=ind.getCouvertMedicale()%></option>
												<option><%=CouvertureMedicale.Aucune%></option>
												<option><%=CouvertureMedicale.Cnops%></option>
												<option><%=CouvertureMedicale.Cnss%></option>
												<option><%=CouvertureMedicale.Privée%></option>
												<option><%=CouvertureMedicale.Ramed%></option>
												<option><%=CouvertureMedicale.Autre%></option>
											</select>
										</div>
									</div>
									<%-- <div class="form-group">
										<label class="control-label col-sm-2" for="">Travail:</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="occupation"
												id="occupation" value="<%=ind %>" style="width: 250px"
												required>
										</div>
									</div> --%>
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
										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@include file="piedUt.jsp"%>

</html>