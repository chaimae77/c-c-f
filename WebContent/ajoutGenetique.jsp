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
<title>Ajout g�n�tique</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!--  
	<div class="container">
		<div class="row">
			<div
				class="col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 col-xs-1 col-xs-offset-1"
				id="logo">
				<img class="img" src="images\logo.png " width="" height=""
					alt="logo" />
			</div>
			<div class="col-lg-12 ">
				</br> </br>
			</div>
			<div class="row">

				<div class="pull-left col-lg-1">

					<div class="panel-body">
						<a href="espaceUtilisateur.jsp"><button type="button"
								class="btn btn-primary btn-custom waves-effect waves-light m-b-5"
								style="width: 250px">Gestion Des Familles</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div>
						</br> </br> <a href="gestionDossier.jsp"><button type="button"
								class="btn btn-success btn-custom waves-effect waves-light m-b-5"
								style="width: 250px">Gestion Des Dossiers Medicales</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div>
						</br> </br> <a href="ajoutRendezVous.jsp"><button type="button"
								class="btn btn-info btn-custom waves-effect waves-light m-b-5"
								style="width: 250px">Gestion Des Rendez-Vous</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div>
						</br> </br> <a><button type="button"
								class="btn btn-purple btn-custom waves-effect waves-light m-b-5"
								style="width: 250px">Deconnexion</button></a>
					</div>

				</div>

				<div class="col-lg-9 col-lg-offset-2">
					<div class="panel-body">
						<a href="gestionDossier.jsp"><button type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 250px">Nouveau Dossier M�dical</button></a> <a
							href="examens.jsp"><button type="button"
								class="btn btn-info btn-rounded waves-effect waves-light m-b-5"
								style="width: 250px">Examens Medicales</button></a> <a
							href="consultation.jsp"><button type="button"
								class="btn btn-warning btn-rounded waves-effect waves-light m-b-5"
								style="width: 250px">Consultation</button></a> </br> </br>
						<button type="button"
							class="btn btn-purple btn-rounded waves-effect waves-light m-b-5"
							style="width: 770px; height: 150px">Dossier M�dical</button>
					</div>
				</div>
				<div class="col-lg-12 ">
					<div class="panel-body">
						<a href="statut.jsp"><button type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 100px">Satut</button></a> <a href="ExamenClinique.jsp"><button
								type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 150px">Examen Clinique</button></a> <a
							href="Endoscopie.jsp"><button type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 150px">Endoscopie</button></a> <a
							href="AnaPathologie.jsp"><button type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 200px">Anatomie Pathologique</button></a> <a
							href="Imagerie.jsp"><button type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 100px">Imagerie</button></a> <a href="Biologie.jsp"><button
								type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 100px">Biologie</button></a> <a href="Genetique.jsp"><button
								type="button"
								class="btn btn-info btn-rounded waves-effect waves-light m-b-5"
								style="width: 100px">G�n�tique</button></a> <a href="Traitement.jsp"><button
								type="button"
								class="btn btn-default btn-rounded waves-effect m-b-5"
								style="width: 150px">Traitement</button></a>
					</div>
				</div> -->
				
				
			<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
	
			<div class="container-fluid">
			 <%@include file="navbar.jsp"%>
			 	<div class="col-lg-12 ">
                    <div class="panel-body">
                        <a href="statut.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:100px">Satut</button></a>
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">G�n�tique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Traitement</button></a>
                    </div>                       
                </div>
                
				<div class="row">
					

						<div class="col-md-8 col-md-offset-2">
						<div class="card">
						<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>Radiologie</h4></div></div>
							<form role="form"
								action="ajoutGenetique.chu" method="post">
								
									<div class="card-body table-responsive">
											<%
												String id_Dossier = (String) session.getAttribute("idDossier");
												int idDossier = Integer.parseInt(id_Dossier);
												DossierDAO dosDAO = new DossierDAO();
												DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
											%>
											<div class="form-group">
												<input type="hidden" class="form-control" name="dossier"
													value="<%=dos.getId()%>" >
											</div>

											<div class="form-group">
												<label for="hopital" for="">Hopital:</label>
											
													<%
														HopitalDAO hopDAO = new HopitalDAO();
														List<Hopital> hopitaux = new ArrayList<>();
														hopitaux = hopDAO.listerLesHopitaux();
													%>

													<select class="form-control" name="hopital" id="hoptal"
													>
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
												<label for="numero" for="">Num�ro
													du dossier g�n�tique:</label> <input type="text" name="numero"
													class="form-control" id="numero">

											</div>
											<div class="form-group">
												<label for="instabiliteMacroscopique"
													for="">Instabilit� des
													microsat�llites:</label>
											
													<select class="form-control" id="instabiliteMacroscopique"
														name="instabiliteMacroscopique">

														<option value=""><%=InstMacro.MSI%></option>
														<option value=""><%=InstMacro.MSS%></option>

													</select>
										
											</div>

											<div class="form-group">
												<label for="mutaBRAF" for="">Mutation
													VC00E du g�ne BRAF:</label>
											
													<select class="form-control" id="mutaBRAF" name="mutaBRAF"
													>

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												</div>

									
											<div class="form-group">
												<label for="mutaKras" for="">Mutation
													du g�ne K-ras:</label>
											
													<select class="form-control" id="mutaKras" name="mutaKras"
														>

														<option value=""><%=Resultat.OUI%></option>
														<option value=""><%=Resultat.NON%></option>
														<option value=""><%=Resultat.VSI%></option>

													</select>
												</div>
									

											<div class="form-group">
												<label for="mutaAPC" for="">Mutation
													du g�ne APC:</label>
											
													<select class="form-control" id="mutaAPC" name="mutaAPC"
														>

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												
											</div>

											<div class="form-group">
												<label for="mutaMYH" for="">Mutation
													du g�ne MYH:</label>
												
													<select class="form-control" id="mutaMYH" name="mutaMYH" >

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												</div>
								


											<div class="form-group">
												<label for="mutaMMR"
													for="">Mutation du g�ne MMR: </label>
											
													<select class="form-control" id="mutaMMR" name="mutaMMR"
													>

														<option value=""><%=Resultat.OUI%></option>
														<option value=""><%=Resultat.NON%></option>
														<option value=""><%=Resultat.VSI%></option>

													</select>
												</div>



											<div class="form-group">
												<label for="autre" for="">autre</label>
												<input type="text" class="form-control" name="autre"
													id="autre">
											</div>

							
						</br>

									     <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
		</br>	</div>			</div>

								</div>
							</form>
						</div>

					</div>
				</div>
				<!-- col -->


			</div>
		</div>
</body>

</html>