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
<title>Génétique</title>
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
								<h4>Ajouter Génétique</h4>
							</div>
						</div>
						<form role="form" action="ajoutGenetique.chu" method="post">
							<div class="card-body table-responsive">
								<div class="form-group">
									<input type="hidden" class="form-control" name="dossier"
										value="<%=dos.getId()%>">
								</div>
								<div class="form-group">
									<label for="hopital" for="">Hopital:</label>

									<%
										HopitalDAO hopDAO = new HopitalDAO();
										List<Hopital> hopitaux = new ArrayList<>();
										hopitaux = hopDAO.listerLesHopitaux();
									%>

									<select class="form-control" name="hopital" id="hoptal">
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
									<label for="numero" for="">Numéro du dossier génétique:</label>
									<input type="text" name="numero" class="form-control"
										id="numero">

								</div>
								<div class="form-group">
									<label for="instabiliteMacroscopique" for="">Instabilité
										des microsatéllites:</label> <select class="form-control"
										id="instabiliteMacroscopique" name="instabiliteMacroscopique">

										<option value=""><%=InstMacro.MSI%></option>
										<option value=""><%=InstMacro.MSS%></option>

									</select>

								</div>

								<div class="form-group">
									<label for="mutaBRAF" for="">Mutation VC00E du gène
										BRAF:</label> <select class="form-control" id="mutaBRAF"
										name="mutaBRAF">

										<option value="">OUI</option>
										<option value="">NON</option>

									</select>
								</div>


								<div class="form-group">
									<label for="mutaKras" for="">Mutation du gène K-ras:</label> <select
										class="form-control" id="mutaKras" name="mutaKras">

										<option value=""><%=Resultat.OUI%></option>
										<option value=""><%=Resultat.NON%></option>
										<option value=""><%=Resultat.VSI%></option>

									</select>
								</div>


								<div class="form-group">
									<label for="mutaAPC" for="">Mutation du gène APC:</label> <select
										class="form-control" id="mutaAPC" name="mutaAPC">

										<option value="">OUI</option>
										<option value="">NON</option>

									</select>

								</div>

								<div class="form-group">
									<label for="mutaMYH" for="">Mutation du gène MYH:</label> <select
										class="form-control" id="mutaMYH" name="mutaMYH">

										<option value="">OUI</option>
										<option value="">NON</option>

									</select>
								</div>



								<div class="form-group">
									<label for="mutaMMR" for="">Mutation du gène MMR: </label> <select
										class="form-control" id="mutaMMR" name="mutaMMR">

										<option value=""><%=Resultat.OUI%></option>
										<option value=""><%=Resultat.NON%></option>
										<option value=""><%=Resultat.VSI%></option>

									</select>
								</div>



								<div class="form-group">
									<label for="autre" for="">autre</label> <input type="text"
										class="form-control" name="autre" id="autre">
								</div>


								</br>

								<button type="submit"
									class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
								</br>
							</div>
					</div>

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