<%@page import="java.text.SimpleDateFormat"%>
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
<title>Gestion des examens Cliniques</title>
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
								action="modImagerieTrait.chu" method="post">
								<div class="row">
									
										<div class="panel-body">
										 <div class="card-body table-responsive">
											<%
												Imagerie examen = (Imagerie) session.getAttribute("Imagerie");
												Date date = examen.getDateRadio();
												SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
												String dateFormatee = formatDateJour.format(date);
											%>
											<div class="form-group">
												<input type="hidden" class="form-control" name="dossier"
													value="<%=examen.getDossier().getId()%>"
												>
											</div>
											<div class="form-group">
												<input type="hidden" class="form-control" name="idImagerie"
													value="<%=examen.getId()%>" >
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

														<%
															for (Hopital hop : hopitaux) {
														%>
														<option value="<%=hop.getId()%>"><%=hop.getHopital()%></option>
														<%
															}
														%>
													</select>
												</div>
											
											<div class="form-group">
												<label>Medecin:</label>
											
													<%
														MedecinDAO medDAO = new MedecinDAO();
														List<Object[]> medecins = medDAO.listerLesMedecin();
														
													%>
													<select class="form-control" name="medecin"
						>
														<%
														 for (Object[] med : medecins) {
																
														%>
														<option value="<%=med[0]%>"><%=med[1]+" "+med[2]%></option>
														<%
															}
														%>
													</select>
												</div>
								
											<div class="form-group">
												<label>Examen:</label>
											
													<%
														ExamenImagerieDAO examenDAO = new ExamenImagerieDAO();
														List<ExamenImagerie> examens = new ArrayList<>();
														examens = examenDAO.listerExamenImagerie();
													%>
													<select class="form-control" name="examen"
													>
														<%
															for (ExamenImagerie exam : examens) {
														%>
														<option value="<%=exam.getId()%>"><%=exam%></option>
														<%
															}
														%>
													</select>
												</div>
											
											<div class="form-group">
												<label for="dateexamen">Date
													d'examen:</label> <input type="text" name="dateImagerie"
													value="<%=dateFormatee%>" class="form-control"
													id="dateexamen">

											</div>
											<div class="form-group">
												<label>Valeur</label>
												<input type="file" class="form-control" name="fichier" id=""
													value="<%=examen.getFile()%>">
											</div>

										</div>
									
   									


							
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
								
								</div></div>
							
	</div>	</form>
					</div>
				</div>
			

</div>

			</div>
		</div> </div>
</body>

</html>