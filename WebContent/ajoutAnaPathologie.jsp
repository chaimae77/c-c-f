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
<title>Anatomie Pathologique</title>
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
								<h4>Ajouter Anatomie Pathologique</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form method="post" action="ajoutAnapath.chu" role="form"
								enctype='multipart/form-data'>
								<div class="row">
									<%
										SiegeDAO siegeDAO = new SiegeDAO();
										List<Siege> sieges = new ArrayList<>();
										sieges = siegeDAO.listerSiege();
										TypeHystologiqueDAO hystDAO = new TypeHystologiqueDAO();
										List<TypeHystologique> hystos = new ArrayList<>();
										hystos = hystDAO.listerTypeHystologique();
										DifferentiationDAO diffDAO = new DifferentiationDAO();
										List<Differentiation> diffs = new ArrayList<>();
										diffs = diffDAO.listerLesDifferenciation();
										StromaDAO stromaDAO = new StromaDAO();
										List<Stroma> stromas = new ArrayList<>();
										stromas = stromaDAO.listerStroma();
									%>
									<div class="col-md-6 col-sm-12">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Anatomie Pathologique</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<%-- <div class="form-group">
													<input type="hidden" class="form-control" name="dossier"
														value="<%=dos.getId()%>">
												</div> --%>
												<div class="form-group">
													<label class="form-control-label">Hopital:</label>
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
															<option value="<%=hop.getId()%>"><%=hop.getHopital()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Medecin:</label>
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
													<label class="form-control-label">Type de prvement:</label>
													<div class="">
														<%
															TypePrelevementDAO prelevementDAO = new TypePrelevementDAO();
															List<TypePrelevement> types = new ArrayList<>();
															types = prelevementDAO.listerTypePrelevement();
														%>
														<select class="form-control" name="typePrelevement"
															required>
															<%
																for (TypePrelevement type : types) {
															%>
															<option value="<%=type.getId()%>"><%=type%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="dateexamen" class="form-control-label">Date
														d'examen:</label> <input type="text" name="dateExamen"
														placeholder="jj/mm/aaaa" class="form-control" required>

												</div>
												<div class="form-group">
													<label for="" class="form-control-label">Ref
														AnaPathologie:</label> <input type="text" class="form-control"
														name="refAnaPath" id="refAnaPath" placeholder="">
												</div>
												<div class="form-group">
													<label for="poids" class="form-control-label">Fichier</label>
													<div class="">
														<input type="file" id="files" name="file"
															class="form-control " multiple="multiple" required>
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
													<label for="nbre" class="form-control-label">Nombre:</label>
													<input type="text" class="form-control" name="nbre"
														id="nbre" placeholder="" required>
												</div>
												<div class="form-group">
													<label class=" form-control-label">Siege:</label>
													<div class="">
														<select class="form-control" name="siegePolype" required>
															<%
																for (Siege siege : sieges) {
															%>
															<option value="<%=siege.getId()%>"><%=siege.getSiege()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Type
														Hystologique:</label>
													<div class="">
														<select class="form-control" name="typeHystoPolype"
															required>
															<%
																for (TypeHystologique typeHyst : hystos) {
															%>
															<option value="<%=typeHyst.getId()%>"><%=typeHyst.getTypeHysto()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="form-control-label">Sous Type:</label>
													<div class="">
														<%
															SousTypeDAO sousTypeDAO = new SousTypeDAO();
															List<SousType> sousTypes = new ArrayList<>();
															sousTypes = sousTypeDAO.listerSousType();
														%>
														<select class="form-control" name="sousType" required>
															<%
																for (SousType sousType : sousTypes) {
															%>
															<option value="<%=sousType.getId()%>"><%=sousType.getSousType()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="form-control-label">Dysplasie:</label>
													<div class="">
														<%
															DysplasieDAO dysplasieDAO = new DysplasieDAO();
															List<Dysplasie> dysplasies = new ArrayList<>();
															dysplasies = dysplasieDAO.listerLesDysplasie();
														%>
														<select class="form-control" name="dysplasie" required>
															<%
																for (Dysplasie dys : dysplasies) {
															%>
															<option value="<%=dys.getId()%>"><%=dys.getDysplasie()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="form-control-label">Limites de
														r�section endoscopique:</label>
													<div class="">
														<%
															LimiteResectEndoDAO limiteDAO = new LimiteResectEndoDAO();
															List<LimiteResectEndo> limites = new ArrayList<>();
															limites = limiteDAO.listerLesLimite();
														%>
														<select class="form-control" name="limiteResectionEndo"
															required>
															<%
																for (LimiteResectEndo limite : limites) {
															%>
															<option value="<%=limite.getId()%>"><%=limite.getLimite()%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-12 col-sm-12">
										<div class="card">
											<div class="card-header card-header-info card-header-icon">
												<div class="card-icon" style="float: none !important;">
													<h4>Tumeur</h4>
												</div>
											</div>
											<div class="card-body table-responsive">
												<div class="col-md-6 col-sm-12">
													<div class="form-group">
														<label class="form-control-label">Siege:</label>

														<div class="">
															<select class="form-control" name="siegeTumeur" required>
																<%
																	for (Siege siege : sieges) {
																%>
																<option value="<%=siege.getId()%>"><%=siege.getSiege()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Type
															Hystologique:</label>
														<div class="">
															<select class="form-control" name="typeHystoTumeur"
																required>
																<%
																	for (TypeHystologique typeHyst : hystos) {
																%>
																<option value="<%=typeHyst.getId()%>"><%=typeHyst.getTypeHysto()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Differentiation:</label>
														<div class="">
															<select class="form-control" name="diffTumeur" required>
																<%
																	for (Differentiation diff : diffs) {
																%>
																<option value="<%=diff.getId()%>"><%=diff.getDiff()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Stroma:</label>
														<div class="">
															<select class="form-control" name="stroma" required>
																<%
																	for (Stroma stroma : stromas) {
																%>
																<option value="<%=stroma.getId()%>"><%=stroma.getStroma()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="" class="form-control-label">Le %
															Composante Colloide muqueuse:</label> <input type="text"
															class="form-control" name="compCollMuq" id="nbre1"
															placeholder="" required>
													</div>
													<div class="form-group">
														<label for="" class="form-control-label">Le %
															Composante � cellules ind�pendantes:</label> <input type="text"
															class="form-control" name="compCelInd" id="nbre1"
															placeholder="" required>
													</div>
													<div class="form-group">
														<div
															class="checkbox checkbox-info checkbox-circle col-md-12">

															<input id="syndrome" type="checkbox" name="embolVasc"
																value=""> <label for="syndrome"> Emboles
																Vasculaires </label> </br>

														</div>
													</div>
													<div class="form-group">
														<div
															class="checkbox checkbox-info checkbox-circle col-md-12">

															<input id="syndrome" type="checkbox" name="engaiPeri"
																value=""> <label for="syndrome">
																Engainement p�rinerveux </label> </br>

														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Limite
															Chirurgicale proximale:</label>
														<div class="">
															<select class="form-control" name="limiteChirgPro"
																required>
																<option>SEINE</option>
																<option>TUMORALE</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Limite
															Chirurgicale distale:</label>
														<div class="">
															<select class="form-control" name="limiteChirgDist"
																required>
																<option>SEINE</option>
																<option>TUMORALE</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Niveau
															d'invasion:</label>
														<div class="">
															<select class="form-control" name="niveauInvasion"
																required>
																<%
																	NiveauInvasionDAO niveauDAO = new NiveauInvasionDAO();
																	List<NiveauInvasion> niveaux = new ArrayList<>();
																	niveaux = niveauDAO.listerForme();
																%>
																<%
																	for (NiveauInvasion niveau : niveaux) {
																%>
																<option value="<%=niveau.getId()%>"><%=niveau.getNiveau()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-6 col-sm-12">
													<div class="form-group">
														<label for="" class="form-control-label">Ganglions
															m�tastatique</label> <input type="text" class="form-control"
															name="ganglions" id="" placeholder="...../....." required>
													</div>
													<div class="form-group">
														<label for="" class="form-control-label">Effraction
															capsulaire: nombre de ganglions</label> <input type="text"
															class="form-control" name="nbreGanglions" id=""
															placeholder="" required>
													</div>
													<div class="form-group">
														<div
															class="checkbox checkbox-info checkbox-circle col-md-12">
															<input id="syndrome" type="checkbox" name="localPerit"
																value=""> <label for="syndrome">
																Localisation p�riton�ale </label> </br>
														</div>
													</div>
													<h1>Lesions associees</h1>
													<div class="form-group">
														<label for="" class="form-control-label">Polype</label> </br> </br>
														<div class="form-group">
															<label class="form-control-label">Type
																Hystologique:</label>
															<div class="">
																<select class="form-control"
																	name="typeHystoPolypeLesion" required>
																	<%
																		for (TypeHystologique typeHyst : hystos) {
																	%>
																	<option value="<%=typeHyst.getId()%>"><%=typeHyst.getTypeHysto()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="form-control-label">Siege:</label>
															<div class="">
																<select class="form-control" name="siegePolypeLesion"
																	required>
																	<%
																		for (Siege siege : sieges) {
																	%>
																	<option value="<%=siege.getId()%>"><%=siege.getSiege()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</div>
													</div>
													<h1>Tumeur Synchrome</h1>
													<div class="form-group">
														<label class="form-control-label">Type
															Hystologique:</label>
														<div class="">
															<select class="form-control" name="typeHystoTumeurSynch"
																required>
																<%
																	for (TypeHystologique typeHyst : hystos) {
																%>
																<option value="<%=typeHyst.getId()%>"><%=typeHyst.getTypeHysto()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="form-control-label">Siege:</label>
														<div class="">
															<select class="form-control" name="siegeTumeurSynch"
																required>
																<%
																	for (Siege siege : sieges) {
																%>
																<option value="<%=siege.getId()%>"><%=siege.getSiege()%></option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
													<div class="form-group">
														<div
															class="checkbox checkbox-info checkbox-circle col-md-12 col-md-offset-0">
															<input id="syndrome" type="checkbox" name="mici" value="">
															<label for="syndrome"> MICI </label> </br>
														</div>
													</div>
													<div class="form-group">
														<div
															class="checkbox checkbox-info checkbox-circle col-md-12 col-md-offset-0">
															<input id="syndrome" type="checkbox" name="ulc�rations"
																value=""> <label for="syndrome">
																Ulc�rations </label></br>

														</div>
													</div>
													<div class="form-group">
														<label for="" class="form-control-label">Autre
															m�tastatique</label> <input type="text" class="form-control"
															name="autre" id="" placeholder="autre" required>
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