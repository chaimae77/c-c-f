
<div class="sidebar">
	<div class="logo">
		<a href="charts.jsp" class="simple-text">
			<div class="logo-img">
				<img src="images/chu.png" />
				<h6 style="color: #34659a;">Cancers Colorectaux Familiaux </h6>
			</div> 
		</a>
	</div>
	<%
		String roleU = (String) session.getAttribute("role");
	%>
	<div class="sidebar-wrapper">
		<ul class="nav" id="nav">
			<li class="nav-item"><a class="nav-link" href="charts.jsp">
					<i class="material-icons">dashboard</i>
					<p>Tableau de Bord</p>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="espaceUtilisateur.jsp"> <i class="material-icons"> groups</i>
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
			<%
			if ("admin".equals(roleU)) {				
			%>
			<li class="nav-item"><a class="nav-link"
				href="gestionUtilisateurs.jsp"> <i class="material-icons">people_outline</i>
					<p>Gestions des utilisateurs</p>
			</a>
			</li>
			<%
			}
			%>
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