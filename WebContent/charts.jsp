
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
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="css/dashboard.css">
<style type="text/css">
.navbar-nav>li {
	float: none !important;
	display: flex;
	justify-content: center;
}
</style>
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="font-awesome/css/all.css" rel="stylesheet" type="text/css">
<script src="font-awesome/js/all.js"></script>
<script src="assetss/js/Chart.min.js"></script>
<!-- <script type="text/javascript" src="https://cdn.zingchart.com/zingchart.min.js"></script>  -->
</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="">CRF-Data</a>
			</div>
			<%
				String nomUser = (String) session.getAttribute("nom");
				String prenomUser = (String) session.getAttribute("prenom");
			%>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-user"></i> <%=prenomUser + "   " + nomUser%>
						<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-fw fa-user"></i> Profil</a></li>
						<li><a href="logout.chu"><i class="fa fa-fw fa-power-off"></i>
								Déconnexion</a></li>
					</ul></li>
			</ul>

			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="nav-header">
						<div class="dropdown side-profile text-left">
							<span style="display: block;"> <img alt="image"
								class="img-circle" src="images\medecin.png" width="100px">
							</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear" style="display: block;"> <span
									class="block m-t-xs"> <strong class="font-bold"><%=prenomUser + "  " + nomUser%>
											<b class="caret"></b></strong>
								</span></span>
							</a>
						</div>
					</li>
					<li><a href="espaceUtilisateur.jsp"><i
							class="fa fa-fw fa-table"></i> Gestion des familles</a></li>
					<li><a href="gestionDossier.jsp"><i
							class="fa fa-fw fa-table"></i> Gestion des dossiers</a></li>
					<li><a href="ajoutRendezVous.jsp"><i
							class="fa fa-fw fa-table"></i> Gestions des rendez-vous</a></li>
					<li class="active"><a href="charts.jsp"> <i
							class="fas fa-chart-bar"></i> Tableau de bord
					</a></li>
				</ul>
			</div>

		</nav>
		<div class="container-fluid">

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
								<i class="fas fa-skull"></i>
							</div>
							<p class="card-category">Décès</p>
							<h3 class="card-title">
								<%=nbDecce%>
								<small>Morts</small>
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
								<i class="fas fa-clipboard-check"></i>
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
								<i class="fas fa-user"></i>
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
								<i class="fas fa-users"></i>
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
					data :<%=data2%>,
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
