<%@page import="dao.entities.Couple"%>
<%@page import="dao.IndividuDAO"%>
<%@page import="dao.FamilleDAO"%>
<%@page import="dao.entities.Individu"%>
<%@page import="java.util.List"%>
<%@page import="dao.entities.Famille"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="arbre.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link href="css/arbre.css" rel="stylesheet">
<style type="text/css">
@media print {
	#printPageButton, #sidebar {
		display: none;
	}
}
</style>
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>

<body>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 col-lg-offset-0">
					<a href="espaceUtilisateur.jsp"><i
						class="material-icons preced">arrow_back</i></a>
				</div>
			</div>
			<%
				int id = (int) session.getAttribute("id");
				IndividuDAO ind = new IndividuDAO();
				List<Individu> couple = ind.listCoupleByFamille(id);
				if (couple.size() > 0) {
			%>
			<div class="row">
				<h1 class="text-center">
					Arbre Généalogique de la Famille
					<%=couple.get(0).getNom()%>
				</h1>
			</div>
			<div class="row">
				<div class="tree">
					<ul>
						<li>
							<%
								Individu c = couple.get(0);
									if (c.getFilsDeCouple() == null || c.getFilsDeCouple().getId() != 0) {
							%>
							<div class="pere">
								<div class="infosGeneral">
									<div class="imgIndividu">
										<img src="images/CHU_Images/145903.jpg" width="60px;" />
									</div>
									<div class="infos">
										<span>Pére</span> <span>Nom : <%=c.getMembreDeCouple().getPere().getNom()%></span>
										<span>Prénom : <%=c.getMembreDeCouple().getPere().getPrenom()%></span>
									</div>
								</div>
							</div>
							<div class="mere">
								<div class="infosGeneral">
									<div class="imgIndividu">
										<img src="images/CHU_Images/145903.jpg" width="60px;" />
									</div>
									<div class="infos">
										<span>Mére</span> <span>Nom : <%=c.getMembreDeCouple().getMere().getNom()%></span>
										<span>Prénom : <%=c.getMembreDeCouple().getMere().getPrenom()%></span>
									</div>
								</div>
							</div> <%
 	}
 		List<Individu> individu = ind.listCoupleFilsByFamille(c.getMembreDeCouple().getId());
 		if (individu.size() > 0) {
 %>
							<ul>
								<%
									for (Individu i : individu) {
												if (i.getMembreDeCouple() == null || i.getFilsDeCouple() == null) {
								%>
								<li>
									<div class="child">
										<div class="infosGeneral">
											<div class="imgIndividu">
												<img src="images/CHU_Images/145903.jpg" width="60px;" />
											</div>
											<div class="infos">
												<span>Fils</span> <span>Nom : <%=i.getNom()%></span> <span>Prénom
													: <%=i.getPrenom()%></span>
											</div>
										</div>
									</div>
								</li>
								<%
									}
												if (i.getMembreDeCouple() != null && i.getFilsDeCouple() != null) {
								%>
								<li>
									<div class="pere">
										<div class="infosGeneral">
											<div class="imgIndividu">
												<img src="images/CHU_Images/145903.jpg" width="60px;" />
											</div>
											<div class="infos">
												<span>Pére</span> <span>Nom : <%=i.getMembreDeCouple().getPere().getNom()%></span>
												<span>Prénom : <%=i.getMembreDeCouple().getPere().getPrenom()%></span>
											</div>
										</div>
									</div>
									<div class="mere">
										<div class="infosGeneral">
											<div class="imgIndividu">
												<img src="images/CHU_Images/145903.jpg" width="60px;" />
											</div>
											<div class="infos">
												<span>Mére</span> <span>Nom : <%=i.getMembreDeCouple().getMere().getNom()%></span>
												<span>Prénom : <%=i.getMembreDeCouple().getMere().getPrenom()%></span>
											</div>
										</div>
									</div>
									<ul>
										<%
											if (i.getFilsDeCouple() != null) {
																List<Individu> individuFils = ind
																		.listCoupleFilsByFamille(i.getMembreDeCouple().getId());
																for (Individu indFils : individuFils) {
										%>
										<li>
											<div class="child">
												<div class="infosGeneral">
													<div class="imgIndividu">
														<img src="images/CHU_Images/145903.jpg" width="60px;" />
													</div>
													<div class="infos">
														<span>child</span> <span>Nom : <%=indFils.getNom()%>
														</span> <span>Prénom : <%=indFils.getPrenom()%></span>
													</div>
												</div>
											</div>
										</li>
										<%
											}
															}
										%>
									</ul>
								</li>
								<%
									}
											}
								%>
							</ul> <%
 	}
 %>
						</li>
					</ul>

				</div>
			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-7">
					<button type="button"
						class="btn btn-info btn-sm pull-right create_pdf btnCardInfo"
						id="printPageButton" onclick="window.print()">Télécharger</button>
				</div>
			</div>
			<%
				} else {
			%>
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">Aucun Arbre Généalogique à afficher</h1>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>
