<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Endoscopie</title>
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
				<div class="col-md-12 col-md-offset-0">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Ajouter Endoscopie</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" enctype='multipart/form-data'
								action="ajoutEndoscopie.chu" method="post">
								<div class="row">
									<%
										SiegeDAO siegeDAO = new SiegeDAO();
										List<Siege> sieges = new ArrayList<>();
										sieges = siegeDAO.listerSiege();
										AspectMacroDAO aspectDAO = new AspectMacroDAO();
										List<AspectMacro> aspects = new ArrayList<>();
										aspects = aspectDAO.listerAspect();
										CirconferenceDAO cirDAO = new CirconferenceDAO();
										List<Circonference> circonferences = new ArrayList<>();
										circonferences = cirDAO.listerLesCirconference();
									%>
									<div class="col-md-6 col-sm-12">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Cas d'une endoscopie normal</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<input type="hidden" class="form-control" name="dossier"
														value="<%=dos.getId()%>">
												</div>
												<div class="form-group">
													<label class=" form-control-label">Hopital:</label>
													<div class="">
														<%
															HopitalDAO hopDAO = new HopitalDAO();
															List<Hopital> hopitaux = new ArrayList<>();
															hopitaux = hopDAO.listerLesHopitaux();
														%>

														<select class="form-control" name="hopital" required>
															<%
																for (Hopital hop : hopitaux) {
															%>
															<option value="<%=hop.getId()%>"><%=hop%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class=" form-control-label">Medecin:</label>
													<div class="">
														<%
															MedecinDAO medDAO = new MedecinDAO();
															List<Object[]> medecins = medDAO.listerLesMedecin();
														%>
														<select class="form-control" name="medecin" required>
															<%
																for (Object[] med : medecins) {
															%>
															<option value="<%=med[0]%>"><%=med[1] + " " + med[2]%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class=" form-control-label">Type Examen
														endoscopique:</label>
													<div class="">
														<%
															TypeAndoscopieDAO typeDAO = new TypeAndoscopieDAO();
															List<TypeAndoscopie> types = new ArrayList<>();
															types = typeDAO.listerTypeAndoscopie();
														%>
														<select class="form-control" name="typeExamen" required>
															<%
																for (TypeAndoscopie type : types) {
															%>
															<option value="<%=type.getId()%>"><%=type%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class=" form-control-label">Anesthesie</label>
													<div class="">
														<select class="form-control" name="anesthesie" required>
															<option value="locale"><%=Anesthesie.LOCALE%></option>
															<option value="sedation"><%=Anesthesie.SEDATION%></option>
															<option value="ANESTHESIE_GENERALE"><%=Anesthesie.ANESTHESIE_GENERALE%></option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="dateexamen" class=" form-control-label">Date
														d'examen:</label> <input type="text" name="dateexamen"
														placeholder="jj/mm/aaaa" class="form-control"
														id="dateexamen" required>

												</div>
												<div class="form-group">
													<label for="poids" class=" form-control-label">Numéro:</label>
													<input type="text" class="form-control" name="numero"
														id="numero" placeholder="" required>
												</div>
												<div class="form-group">
													<label for="poids" class=" form-control-label">Fichier</label>
													<div class="">
														<input type="file" id="files" name="file"
															class="form-control" multiple="multiple" required>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-sm-12">

										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Polype</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<label class="form-control-label">Siege:</label>
													<div class="">
														<select class="form-control" name="siegePolype" required>
															<option></option>
															<%
																for (Siege siege : sieges) {
															%>
															<option value="<%=siege.getId()%>"><%=siege%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Nombre:</label>
													<div class="">
														<select class="form-control" name="nbre" required>
															<option>1</option>
															<option>2</option>
															<option>3</option>
															<option>4</option>
															<option>5</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="nbr1" class="form-control-label">Nombre
														> 1 cm:</label> <input type="text" class="form-control"
														name="nbre1" id="nbre1" placeholder="" required>
												</div>
												<div class="form-group">
													<label class="form-control-label">Aspect
														Macroscopique:</label>
													<div class="">
														<select class="form-control" name="aspectPolype" required>
															<%
																for (AspectMacro aspect : aspects) {
															%>
															<option value="<%=aspect.getId()%>"><%=aspect%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Circonference:</label>
													<div class="">
														<select class="form-control" name="circonferencePolype"
															required>
															<%
																for (Circonference cir : circonferences) {
															%>
															<option value="<%=cir.getId()%>"><%=cir%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="poids" class=" form-control-label">Taille
														(grand diamètre):</label> <input type="text" class="form-control"
														name="taillePolype" id="taille" required>
												</div>
												<div class="form-group">
													<label class="form-control-label">Couleur:</label>
													<div class="">
														<select class="form-control" name="couleur" required>
															<option>Bleu</option>
															<option>Rouge</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="poids" class="col-sm-4 form-control-label">Ref
														AnaPathologie:</label> <input type="text" class="form-control"
														name="refAnaPathPolype" id="refAnaPath" required>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Masse Tomorale</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<label for="poids" class="form-control-label">Taille
														:</label> <input type="text" class="form-control"
														name="tailleMasse" id="taille" required>
												</div>
												<div class="form-group">
													<label for="poids" class="form-control-label">Ref
														AnaPathologie:</label> <input type="text" class="form-control"
														name="refAnaPathMasse" id="refAnaPath" required>
												</div>
												<div class="form-group">
													<label class="form-control-label">Siege:</label>
													<div class="">
														<select class="form-control" name="siegeMasse" required>
															<option></option>
															<%
																for (Siege siege : sieges) {
															%>
															<option value="<%=siege.getId()%>"><%=siege%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class=" form-control-label">Aspect
														Macroscopique:</label>

													<div class="">
														<select class="form-control" name="aspectMasse" required>
															<%
																for (AspectMacro aspect : aspects) {
															%>
															<option value="<%=aspect.getId()%>"><%=aspect%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Circonference:</label>
													<div class="">
														<select class="form-control" name="circonferenceMasse"
															required>
															<%
																for (Circonference cir : circonferences) {
															%>
															<option value="<%=cir.getId()%>"><%=cir%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Sténose:</label>
													<div class="">
														<select class="form-control" name="stenose" required>
															<option><%=Stenose.FRANCHISSABLE%></option>
															<option><%=Stenose.NON_FRANCHISSABLE%></option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Complications</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<label for="" class=" form-control-label">
														Complications: </label>
													<div
														class="checkbox checkbox-info checkbox-circle col-sm-12">
														<%
															ComplicationDAO compDAO = new ComplicationDAO();
															List<Complication> complications = new ArrayList<>();
															complications = compDAO.listerLesComplication();

															for (Complication comp : complications) {
														%>
														<input id="syndrome" type="checkbox" name="complication"
															value="<%=comp.getId()%>"> <label for="syndrome">
															<%=comp%>
														</label> </br> </br>
														<%
															}
														%>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
									</div>
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