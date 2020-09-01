<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />
<script src="js/jquery.min.js">
	
</script>
<script src="js/bootstrap.js">
	
</script>
<title>Traitements</title>
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

			<div class="row">
				<%
					String id_Dossier = (String) session.getAttribute("idDossier");
					int idDossier = Integer.parseInt(id_Dossier);
					DossierDAO dosDAO = new DossierDAO();
					DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
				%>
				<div class="col-md-12 col-lg-offset-0">
					<a class="back" href="examen.chu?id=<%=dos.getId()%>"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
				<div class="col-md-8 col-md-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Ajouter Traitement</h4>
							</div>
						</div>
						<form role="form" action="ajoutTraitement.chu" method="post">
							<div class="panel-body">
								<div class="form-group">
									<input type="hidden" class="form-control" name="dossier"
										value="<%=dos.getId()%>">
								</div>
								<div class="form-group">
									<label for="">Date de traitement :</label> <input type="text"
										class="form-control" name="dateTrait" id=""
										placeholder="jj/mm/aaaa">
								</div>
								<div class="form-group">
									<label for="">Indication:</label> <input type="text"
										class="form-control" name="indication" id="" placeholder="">
								</div>
								<div class="form-group">
									<label for="">Hopital:</label>
									<%
										HopitalDAO hopDAO = new HopitalDAO();
										List<Hopital> hopitaux = new ArrayList<>();
										hopitaux = hopDAO.listerLesHopitaux();
									%>
									<select class="form-control" name="hopital">
										<%
											for (Hopital hop : hopitaux) {
										%>
										<option value="<%=hop.getId()%>"><%=hop%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="col-md-10 col-md-offset-1">
									<div class="card">
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h4>Chirurgie</h4>
											</div>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label for="">en temps:</label> <input type="text"
													class="form-control" name="temps" id="" placeholder="">
											</div>
											<div class="form-group">
												<label for="">Date:</label> <input type="text"
													class="form-control" name="date" id=""
													placeholder="jj/mm/aaaa">
											</div>
											<div class="form-group">
												<label for="">Service:</label> <input type="text"
													class="form-control" name="service" placeholder="service">
											</div>
											<div class="form-group">
												<label for="">Type d'exerèse</label> <select
													class="form-control" name="typeExerese">
													<%
														TypeExereseDAO typeDAO = new TypeExereseDAO();
														List<TypeExerese> types = new ArrayList<>();
														types = typeDAO.listerTypeExerese();
													%>
													<%
														for (TypeExerese type : types) {
													%>
													<option value="<%=type.getId()%>"><%=type%></option>
													<%
														}
													%>
												</select>
											</div>

											<div class="form-group">
												<label for="">Elargie à:</label> <select
													class="form-control" name="elargissement">
													<option></option>
													<%
														ElargissementDAO elargDAO = new ElargissementDAO();
														List<Elargissement> elargies = new ArrayList<>();
														elargies = elargDAO.listerLesElargissement();
													%>
													<%
														for (Elargissement elarg : elargies) {
													%>
													<option value="<%=elarg.getId()%>"><%=elarg%></option>
													<%
														}
													%>
												</select>
											</div>

											<div class="form-group">
												<label for="">Gestes Complémentaires:</label> <select
													class="form-control" name="geste">
													<option></option>
													<%
														GesteDAO gestDAO = new GesteDAO();
														List<Geste> gestes = new ArrayList<>();
														gestes = gestDAO.listerLesGeste();
													%>
													<%
														for (Geste geste : gestes) {
													%>
													<option value="<%=geste.getId()%>"><%=geste%></option>
													<%
														}
													%>
												</select>
											</div>

											<div class="form-group">
												<label for="">RR scoring:</label> <select
													class="form-control" name="scoring">
													<option></option>
													<%
														RRscoringDAO scoringDAO = new RRscoringDAO();
														List<RRscoring> scoring = new ArrayList<>();
														scoring = scoringDAO.listerRRscoring();
													%>
													<%
														for (RRscoring scor : scoring) {
													%>
													<option value="<%=scor.getId()%>"><%=scor%></option>
													<%
														}
													%>
												</select>
											</div>

											<div class="form-group">
												<label for="">Ref Ana-path:</label> <input type="text"
													class="form-control" name="refChirg">
											</div>
											<div class="form-group">
												<label for="">Complication:</label> <select
													class="form-control" name="complicationChirurg">
													<opition></opition>
													<%
														ComplicationDAO compDAO = new ComplicationDAO();
														List<Complication> complications = new ArrayList<>();
														complications = compDAO.listerLesComplication();
													%>
													<%
														for (Complication comp : complications) {
													%>
													<option value="<%=comp.getId()%>"><%=comp%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										</br>
										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h4>Traitement endoscopique</h4>
											</div>
										</div>
										<div class="panel-body">

											<div class="form-group">
												<label for="">Type d'intervention:</label> <select
													class="form-control" name="typeInterv">
													<option></option>
													<%
														TypeInterventionDAO typeIntDAO = new TypeInterventionDAO();
														List<TypeIntervention> interventions = new ArrayList<>();
														interventions = typeIntDAO.listerTypeIntervention();
													%>
													<%
														for (TypeIntervention interv : interventions) {
													%>
													<option value="<%=interv.getId()%>"><%=interv%></option>
													<%
														}
													%>
												</select>
											</div>
											<div class="form-group">
												<label for="">Ref Ana-path:</label> <input type="text"
													class="form-control" name="refTrait" placeholder="degre">
											</div>
											<div class="form-group">
												<label for="">Complication:</label> <select
													class="form-control" name="complicationTrait">
													<opition></opition>

													<%
														for (Complication comp : complications) {
													%>
													<option value="<%=comp.getId()%>"><%=comp%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
										</br> </br>

										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h4>Chimiothérapie</h4>
											</div>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<label for="">Déroulement:</label> <select
													class="form-control" name="deroulementChim">

													<option value=""><%=Deroulement.ADJUVANTE%></option>
													<option value=""><%=Deroulement.NEO_ADJUVANTE%></option>
													<option value=""><%=Deroulement.PALLIATIVE%></option>

												</select>
											</div>

											<div class="form-group">
												<label for="">Date de début :</label> <input type="text"
													class="form-control" name="dateDebutChim" id=""
													placeholder="jj/mm/aaaa">
											</div>
											<div class="form-group">
												<label for="">Date de fin:</label> <input type="text"
													class="form-control" name="dateFinChim" id=""
													placeholder="jj/mm/aaaa">
											</div>

										</div>

										<div class="card-header card-header-info card-header-icon">
											<div class="card-icon" style="float: none !important;">
												<h4>Radiothérapie</h4>
											</div>
										</div>
										<div class="panel-body">
											<div class="form-group">
												<labelfor"">Déroulement:</label> <select
													class="form-control" name="deroulementRadio">

													<option value=""><%=Deroulement.ADJUVANTE%></option>
													<option value=""><%=Deroulement.NEO_ADJUVANTE%></option>
													<option value=""><%=Deroulement.PALLIATIVE%></option>

												</select>
											</div>

											<div class="form-group">
												<label for="">Date de début :</label> <input type="text"
													class="form-control" name="dateDebutRad" id=""
													placeholder="jj/mm/aaaa">
											</div>
											<div class="form-group">
												<label for="">Date de fin:</label> <input type="text"
													class="form-control" name="dateFinRad" id=""
													placeholder="jj/mm/aaaa">
											</div>
										</div>
										</br>
									</div>
								</div>
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

</html>