<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.css"/>
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>
<script src="js/jquery.min.js">  </script>
<script src="js/bootstrap.js">  </script>
<title>Gestion des examens </title>
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
					

						<div class="col-md-8 col-md-offset-2">
					<div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Radiologie</h4>
							</div></div>
				
							<form role="form"
								action="modGenetique.chu" method="post">
								<div class="row">
									
										<div class="panel-body">
										 <div class="card-body table-responsive">
											<%
											    Genetique genetique = (Genetique)session.getAttribute("Genetique");
											%>
											<div class="form-group">
												<input type="hidden" class="form-control" name="dossier"
													value="<%=genetique.getDossier().getId()%>">
											</div>
											<div class="form-group">
												<input type="hidden" class="form-control" name="idGenetique"
													value="<%=genetique.getId()%>">
											</div>

											<div class="form-group">
												<label for="hopital">Hopital:</label>
											
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
												<label for="numero">Numéro
													de dossier genetique:</label> <input type="text" name="numero"
													class="form-control" id="numero" value="<%=genetique.getNumeroDossierGenetique() %>">

											</div>
											<div class="form-group">
												<label for="instabiliteMacroscopique">Instabilité des
													microsatellites:</label>
												
													<select class="form-control" id="instabiliteMacroscopique"
														name="instabiliteMacroscopique">

														<option value=""><%=InstMacro.MSI%></option>
														<option value=""><%=InstMacro.MSS%></option>

													</select>
												</div>
										

											<div class="form-group">
												<label for="mutaBRAF">Mutation
													VC00E du gène BRAF:</label>
											
													<select class="form-control" id="mutaBRAF" name="mutaBRAF"
														>

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												</div>

										
											<div class="form-group">
												<label for="mutaKras">Mutation
													du gène K-ras:</label>
											
													<select class="form-control" id="mutaKras" name="mutaKras"
														>

														<option value=""><%=Resultat.OUI%></option>
														<option value=""><%=Resultat.NON%></option>
														<option value=""><%=Resultat.VSI%></option>

													</select>
												</div>
										

											<div class="form-group">
												<label for="mutaAPC">Mutation
													du gène APC:</label>
												
													<select class="form-control" id="mutaAPC" name="mutaAPC"
														>

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												</div>
										

											<div class="form-group">
												<label for="mutaMYH" >Mutation
													du gène MYH:</label>
											
													<select class="form-control" id="mutaMYH" name="mutaMYH" style="width: 250px">

														<option value="">OUI</option>
														<option value="">NON</option>

													</select>
												</div>
											


											<div class="form-group">
												<label for="mutaMMR"
													>Mutation du gène MMR: </label>
											
													<select class="form-control" id="mutaMMR" name="mutaMMR"
														>

														<option value=""><%=Resultat.OUI%></option>
														<option value=""><%=Resultat.NON%></option>
														<option value=""><%=Resultat.VSI%></option>

													</select>
												</div>
										


											<div class="form-group">
												<label for="autre">autre</label>
												<input type="text" class="form-control" name="autre"
													id="autre" value="<%=genetique.getAutre() %>">
											</div>

									
								

										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button></div>


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