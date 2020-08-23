<%@page import="com.google.gson.Gson"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Rapport Médical</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<link href="css/sb-admin.css" rel="stylesheet">
<style type="text/css">
.container {
	padding: 15px;
}

@media print {
	#printPageButton {
		display: none;
	}
	.material-icons, .back{
	display: none;
	}
	.card-header-info {
		background: linear-gradient(60deg, #26c6da, #00acc1) !important;
		color: white !important;
		-webkit-print-color-adjust: exact;
	}
	.card {
		box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14) !important;
		border: 0 !important;
		border-radius: 6px !important;
		color: rgba(0, 0, 0, 0.87) !important;
		background: #fff !important;
		width: 100% !important;
		margin-bottom: 30px !important;
		margin-top: 30px !important;
	}
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
	
</script>
</head>
<body>

	<div id="wrapper">
		<div class="container">
			<%
				String id_Dossier = (String) session.getAttribute("idDossier");
				int idDossier = Integer.parseInt(id_Dossier);
				DossierDAO dosDAO = new DossierDAO();
				DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
				int idPatient = dos.getPatient().getId();
			%>
			<!-- /.row -->


			<!-- <div id="content"> -->
			<div class="row">
				<div class="col-md-1 col-lg-offset-0">
					<a class="back" href="listIndDoss.chu?id=<%=dos.getPatient().getFamille().getId()%>"><i class="material-icons preced">arrow_back</i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<img src="images/CHU_Images/<%=dos.getPatient().getImage()%>"
						width=100px; height=100px; />
				</div>
				<div class="col-md-6">
					<h2 style="text-align: center;">
						Rapport médical de
						<%=dos.getPatient()%></h2>
				</div>
			</div>

			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<%
						SimpleDateFormat formatDateNaiss = new SimpleDateFormat("dd/MM/yyyy");
						String dateFormat = formatDateNaiss.format(dos.getPatient().getDateNaissance());
					%>
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails du Patient</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Nom Complet</th>
										<th>Sexe</th>
										<th>Date de naissance</th>
										<th>Couverture Médical</th>
										<th>Téléphone</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%-- 
										<td><img
											src="images/CHU_Images/<%=dos.getPatient().getImage()%>"
											 /></td> --%>
										<td><%=dos.getPatient()%></td>
										<td><%=dos.getPatient().getSexe()%></td>
										<td><%=dateFormat%></td>
										<td><%=dos.getPatient().getCouvertMedicale()%></td>
										<td><%=dos.getPatient().getTel1()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					StatutDAO statDAO = new StatutDAO();
					List<StatutCancereux> statuts = new ArrayList<>();
					statuts = statDAO.listerStatutParIndividu(idPatient);
					/* if (!statuts.isEmpty()) { */
				%>

				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails de Statut</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Type Statut</th>
										<th>Année</th>
										<th>Age</th>
										<th>Site</th>
										<th>T</th>
										<th>M</th>
										<th>N</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (StatutCancereux statut : statuts) {
									%>
									<tr>
										<td><%=statut.getTypeStatut()%></td>
										<td><%=statut.getAnnee()%></td>
										<td><%=statut.getAge()%></td>
										<td><%=statut.getSite()%></td>
										<td><%=statut.getT()%></td>
										<td><%=statut.getM()%></td>
										<td><%=statut.getN()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<ExamenPreOp> examensPre = new ArrayList<>();
					examensPre = dosDAO.listerExamenPreOpParPatient(idPatient);
					List<ExamenPostOp> examensPost = new ArrayList<>();
					examensPost = dosDAO.listerExamenPostOPParPatient(idPatient);
				%>

				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Examen Clinique Pré Opératoire</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Hopital</th>
										<th>Date:</th>
										<th>Poids:</th>
										<th>Taille:</th>
										<th>OMS:</th>
										<th>IMC</th>
										<th>Type d'examen</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (ExamenPreOp examen : examensPre) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(examen.getDateExamen());
									%>
									<tr>
										<td><%=examen.getHopital()%></td>
										<td><%=dateFormatee%></td>
										<td><%=examen.getPoids()%></td>
										<td><%=examen.getTaille()%></td>
										<td><%=examen.getOMS()%></td>
										<td><%=examen.getIMC()%></td>
										<td><%=examen.getTypeExamen()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Examen Clinique Post Operatoire</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Hopital</th>
										<th>Date:</th>
										<th>Poids:</th>
										<th>Taille:</th>
										<th>OMS:</th>
										<th>IMC</th>
										<th>Delai</th>
										<th>Nombres de selles</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (ExamenPostOp examen : examensPost) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(examen.getDateExamen());
									%>
									<tr>
										<td><%=examen.getHopital()%></td>
										<td><%=dateFormatee%></td>
										<td><%=examen.getPoids()%></td>
										<td><%=examen.getTaille()%></td>
										<td><%=examen.getOMS()%></td>
										<td><%=examen.getIMC()%></td>
										<td><%=examen.getDelai()%></td>
										<td><%=examen.getNbreSelles()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<Endoscopie> examens = new ArrayList<>();
					examens = dosDAO.listerExamenEndoscopieParPatient(idPatient);
				%>

				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails d'Endoscopi</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Type</th>
										<th>Date</th>
										<th>Numero</th>
										<th>Anestesie</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Endoscopie endo : examens) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(endo.getDateEndo());
									%>
									<tr>
										<td><%=endo.getTypeEndo()%></td>
										<td><%=dateFormatee%></td>
										<td><%=endo.getNumero()%></td>
										<td><%=endo.getAnestesie()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<Tumeur> tumeurs = new ArrayList<>();
					tumeurs = dosDAO.listerTumeurParPatient(idPatient);
					List<Polype> polypes = new ArrayList<>();
					polypes = dosDAO.listerPolypeParPatient(idPatient);
				%>
				<%-- <c:if test="${tumeurs.size > 0}"> --%>
				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails de tumeur</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>

									</tr>
								</thead>
								<tbody>
									<%
										for (Tumeur tumeur : tumeurs) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(tumeur.getDatePrel());
									%>
									<tr>

									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails de polype</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Nombre</th>
										<th>Siege</th>
										<th>TupeHyst</th>
										<th>SousType</th>
										<th>Displasie</th>
										<th>Limite</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Polype poly : polypes) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(poly.getDatePrel());
									%>
									<tr>
										<td><%=poly.getNombre()%></td>
										<td><%=poly.getSiege()%></td>
										<td><%=poly.getTupeHyst()%></td>
										<td><%=poly.getSousType()%></td>
										<td><%=poly.getDisplasie().getDysplasie()%></td>
										<td><%=poly.getLimite().getLimite()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<Imagerie> radios = new ArrayList<>();
					radios = dosDAO.listerExamenImagParPatient(idPatient);
					List<Biologie> analyses = new ArrayList<>();
					analyses = dosDAO.listerBiologieParPatient(idPatient);
				%>
				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails d'Imagerie</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Exame</th>
										<th>Hopital</th>
										<th>Date Radio</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Imagerie image : radios) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(image.getDateRadio());
									%>
									<tr>
										<td><%=image.getExamen()%></td>
										<td><%=image.getHopital()%></td>
										<td><%=dateFormatee%></td>
									</tr>
									<tr>
										<%
											Gson gson = new Gson();
												String[] images = gson.fromJson(image.getFile(), String[].class);
												for (String img : images) {
										%>
										<td><img src="images/CHU_Images/imagerie/<%=img%>"
											width="200px;" height="200px" /></td>
										<%
											}
										%>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails d'Examen Biologique</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Analyse</th>
										<th>Valeur</th>
										<th>Hopital</th>
										<th>Date Analyse</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Biologie bio : analyses) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(bio.getDataeAnalyse());
									%>
									<tr>
										<td><%=bio.getAnalyse()%></td>
										<td><%=bio.getValeur()%></td>
										<td><%=bio.getHopital()%></td>
										<td><%=dateFormatee%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<Genetique> genetiques = new ArrayList<>();
					genetiques = dosDAO.listerExamenGenetiqueParPatient(idPatient);
				%>

				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails d'Examen génétique</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Hopital</th>
										<th>Num-Doss Genetique</th>
										<th>Instabilite Macroscopique</th>
										<th>Mut-BRAF</th>
										<th>Mut-Kras</th>
										<th>Mut-APC</th>
										<th>Mut-MYH</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Genetique gen : genetiques) {
									%>
									<tr>
										<td><%=gen.getHopital()%></td>
										<td><%=gen.getNumeroDossierGenetique()%></td>
										<td><%=gen.getInstabiliteMacroscopique()%></td>
										<td><%=gen.getMutaBRAF()%></td>
										<td><%=gen.getMutaKras()%></td>
										<td><%=gen.getMutaAPC()%></td>
										<td><%=gen.getMutaMYH()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<%
					List<Traitement> traitements = new ArrayList<>();
					traitements = dosDAO.listerTraitementParPatient(idPatient);
				%>

				<div class="col-md-10 col-md-offset-1">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Détails de Traitement</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<tr>
										<th>Indication</th>
										<!-- <th>Temps</th> -->
										<th>Date</th>
										<th>Service</th>
										<th>Type d'exerèse</th>
										<th>Elargie</th>
										<!-- <th>Geste</th> -->
										<th>Score</th>
										<th>Ref Ana-path</th>
										<th>Complication</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Traitement traitement : traitements) {
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(traitement.getDate());
									%>
									<tr>
										<td><%=traitement.getIndication()%></td>
										<%-- <td><%=traitement.getChirurgie().getTemps()%></td> --%>
										<td><%=dateFormatee%></td>
										<td><%=traitement.getChirurgie().getService()%></td>
										<td><%=traitement.getChirurgie().getType()%></td>
										<td><%=traitement.getChirurgie().getElargie().getElargie()%></td>
										<%-- <td><%=traitement.getChirurgie().getGeste()%></td> --%>
										<td><%=traitement.getChirurgie().getScoring()%></td>
										<td><%=traitement.getChirurgie().getRefAnaPath()%></td>
										<td><%=traitement.getChirurgie().getComplication()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-md-offset-7">
					<button type="button"
						class="btn btn-info btn-sm pull-right btnCardInfo"
						id="printPageButton" onclick="window.print();">Télécharger</button>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

		<%@include file="piedUt.jsp"%>
	</div>
	<!-- /#wrapper -->

	</div>
</body>
</html>

