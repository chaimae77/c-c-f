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
<title>Examen Clinique</title>
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
				<div class="col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Ajouter Examen Clinique</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" action="ajoutExamenClinique.chu" method="post">
								<div class="row">
									<div class="col-md-4">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Examen Normale</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<input type="hidden" class="form-control" name="dossier"
														value="<%=dos.getId()%>">
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

												<div class="form-group">
													<label for="">Medecin:</label>

													<%
														MedecinDAO medDAO = new MedecinDAO();
														List<Object[]> medecins = medDAO.listerLesMedecin();
													%>
													<select class="form-control" name="medecin">
														<%
															for (Object[] med : medecins) {
														%>
														<option value="<%=med[0]%>"><%=med[1] + " " + med[2]%></option>
														<%
															}
														%>
													</select>
												</div>
												<div class="form-group">
													<label for="dateexamen" for="">Date d'examen:</label> <input
														type="text" name="dateexamen" placeholder="jj/mm/aaaa"
														class="form-control" id="dateexamen">
												</div>
												<div class="form-group">
													<label for="poids" for="">poids</label> <input type="text"
														class="form-control" name="poids" id="poids"
														placeholder="Le poids">
												</div>
												<div class="form-group">
													<label for="taille" for="">Taille</label> <input
														type="text" class="form-control" name="taille" id="taille"
														placeholder="La taille">
												</div>
												<div class="form-group">
													<label for="oms" for="">OMS</label> <input type="text"
														class="form-control" name="oms" id="oms" placeholder="OMS">
												</div>
												<div class="form-group">
													<label for="imc" for="">IMC</label> <input type="text"
														class="form-control" name="imc" id="imc" placeholder="IMC">
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Examen Initiale ou de Suivie</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<label for="">Type Examen:</label> <select
														class="form-control" name="typeExamen" required>
														<option><%=TypeExamen.INITIAL%></option>
														<option><%=TypeExamen.SUIVI%></option>
													</select>
												</div>
												<div class="form-group">
													<label for="residence"> Syndrome Anormal : </label> </br>

													<div class="col-md-12">
														<div class="checkbox">
															<%
																CategorieSynAnormalDAO catDAO = new CategorieSynAnormalDAO();
																List<CategorieSynAnormal> categories = new ArrayList<>();
																categories = catDAO.listerCategorieSynAnormal();
																for (CategorieSynAnormal cat : categories) {
															%>
															<input id="syndrome" type="checkbox" name="syndromePreOp"
																value="<%=cat.getId()%>"> <label for="syndrome">
																<%=cat%>
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
									<div class="col-md-4">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Examen Post-Opératoire</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="form-group">
													<label for="delai" for="">Delai</label> <input type="text"
														class="form-control" name="delai" placeholder="le delai"
														style="width: 250px">
												</div>
												<div class="form-group">
													<label for="nbSelle" for="">Nombre de Selles</label> <input
														type="text" class="form-control" name="nbSelle"
														id="nbSelle" style="width: 250px">
												</div>
												<div class="form-group">
													<label for=""> Syndrome de résection rectale: </label>
													<div class="col-md-12">
														<div class="checkbox">
															<%
																SyndromesPostOpDAO synDAO = new SyndromesPostOpDAO();
																List<SyndromesPostOp> syndromes = new ArrayList<>();
																syndromes = synDAO.listerSyndromesPostOp();

																for (SyndromesPostOp synd : syndromes) {
															%>
															<input id="syndrome" type="checkbox" name="syndrome"
																value="<%=synd.getId()%>"> <label for="syndrome">
																<%=synd%>
															</label> </br> </br>
															<%
																}
															%>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label for="residence"> Toucher Rectal: </label> </br>
													<div class="col-md-12">
														<div class="checkbox">
															<%
																ToucherRectalDAO rectDAO = new ToucherRectalDAO();
																List<ToucherRectal> touchers = new ArrayList<>();
																touchers = rectDAO.listerToucher();
																for (ToucherRectal toucher : touchers) {
															%>
															<input id="syndrome" type="checkbox" name="toucher"
																value="<%=toucher.getId()%>"> <label
																for="syndrome"> <%=toucher%>
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
</html>