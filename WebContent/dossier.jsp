<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="css/dossier.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<div class="row">
				<%
					String id_Dossier = (String) session.getAttribute("idDossier");
					int idDossier = Integer.parseInt(id_Dossier);
					DossierDAO dosDAO = new DossierDAO();
					DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
					int idPatient = dos.getPatient().getId();
				%>
				<div class="col-md-1 col-lg-offset-0">
					<a class="back"
						href="listIndDoss.chu?id=<%=dos.getPatient().getFamille().getId()%>"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-md-10 col-lg-offset-0">
					<h2 class="text-center" style="color: gray">
						Dossier Médical de <strong><%=dos.getPatient()%></strong>
					</h2>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header card-header-tabs card-header-info ">
							<div class="nav-tabs-navigation">
								<div class="nav-tabs-wrapper">
									<ul class="nav nav-tabs" data-tabs="tabs">
										<li class="nav-item active"><a class="nav-link"
											href="#Statut" data-toggle="tab"> <i
												class="material-icons">note</i> Statut
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#ExamenClinique" data-toggle="tab"> <i
												class="material-icons">local_hospital</i> Examen Clinique
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
											data-toggle="tab"> <i class="material-icons">image</i>
												Imagerie
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#Biologie"
											data-toggle="tab"> <i class="material-icons">biotech</i>
												Biologie
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="#Genetique" data-toggle="tab"> <i
												class="material-icons">insights</i> Genetique
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutStatut.jsp?id=<%=dos.getPatient().getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>Année</th>
														<th>Age</th>
														<th>Site</th>
														<th>T</th>
														<th>M</th>
														<th>N</th>
														<th></th>
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
														<td><a href="modStatut.chu?id=<%=statut.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutExamenClinique.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
									
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
														<th>Hopital</th>
														<th>Date</th>
														<th>Poids</th>
														<th>Taille</th>
														<th>OMS</th>
														<th>IMC</th>
														<th>Type d'examen</th>
														<th></th>
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
														<td><a href="modExamPre.jsp?id=<%=examen.getId()%>"><i
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
														<th>Hopital</th>
														<th>Date</th>
														<th>Poids</th>
														<th>Taille</th>
														<th>OMS</th>
														<th>IMC</th>
														<th>Délai</th>
														<th>Nombres de selles</th>
														<th></th>
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
														<td><a
															href="modExamenCliniquePost.chu?id=<%=examen.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutEndoscopie.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>Type</th>
														<th>Date</th>
														<th>Numero</th>
														<th>Anestesie</th>
														<th>Fichiers</th>
														<th></th>
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
														<td>
															<%
																Gson gson = new Gson();
																	if (endo.getFile() != null) {
																		String[] files = gson.fromJson(endo.getFile(), String[].class);
																		for (String file : files) {
															%> <a href="images/CHU_Images/endoscopie/<%=file%>"
															target="_blank"><%=file%></a></br> <%
 	}
 		}
 %>
														</td>
														<td><a
															href="modEndoscopieNormal.chu?id=<%=endo.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutAnaPathologie.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>TypeHysto</th>
														<th>TypePrel</th>
														<th>RefAnaPath</th>
														<th>Date</th>
														<th>Fichier</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Tumeur tumeur : tumeurs) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(tumeur.getDatePrel());
													%>
													<tr>
														<td><%=tumeur.getTypeHysto()%></td>
														<td><%=tumeur.getTypePrel()%></td>
														<td><%=tumeur.getRefAnaPath()%></td>
														<td><%=dateFormatee%></td>
														<td>
															<%
																Gson gson = new Gson();
																	if (tumeur.getFile() != null) {
																		String[] files = gson.fromJson(tumeur.getFile(), String[].class);
																		for (String file : files) {
															%> <a href="images/CHU_Images/endoscopie/<%=file%>"
															target="_blank"><%=file%></a></br> <%
 	}
 		}
 %>
														</td>
														<td><a href="modTumeur.chu?id=<%=tumeur.getId()%>"><i
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
														<th>Nombre</th>
														<th>Siege</th>
														<th>TupeHyst</th>
														<th>SousType</th>
														<th>Displasie</th>
														<th>Limite</th>
														<th>Date</th>
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
														<td><%=dateFormatee%></td>
														<td><a href="modPolype.chu?id=<%=poly.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutImagerie.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>Exame</th>
														<th>Hopital</th>
														<th>Date Radio</th>
														<th>Images</th>
														<th></th>
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
														<td><a href="modImag.chu?id=<%=image.getId()%>"><i
																class="fa fa-pencil-square-o"></i>Modifier</a></td>
													</tr>
													<tr>
														<td>Images</td>
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
								<div class="tab-pane" id="Biologie">
									<%
										List<Biologie> analyses = new ArrayList<>();
										analyses = dosDAO.listerBiologieParPatient(idPatient);
									%>
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutBiologie.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>Analyse</th>
														<th>Valeur</th>
														<th>Hopital</th>
														<th>Date Analyse</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Biologie examen : analyses) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(examen.getDataeAnalyse());
													%>
													<tr>
														<td><%=examen.getAnalyse()%></td>
														<td><%=examen.getValeur()%></td>
														<td><%=examen.getHopital()%></td>
														<td><%=dateFormatee%></td>
														<td><a href="modBiol.chu?id=<%=examen.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutGenetique.jsp?id=<%=dos.getId() %>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
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
														<th>Hopital</th>
														<th>Numero Dossier Genetique</th>
														<th>Instabilite Macroscopique</th>
														<th>Mutation BRAF</th>
														<th>Mutation Kras</th>
														<th>Mutation APC</th>
														<th>Mutation MYH</th>
														<th></th>
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
														<td><a href="modGen.chu?id=<%=gen.getId()%>"><i
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
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<button type="button" class="btnAjout"
												onclick="location.href='ajoutTraitement.jsp?id=<%=dos.getId()%>'">
												<i class="material-icons preced">add_circle_outline</i>
											</button>
										</div>
									</div>
									<h4 style="color: gray">
										Liste des Traitements de <strong><%=dos.getPatient()%></strong>
									</h4>
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>Détail de Traitement</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th>Date de traitement</th>
														<th>Indication</th>
														<th>Hopital</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Traitement traitement : traitements) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(traitement.getDate());
													%>
													<tr>
														<td><%=dateFormatee%></td>
														<td><%=traitement.getIndication()%></td>
														<td><%=traitement.getHopital()%></td>
														<td><a href="modTrait.chu?id=<%=traitement.getId()%>"><i
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
												<h3>Détail de Chirurgi</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th>Temps</th>
														<th>Date</th>
														<th>Service</th>
														<th>Type d'exerèse</th>
														<th>Elargie</th>
														<th>Geste</th>
														<th>Score</th>
														<th>Ref Ana-path</th>
														<th>Complication</th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Traitement traitement : traitements) {
															SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
															String dateFormatee = formatDateJour.format(traitement.getChirurgie().getDate());
													%>
													<tr>
														<td><%=traitement.getChirurgie().getTemps()%></td>
														<td><%=dateFormatee%></td>
														<td><%=traitement.getChirurgie().getService()%></td>
														<td><%=traitement.getChirurgie().getType()%></td>
														<td><%=traitement.getChirurgie().getElargie().getElargie()%></td>
														<td><%=traitement.getChirurgie().getGeste()%></td>
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
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h3>Détail de Endoscopique</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th>Type d'intervention</th>
														<th>Ref Ana-path</th>
														<th>Complication</th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Traitement traitement : traitements) {
													%>
													<tr>
														<c:if test="${not empty traitement.getTraitEndo()}">
															<td><%=traitement.getTraitEndo().getIntervention()%></td>
															<td><%=traitement.getTraitEndo().getRefAnaPath()%></td>
															<td><%=traitement.getTraitEndo().getComplication()%></td>
														</c:if>
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
												<h3>Détail de Chimiotherapie</h3>
											</div>
										</div>
										<div class="card-body table-responsive">
											<table class="table table-hover" id="idDataTable">
												<thead class="text-warning">
													<tr>
														<th>Deroulement</th>
														<th>Date-Debut</th>
														<th>Date-Fin</th>
													</tr>
												</thead>
												<tbody>
													<%
														for (Traitement traitement : traitements) {
													%>
													<tr>
														<c:if test="${not empty traitement.getRadiotherapie()}">
															<td><%=traitement.getRadiotherapie().getDeroulement()%></td>
															<td><%=traitement.getRadiotherapie().getDebut()%></td>
															<td><%=traitement.getRadiotherapie().getFin()%></td>
														</c:if>
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