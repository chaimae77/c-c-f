
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="dao.entities.RendezVous"%>
<%@page import="dao.RendezDAO"%>
<%@page import="dao.UtilisateurDAO"%>
<%@page import="dao.entities.Medecin"%>
<%@page import="dao.MedecinDAO"%>
<%@page import="dao.IndividuDAO"%>
<%@page import="dao.entities.Decces"%>
<%@page import="dao.DeccesDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.entities.Famille"%>
<%@page import="java.util.List"%>
<%@page import="dao.FamilleDAO"%>
<%@page import="org.eclipse.persistence.jpa.jpql.parser.Join"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<script src="assetss/js/Chart.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
		<%@include file="navbar.jsp"%>

			<%
				DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
				Date dateobj = new Date();
				SimpleDateFormat formatDateJour = new SimpleDateFormat("yyyy-MM-dd");
			%>

			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<%
						DeccesDAO decceDAO = new DeccesDAO();
						int nbDecce = decceDAO.nombredecces();
					%>
					<div class="card card-stats">
						<div class="card-header card-header-danger card-header-icon">
							<div class="card-icon">
								<i class="material-icons">warning</i>
							</div>
							<p class="card-category">Décès</p>
							<h3 class="card-title">
								<%=nbDecce%>
								Morts
							</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats">
						<div class="card-header card-header-success card-header-icon">
							<div class="card-icon">
								<i class="material-icons">fact_check</i>
							</div>
							<p class="card-category">Guéris</p>
							<h3 class="card-title">14 Guéris</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<%
						UtilisateurDAO userDAO = new UtilisateurDAO();
						int nbUsers = userDAO.nombreUsers();
					%>
					<div class="card card-stats">
						<div class="card-header card-header-primary card-header-icon">
							<div class="card-icon">
								<i class="material-icons">person</i>
							</div>
							<p class="card-category">Utilisateurs</p>
							<h3 class="card-title"><%=nbUsers%>
								users
							</h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<%
						FamilleDAO famDAO = new FamilleDAO();
						int nbFam = famDAO.nombreFamilles();
					%>
					<div class="card card-stats">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon">
								<i class="material-icons">groups</i>
							</div>
							<p class="card-category">Familles</p>
							<h3 class="card-title">
								+<%=nbFam%></h3>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<%
						FamilleDAO famille = new FamilleDAO();
						List<Object[]> familles = famille.syndromeParFamille();
						Vector<Object> data = new Vector<>();
						Vector<String> labels = new Vector<>();
						for (Object[] obj : familles) {
							data.add(obj[0]);
							labels.add((String) obj[1]);
						}
					%>
					<div class="card card-chart">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Syndromes</h4>
							</div>
						</div>
						<div class="card-body">
							<canvas class="ct-chart" id="syndromes"></canvas>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<%
						IndividuDAO indivduDAO = new IndividuDAO();
						List<Object[]> individus = indivduDAO.individuParTypeCancer();
						Vector<Object> data1 = new Vector<>();
						Vector<Object> labels1 = new Vector<>();
						for (Object[] obj : individus) {
							data1.add(obj[0]);
							labels1.add(obj[1]);
						}
					%>
					<div class="card card-chart">
						<div class="card-header card-header-primary card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Types de cancer</h4>
							</div>
						</div>
						<div class="card-body">
							<canvas class="ct-chart" id="test1"></canvas>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<%
						DeccesDAO decce = new DeccesDAO();
						List<Object[]> decces = decce.deccesParMotif();
						Vector<Object> data2 = new Vector<>();
						Vector<String> labels2 = new Vector<>();
						for (Object[] obj : decces) {
							data2.add(obj[0]);
							labels2.add((String) obj[1]);
						}
					%>
					<div class="card card-chart">
						<div class="card-header card-header-danger card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Motifs de décés</h4>
							</div>
						</div>
						<div class="card-body">
							<canvas class="ct-chart" id="test2"></canvas>
						</div>
						<div class="card-footer">
							<div class="stats">
								<i class="material-icons">access_time</i> updated
								<%=dateobj%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				RendezDAO rdDAO = new RendezDAO();
				List<RendezVous> rendezVous = rdDAO.listerRendezVousNonTrait();
			%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Liste des Rendes-vous</h4>
							</div>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<th>Nom</th>
									<th>Prenom</th>
									<th>Téléphone</th>
									<th>Date R-v</th>
									<th>Heure R-v</th>
									<th>Note</th>
									<th>Objet</th>
									<th>Notifier</th>
								</thead>
								<tbody>
									<%
										for (RendezVous rd : rendezVous) {
											String dateFormatee = formatDateJour.format(rd.getDateRendezVous());
									%>
									<tr>
										<td><%=rd.getPatient().getNom()%></td>
										<td><%=rd.getPatient().getPrenom()%></td>
										<td><%=rd.getPatient().getTel1()%></td>
										<td><%=dateFormatee%></td>
										<td><%=rd.getHeureRendez()%></td>
										<td><%=rd.getNote()%></td>
										<td><%=rd.getObjet()%></td>
										<td>
											<%
												if (rd.getNotifier()) {
											%> <i class="material-icons" style="color:#337ab7;" title="Déja notifier">check</i>

											<%
												} else {
											%> <a href="notifier.chu?id=<%=rd.getId()%>" title="Notifier ? "><i
												class="material-icons">notifications_active</i></a> 
												<%
 	                                              }
                                                %> 
										</td>
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

	</div>
	<script>
		var ctx = document.getElementById('syndromes').getContext('2d');
		var labelsArray=[];
	    var labels = "<%=labels%>";
		var newLabels = labels.split(",");
		for (var i = 0; i < newLabels.length; i++) {
			labelsArray.push(newLabels[i].replace("[", "").replace("]", ""));
		}
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : labelsArray,
				datasets : [ {
					label : 'Syndromes',
					data :<%out.print(data);%>,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
	<script>
		var ctx = document.getElementById('test1').getContext('2d');
		var labelsArray=[];
	    var labels = "<%=labels1%>";
		var newLabels = labels.split(",");
		for (var i = 0; i < newLabels.length; i++) {
			labelsArray.push(newLabels[i].replace("[", "").replace("]", ""));
		}
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels :labelsArray,
				datasets : [ {
					label : 'Type cancer',
					data : <%=data1%>,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
	<script>
		var ctx = document.getElementById('test2').getContext('2d');
		var labelsArray=[];
	    var labels = "<%=labels2%>";
		var newLabels = labels.split(",");
		for (var i = 0; i < newLabels.length; i++) {
			labelsArray.push(newLabels[i].replace("[", "").replace("]", ""));
		}
		var myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : labelsArray,
				datasets : [ {
					label : 'Motifs de déces',
					data :<%=data2%> ,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			}
		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




</body>
</html>
