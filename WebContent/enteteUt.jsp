<%-- 
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
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
			data-toggle="dropdown"><i class="fa fa-user"></i><%=prenomUser + "  " + nomUser%>
				<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="#"><i class="fa fa-fw fa-user"></i> Profil</a></li>
				<li><a href="logout.chu"><i class="fa fa-fw fa-power-off"></i>
						Déconnexion</a></li>
			</ul></li>
	</ul>

	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav" id="nav">
			<li class="nav-header" style="text-align: center">
				<div class="dropdown side-profile text-left">
					<span style="display: block;"> <img alt="image"
						class="img-circle" src="images\medecin.png" width="100px">
					</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
						class="clear" style="display: block;"> <span
							class="block m-t-xs"> <strong class="font-bold"><%=prenomUser + "  " + nomUser%>
									<b class="caret"></b></strong>
						</span></span>
					</a>
				</div>
			</li>
			<li class=" menu"><a href="espaceUtilisateur.jsp" onclick="showAbout()"><i
					class="fa fa-fw fa-table"></i> Gestion des familles</a></li>
			<li class="menu"><a href="gestionDossier.jsp" onclick="showAbout()"><i
					class="fa fa-fw fa-table"></i> Gestion des dossiers</a></li>
			<li class="menu"><a href="ajoutRendezVous.jsp"><i
					class="fa fa-fw fa-table"></i> Gestions des rendez-vous</a></li>
			<li class="menu"><a href="charts.jsp"><i class="fa fa-fw fa-bar-chart-o"></i>
					Tableau de bord </a></li>
		</ul>
	</div>

</nav>
 --%>

<div class="sidebar">
	<div class="logo">
		<a href="charts.jsp" class="simple-text">
			<div class="logo-img">
				<img src="images/chu.png" />
			</div> CHU FES
		</a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav" id="nav">
			<li class="nav-item"><a class="nav-link"
				href="charts.jsp"> <i class="material-icons">dashboard</i>
					<p>Tableau de Bord</p>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="espaceUtilisateur.jsp"> <i class="material-icons">people_outline</i>
					<p>Gestion des familles</p>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="gestionDossier.jsp"> <i class="material-icons">folder_shared</i>
					<p>Gestion des dossiers</p>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="ajoutRendezVous.jsp"> <i class="material-icons">notifications</i>
					<p>Gestions des rendez-vous</p>
			</a></li>

		</ul>
		<script>
			$(function() {
				var current = location.pathname;
				var searchTerm = '/cancer-colorectal/';
				var searchIndex = current.indexOf(searchTerm);
				var strOut = current.substr(searchIndex + searchTerm.length);
				 $('.nav-item a').each(function() {
					var $this = $(this);
					// if the current path is like this link, make it active
					 if ($this.attr('href').indexOf(strOut) !== -1) {
						$this.addClass('active');
					}
				}) 
			})
		</script>

	</div>
	<div class="sidebar-background"
		style="background-image: url(images/sidebar-4.jpg)"></div>
</div>