<nav
	class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
	<div class="main">
		<div class="navbar-wrapper">
			<a class="navbar-brand" href="charts.jsp"><img
				src="asset/images/unnamed.png" /></a>
		</div>
		<div class="collapse navbar-collapse justify-content-end"
			id="navigation">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="charts.jsp">
						<i class="material-icons" title="Tableau de Bord">dashboard</i>
				</a></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="javascript:void(0)" id="navbarDropdownMenuLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">notifications</i> <span
						class="notification">2</span>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="javascript:void(0)">Rappel de
							Rendez-vous de x</a> <a class="dropdown-item"
							href="javascript:void(0)">Rappel de Rendez-vous de y</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="javascript:void(0)" id="navbarDropdownPersonLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="material-icons">person</i>
				</a> 
				<%
 	               String nomUser = (String) session.getAttribute("nom");
 	               String prenomUser = (String) session.getAttribute("prenom");
                %>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownPersonLink">
						<a class="dropdown-item" href="#"><i class="material-icons">person</i><%=nomUser %> <%=prenomUser %></a>
						<a class="dropdown-item" href="logout.chu"><i
							class="material-icons">power_settings_new</i>Déconnexion</a>
					</div></li>
			</ul>
		</div>
	</div>
</nav>