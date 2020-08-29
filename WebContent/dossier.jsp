<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet"> -->
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<style type="text/css">
.nav-tabs {
	border-bottom: none !important;
}

.nav-tabs .nav-item .nav-link.active {
	background-color: rgba(255, 255, 255, 0.2) !important;
	-webkit-transition: 0.3s background-color 0.2s;
	transition: 0.3s background-color 0.2s;
}

.nav-tabs .nav-item .nav-link {
	color: #fff;
	border: 0;
	margin: 0;
	border-radius: 3px;
	line-height: 24px;
	text-transform: uppercase;
	font-size: 12px;
	padding: 10px 15px;
	background-color: transparent;
	-webkit-transition: 0.3s background-color 0s;
	transition: 0.3s background-color 0s;
}

.nav-tabs .nav-item .nav-link .material-icons {
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<%
						String id_Dossier = (String) session.getAttribute("idDossier");
						int idDossier = Integer.parseInt(id_Dossier);
						DossierDAO dosDAO = new DossierDAO();
						DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
						int idPatient = dos.getPatient().getId();
					%>
					<div class="card">
						<div class="card-header card-header-tabs card-header-primary ">
							<div class="nav-tabs-navigation">
								<div class="nav-tabs-wrapper">
									<ul class="nav nav-tabs" data-tabs="tabs">
										<li class="nav-item"><a class="nav-link active"
											href="#Statut" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Statut
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#ExamenClinique" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Examen Clinique
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#Endoscopie" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Endoscopie
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#AnatomiePathologique" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Anatomie Pathologique
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#Imagerie"
											data-toggle="tab"> <i class="material-icons">bug_report</i>
												Imagerie
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#Biologie"
											data-toggle="tab"> <i class="material-icons">bug_report</i>
												Biologie
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#Genetique" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Genetique
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#Traitement" data-toggle="tab"> <i
												class="material-icons">bug_report</i> Traitement
										</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="Statut">
									<%
										StatutDAO statDAO = new StatutDAO();
										List<StatutCancereux> statuts = new ArrayList<>();
										statuts = statDAO.listerStatutParIndividu(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Statuts de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th>Type Statut</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (StatutCancereux s : statuts) {
													%>
													<tr>
														<td><%=s.getTypeStatut()%></td>
														<td><a href="detailStatut.chu?id=<%=s.getId()%>"><i
																class="fa fa-eye"></i>Détail</a> <a
															href="modStatut.chu?id=<%=s.getId()%>"><i
																class="fa fa-pencil-square-o"></i> Modifier </a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="ExamenClinique">
									<%
										List<ExamenPostOp> examensPost = new ArrayList<>();
										examensPost = dosDAO.listerExamenPostOPParPatient(idPatient);
										List<ExamenPreOp> examensPre = new ArrayList<>();
										examensPre = dosDAO.listerExamenPreOpParPatient(idPatient);
										List<ExamenPreOpAnormal> examensAnormal = new ArrayList<>();
										examensAnormal = dosDAO.listerExamenPreOpAnormalParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Examens Cliniques Pré Opératoire de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (ExamenPreOp e : examensPre) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDateExamen());
													%>
													<tr>
														<td>Examen clinique</td>
														<td>du <%=dateFormatee%></td>
														<td><a
															href="consExamenCliniqueNormal.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Détail</a> <a
															href="modExamPre.jsp?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i> Modifier </a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Examens Cliniques Post Opératoire de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (ExamenPostOp e : examensPost) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDateExamen());
													%>
													<tr>
														<td>Examen clinique</td>
														<td>du <%=dateFormatee%></td>
														<td><a
															href="consExamenCliniquePost.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Détail</a> <a
															href="modExamenCliniquePost.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i> Modifier </a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="Endoscopie">
									<%
										List<Endoscopie> examens = new ArrayList<>();
										examens = dosDAO.listerExamenEndoscopieParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Examens Endoscopiques de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Endoscopie e : examens) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDateEndo());
													%>
													<tr>
														<td>Examen endoscopique</td>
														<td>du <%=dateFormatee%></td>
														<td><a
															href="consEndoscopieNormal.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Détail</a><a
															href="modEndoscopieNormal.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="AnatomiePathologique">
									<%
										List<Tumeur> tumeurs = new ArrayList<>();
										tumeurs = dosDAO.listerTumeurParPatient(idPatient);
										List<Polype> polypes = new ArrayList<>();
										polypes = dosDAO.listerPolypeParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Tumeurs de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Tumeur e : tumeurs) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDatePrel());
													%>
													<tr>
														<td>Tumeur</td>
														<td>du <%=dateFormatee%></td>
														<td><a href="consTumeur.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Detail</a> <a
															href="modTumeur.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Polypes de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Polype e : polypes) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDatePrel());
													%>
													<tr>
														<td>Polype</td>
														<td>du <%=dateFormatee%></td>
														<td><a href="consPolype.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Détail</a> <a
															href="modPolype.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="Imagerie">
									<%
										List<Imagerie> radios = new ArrayList<>();
										radios = dosDAO.listerExamenImagParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Imageries de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Imagerie e : radios) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDateRadio());
													%>
													<tr>
														<td>Imagerie</td>
														<td>du <%=dateFormatee%></td>
														<td><a href="consImagerie.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Detail</a> <a
															href="modImag.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="Biologie">
									<%
										List<Biologie> analyses = new ArrayList<>();
										analyses = dosDAO.listerBiologieParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Examens Biologiques de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Biologie e : analyses) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDataeAnalyse());
													%>
													<tr>
														<td>Analyse médical</td>
														<td>du <%=dateFormatee%></td>
														<td><a href="consBiologie.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Detail</a> <a
															href="modBiol.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="Genetique">
									<%
										List<Genetique> genetiques = new ArrayList<>();
										genetiques = dosDAO.listerExamenGenetiqueParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Examens Génétiques de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Genetique e : genetiques) {
															Number numero = e.getNumeroDossierGenetique();
													%>
													<tr>
														<td>Examen génetique</td>
														<td>numéro <%=numero%></td>
														<td><a href="consGenetique.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Detail</a> <a
															href="modGen.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>

													<%
														}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="Traitement">
									<%
										List<Traitement> traitements = new ArrayList<>();
										traitements = dosDAO.listerTraitementParPatient(idPatient);
									%>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>
													Liste des Traitements de <strong><%=dos.getPatient()%></strong>
												</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th></th>
														<th></th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Traitement e : traitements) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(e.getDate());
													%>
													<tr>
														<td>Traitement</td>
														<td>du <%=dateFormatee%></td>
														<td><a href="consTraitement.chu?id=<%=e.getId()%>"><i
																class="fa fa-eye"></i>Détail</a> <a
															href="modTrait.chu?id=<%=e.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>