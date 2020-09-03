<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.entities.*"%>
<%@ page import="beans.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Espace Utilisateur</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<%
				RendezDAO rd = new RendezDAO();
				List<RendezVous> rdv = new ArrayList<>();
				rdv = rd.listerRendezVous();
				SimpleDateFormat formatDateJour = new SimpleDateFormat("yyyy-MM-dd");
			%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<button type="button" data-toggle="modal" data-target="#myModal"
						style="float: right; border: none;">
						<i class="material-icons preced">add_circle_outline</i>
					</button>
				</div>
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Liste des Rendes-vous</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
									<th>Patient</th>
									<th>Objet</th>
									<th>Note</th>
									<th>Date de Rendez-Vous</th>
									<th>Heure de Rendez-Vous</th>
									<th></th>
								</thead>
								<tbody>
									<%
										for (RendezVous r : rdv) {
											String dateFormatee = formatDateJour.format(r.getDateRendezVous());
									%>
									<tr>
										<td><%=r.getPatient()%></td>
										<td><%=r.getObjet()%></td>
										<td><%=r.getNote()%></td>
										<td><%=dateFormatee%></td>
										<td><%=r.getHeureRendez()%></td>
										<td><a href="modRendezVous.chu?id=<%=r.getId()%>"
											title="modifier"><i class="material-icons warn">edit</i></a>
											<a href="suppRend.chu?id=<%=r.getId()%>" title="supprimer"
											onclick="return(confirm('Etes-vous sûr de vouloir supprimer ce Rendez Vous?'));">
												<i class="material-icons danger">close</i>
										</a></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="card">
					<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>Ajouter un nouveau Rendez-Vous</h4>
						</div>
					</div>
					<div class="card-body table-responsive">
						<form role="form" action="ajoutRendezVous.chu" method="post">
							<div class="form-group">
								<label for="nomFamille">Patient</label>
								<%
									IndividuDAO invidu = new IndividuDAO();
									List<Individu> individus = new ArrayList<>();
									individus = invidu.listerLesIndividu();
								%>
								<select class="form-control" name="patient">
									<%
										for (Individu indi : individus) {
									%>

									<option value="<%=indi.getId()%>"><%=indi%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="form-group">
								<label for="">Date Rendez-vous:</label> <input type="date"
									class="form-control" name="dateRDV">
							</div>
							<div class="form-group">
								<label for="">Heure Rendez-vous:</label> <input type="time"
									class="form-control" name="hrRDV">
							</div>
							<div class="form-group">
								<label for="">Objet</label>
								<textarea class="form-control" name="objRDV"></textarea>
							</div>
							<div class="form-group">
								<label for="">Note</label>
								<textarea class="form-control" name="ntRDV"></textarea>
							</div>
							</br> </br>
							<button type="submit"
								class="btn btn-purple waves-effect waves-light btnCardInfo">Enregistrer</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="piedUt.jsp"%>
</body>
</html>

