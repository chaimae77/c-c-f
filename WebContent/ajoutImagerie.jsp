<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Imagerie</title>
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
								<h4>Ajouter Imagerie</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" enctype='multipart/form-data'
								action="ajoutImagerie.chu" method="post">
								<div class="form-group">
									<input type="hidden" class="form-control" name="dossier"
										value="<%=dos.getId()%>" style="width: 250px">
								</div>

								<div class="form-group">
									<label for="">Hopital:</label>
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
									<label class="form-control-label">Examen:</label>
									<div class="">
										<%
											ExamenImagerieDAO examenDAO = new ExamenImagerieDAO();
											List<ExamenImagerie> examens = new ArrayList<>();
											examens = examenDAO.listerExamenImagerie();
										%>
										<select class="form-control" name="examen" required>
											<%
												for (ExamenImagerie exam : examens) {
											%>
											<option value="<%=exam.getId()%>"><%=exam%></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="dateexamen" class="form-control-label">Date
										d'examen:</label> <input type="date" name="dateImagerie"
										class="form-control" id="dateexamen" required>
								</div>
								<div class="form-group">
									<label for="poids" class="form-control-label">Fichier</label> <input
										type="file" id="files" name="image" class="form-control"
										multiple="multiple" required>
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