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

<title>Modification de statut</title>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>
		<div id="page-wrapper">
			<div class="container-fluid">
			 <%@include file="navbar.jsp"%>
                <div class="row">
										<%
								String idStatut = (String) session.getAttribute("idStatut");
								int id = Integer.parseInt(idStatut);
								StatutDAO type = new StatutDAO();
								StatutCancereux statut = type.trouverStautById(id);
							%>
						<div class="col-md-8 col-md-offset-2">
						<div class="card">
						<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>	Modifier le Statut
										<%=statut.getTypeStatut()%></h4></div></div>
									

									<form role="form" action="modifierStatut.chu" method="post">
										<div class="card-body table-responsive">
											<input type="hidden" class="form-control" name="statut"
												value="<%=statut.getId()%>" style="width: 250px">
										
						
											<div class="form-group">
												<label for="">Type de Cancer :</label>
												
													<%
														TypeStatutDAO staDAO = new TypeStatutDAO();
														List<TypeStatut> statuts = new ArrayList<>();
														statuts = staDAO.listerType();
													%>

													<select class="form-control" name="typeStatut">
														<option value="<%=statut.getTypeStatut().getId()%>"><%=statut.getTypeStatut()%></option>
														<%
															for (TypeStatut st : statuts) {
																if (st.getId() != statut.getTypeStatut().getId()) {
														%>
														<option value="<%=st.getId()%>"><%=st.getTypeCancer()%></option>
														<%
															}
															}
														%>
													</select>
												
											</div>
											
											<div class="form-group">
												<label for="">Année :</label>
												
													<input type="text" name="annee" placeholder="aaaa"
														class="form-control" id="annee" style="width: 250px"
														value="<%=statut.getAnnee()%>">
											
											</div>
											
											<div class="form-group">
												<label for="">Age</label>
												
													<input type="text" class="form-control" name="age" id="age"
														placeholder="age" style="width: 250px"
														value="<%=statut.getAge()%>">
												</div>
												
												<div class="form-group">
													<label for="">Site :</label>

													
														<%
															SiteDAO siteDAO = new SiteDAO();
															List<Site> sites = new ArrayList<>();
															sites = siteDAO.listerSite();
														%>

														<select class="form-control" name="site">
															<option value="<%=statut.getSite().getId()%>"><%=statut.getSite()%></option>
															<%
																for (Site site : sites) {
																	if (statut.getSite().getId() != site.getId()) {
															%>
															<option value="<%=site.getId()%>"><%=site%></option>
															<%
																}
																}
															%>
														</select>
													
												</div>
											
												<div class="form-group">
													<label for="">Type :</label>
												

														<%
															TypeDAO typeDAO = new TypeDAO();
															List<Type> types = new ArrayList<>();
															types = typeDAO.listerType();
														%>

														<select class="form-control" name="type">
															<option value="<%=statut.getType().getId()%>"><%=statut.getType().getType()%></option>
															<%
																for (Type t : types) {
																	if(statut.getType().getId()!=t.getId()){
															%>
															<option value="<%=t.getId()%>"><%=t.getType()%></option>
															<%
																}
																}
															%>
														</select>
													
												</div>
											
												<div class="form-group">
													<label for="">T :</label>
													
														<select class="form-control" name="t">
															<option><%=statut.getT()%></option>
															<option><%=T.T0%></option>
															<option><%=T.T1%></option>
															<option><%=T.T2%></option>
															<option><%=T.T3%></option>
															<option><%=T.Tis%></option>
															<option><%=T.Tx%></option>
														</select>
													
												</div>
												
												<div class="form-group">
													<label for="">M :</label>
												
														<select class="form-control" name="m">
															<option><%=statut.getM()%></option>
															<option><%=M.M0%></option>
															<option><%=M.M1%></option>
															<option><%=M.Mx%></option>
														</select>
												
												</div>
												
												<div class="form-group">
													<label for="">N :</label>
												
														<select class="form-control" name="n">
															<option><%=statut.getN()%></option>
															<option><%=N.N0%></option>
															<option><%=N.N1%></option>
															<option><%=N.N2%></option>
															<option><%=N.N3%></option>
															<option><%=N.NX%></option>
														</select>
												
												</div>
											
												<div class="form-group">
													<label for="">Prise en charge :</label> 
													</br>
													<%
														PriseEnChargeDAO priseDAO = new PriseEnChargeDAO();
														List<PriseEnCharge> prises = new ArrayList<>();
														prises = priseDAO.listerPriseEnCharge();

														for (PriseEnCharge prise : prises) {
													%>
													<div class="col-md-6">
													
															<div class="checkbox">
																<input id="checkbox" type="checkbox"
																	name="priseEnCharge" value="<%=prise.getId()%>">
																<label for="checkbox"> <%=prise%>
																</label>
															</div>
													
													</div>
													<%
														}
													%>
												</div>

											<!-- form-group -->
									
						                  <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
						                  </div>
						                  </form>
										
									</div>
								</div>
							





					</div>
					<!-- End row -->

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
	
</body>

<%@include file="piedUt.jsp"%>
</html>
