<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Espace Utilisateur</title>

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

		<div id="page-wrapper">

			<div class="container-fluid">
 <%@include file="navbar.jsp"%>
				
					<div class="row">
						
							<%
													String ide = request.getParameter("id");
													int id = Integer.parseInt(ide);
													ExamenPreOpDAO examenDAO = new ExamenPreOpDAO();
													ExamenPreOp examen = examenDAO.trouverExamenById(id);
													SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
													String dates = formatter.format(examen.getDateExamen());
													String id_Dossier = (String)session.getAttribute("idDossier");
													int  idDossier = Integer.parseInt(id_Dossier);
													DossierDAO dosDAO = new DossierDAO();
													DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
												%>
							
															<div class="col-md-12 ">
					<a class="back" href="examen.chu?id=<%=dos.getId()%>"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
				
				
                        <div class="col-md-8 col-md-offset-2">
					<div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Modification de l'examen Clinique pré-opératoire</h4>
							</div>
						</div>
						
								<div class="panel-body">
								   <div class="card-body table-responsive">
									<form  role="form"
										action="modExamPre.chu" method="post">
										<div class="row">
											<div class="panel-body">
											
				
												<div class="form-group">
													<input type="hidden" class="form-control" name="dossier"
														value="<%=dos.getId()%>">
												</div>
												<div class="form-group">
													<input type="hidden" class="form-control" name="idExamen"
														value="<%=examen.getId()%>">
												</div>
												<div class="form-group">
													<label>Hopital:</label>
													
														<%
															HopitalDAO hopDAO = new HopitalDAO();
															List<Hopital> hopitaux = new ArrayList<>();
															hopitaux = hopDAO.listerLesHopitaux();
														%>

														<select class="form-control" name="hopital"
														>
															<option value="<%=examen.getHopital().getId()%>"><%=examen.getHopital()%></option>
															<%
																for (Hopital hop : hopitaux) {
																	if (examen.getHopital().getId() != hop.getId()) {
															%>
															<option value="<%=hop.getId()%>"><%=hop%></option>
															<%
																}
																}
															%>
														</select>
													</div>
												
												<div class="form-group">
													<label>Date
														d'examen:</label>
													
														<input type="date" name="dateexamen" class="form-control"
															id="dateexamen" 
															value="<%=dates%>">
													</div>
												
												<div class="form-group">
													<label>poids</label>
												
														<input type="text" class="form-control" name="poids"
															id="poids" placeholder="Le poids" value="<%=examen.getPoids()%>">
													</div>
											
												<div class="form-group">
													<label>Taille</label>
												
														<input type="text" class="form-control" name="taille"
															id="taille" placeholder="La taille" 
															 value="<%=examen.getTaille()%>">
											
												</div>
												<div class="form-group">
													<label>OMS</label>
													
														<input type="text" class="form-control" name="oms"
															id="oms" placeholder="OMS" 
															value="<%=examen.getOMS()%>">
													</div>
											
												<div class="form-group">
													<label>IMC</label>
													
														<input type="text" class="form-control" name="imc"
															id="imc" placeholder="IMC" 
															value="<%=examen.getIMC()%>">
													</div>
											
												<div class="form-group">
													<label>Type Examen:</label>
												
														<select class="form-control" name="typeExamen" required>
															<!--  <option><%=examen.getTypeExamen()%></option>-->
															<%
																if ((examen.getTypeExamen() == TypeExamen.INITIAL) || (examen.getTypeExamen() == TypeExamen.SUIVI)) {
															%>
															<option><%=TypeExamen.INITIAL%></option>
															<option><%=TypeExamen.SUIVI%></option>
															<%
																}
															%>
														</select>
													
												</div>
											</div>
										</div>
									   <div class="row">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
									</div>
								</div>
									</form>
								</div>
								<!-- panel-body -->

							</div>
							<!-- panel -->
						</div>


					</div>
					<!-- End row -->

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
	</div>
</body>

<%@include file="piedUt.jsp"%>
</html>
