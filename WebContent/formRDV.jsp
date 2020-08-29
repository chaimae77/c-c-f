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

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
		<%@include file="navbar.jsp"%>
			<div class="row">
				<div class="col-md-1 col-lg-offset-0">
					<a href="ajoutRendezVous.jsp" ><i class="material-icons preced">arrow_back</i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-lg-offset-2">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Modifier un Rendez Vous</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<form role="form" action="modifierRendezVous.chu" method="post">
								<%
									String id_rdv = (String) session.getAttribute("idRDV");
									int idRDV = Integer.parseInt(id_rdv);
									RendezDAO rdvDAO = new RendezDAO();
									RendezVous rdv = rdvDAO.trouverRendezVousById(idRDV);
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									String dates = formatter.format(rdv.getDateRendezVous());
								%>

								<div class="form-group">

									<input type="hidden" class="form-control" name="idRendez"
										value='<%=rdv.getId()%>' placeholder="">
								</div>
								<div class="form-group">
									<label for="nomFamille">Patient</label>
									<%
										IndividuDAO invidu = new IndividuDAO();
										List<Individu> individus = new ArrayList<>();
										individus = invidu.listerLesIndividu();
									%>
									<select class="form-control" name="patient">
										<option value="<%=rdv.getPatient().getId()%>"><%=rdv.getPatient()%></option>
										<%
											for (Individu indi : individus) {
												if (rdv.getPatient().getId() != indi.getId()) {
										%>

										<option value="<%=indi.getId()%>"><%=indi%></option>
										<%
											}
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label for="">Date Rendez-vous:</label> <input type="date"
										class="form-control" name="dateRDV" value='<%=dates%>' />
								</div>
								<div class="form-group">
									<label for="">Heure Rendez-vous:</label> <input type="time"
										class="form-control" name="hrRDV"
										value='<%=rdv.getHeureRendez()%>' />
								</div>
								<div class="form-group">
									<label for=""> Objet</label>
									<textarea class="form-control" name="objRDV"><%=rdv.getObjet()%></textarea>
								</div>
								<div class="form-group">
									<label for=""> Note</label>
									<textarea class="form-control" name="ntRDV"><%=rdv.getNote()%></textarea>
								</div>
								</br>
								<button type="submit"
									class="btn btn-purple waves-effect waves-light btnCardInfo">Modifier</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- End row -->

		</div>
		<!-- /#wrapper -->
	</div>
</body>
</html>
