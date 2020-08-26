<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Statuts</title>
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
	
			<div class="container-fluid">
			 <%@include file="navbar.jsp"%>
			 	<div class="col-lg-12 ">
                    <div class="panel-body">
                        <a href="statut.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:100px">Satut</button></a>
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Génétique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Traitement</button></a>
                    </div>                       
                </div>
                <div class="row">
                	<%
										String id_Dossier = (String)session.getAttribute("idDossier");
										int  idDossier = Integer.parseInt(id_Dossier);
										DossierDAO dosDAO = new DossierDAO();
										DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
									
									%>
								
							
                               
						<div class="col-md-8 col-md-offset-2">
						<div class="card">
						<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>Ajout du statut CCR</h4></div></div>
						 
						
								
										
										
                                    	<form role="form" action="ajoutStatut.chu" method="post">
										<div class="card-body table-responsive">
                                         <input type="hidden" class="form-control" name="patient" value="<%=dos.getPatient().getId()%>"  style="width:250px">
                                   
									
                                 
                                  
											<div class="form-group">
                                                <label for="">Type de Cancer:</label>
            
                                                <%
                                                TypeStatutDAO staDAO = new TypeStatutDAO();
								            	List<TypeStatut> statuts = new ArrayList<>();
								            	statuts  = staDAO.listerType();
											            %>
											            
                                                    <select class="form-control" name="ccr" >
                                                    	<option value =""></option>
                                                         <% 
                                                         for(TypeStatut statut : statuts ){
				                                		%>	
				                                			    <option value ="<%=statut.getId() %>"><%=statut.getTypeCancer() %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                            
										
                                            <div class="form-group">
                                                <label for="dateccr" for="">Année:</label>
                                                  <input type="text" name="anneeccr" placeholder="aaaa" class="form-control" id="annee" style="width:250px">
                                            </div>
                                            
											<div class="form-group">
                                                <label for="ageccr" for="" >Age:</label>
                                                <input type="text" class="form-control" name="ageccr" id="ageccr" placeholder="Age" style="width:250px">
                                            </div>
                                            
											<div class="form-group">
                                                <label for="">Site:</label>
                                                
                                                
                                                <%
                                                SiteDAO siteDAO = new SiteDAO();
								            	List<Site> sites = new ArrayList<>();
								            	sites  = siteDAO.listerSite();
											            %>
											            
                                                    <select class="form-control" name="siteccr" >
                                                         <% 
                                                         for(Site site : sites ){
				                                		%>	
				                                			    <option value ="<%=site.getId() %>"><%=site %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                       
											<div class="form-group">
                                                <label for="">Type:</label>
                                            
                                                
                                                <%
                                                TypeDAO typeDAO = new TypeDAO();
								            	List<Type> types = new ArrayList<>();
								            	types  = typeDAO.listerType();
											       %>
											            
                                                    <select class="form-control" name="typeccr" >
                                                         <% 
                                                         for(Type type : types ){
				                                		%>	
				                                			    <option value ="<%=type.getId() %>"><%=type %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                          
											<div class="form-group">
                                                <label for="">T:</label>
                                                
                                                    <select class="form-control" name="tccr">
                                                        <option><%=T.T0%></option>
                                                        <option><%=T.T1%></option> 
                                                        <option><%=T.T2%></option> 
                                                        <option><%=T.T3%></option> 
                                                        <option><%=T.Tis%></option> 
                                                        <option><%=T.Tx%></option> 
                                                    </select>
                                                </div>

											<div class="form-group">
                                                <label for="">M:</label>
                                             
                                                    <select class="form-control" name="mccr">
                                                        <option><%=M.M0%></option>
                                                        <option><%=M.M1%></option>
                                                        <option><%=M.Mx%></option>
                                                    </select>
                                                </div>
                                          
											<div class="form-group">
                                                <label for="">N:</label>
                                                
                                                    <select class="form-control" name="nccr">
                                                        <option><%=N.N0%></option>
                                                        <option><%=N.N1%></option>
                                                        <option><%=N.N2%></option>
                                                        <option><%=N.N3%></option>
                                                        <option><%=N.NX%></option>
                                                    </select>
                                                </div>
                                           
											<div class="form-group">
											<label for="">Prise en charge:</label>
											</br>
											 <%
											            	PriseEnChargeDAO priseDAO = new PriseEnChargeDAO();
											            	List<PriseEnCharge> prises = new ArrayList<>();
											            	prises  = priseDAO.listerPriseEnCharge();
											            
				                                			for(PriseEnCharge prise : prises ){
				                                			
				                               %>
											<div class="col-md-6">
											
													<div class="checkbox">
														<input id="checkbox" type="checkbox" name="priseEnChargeccr" value ="<%=prise.getId() %>">
														<label for="checkbox" > <%=prise%> </label>
													</div>
												</div>
											
											<% } %>
										</div>
                                 </div>
                                 </br></br>
                                 
                                 
									<div class="card-header card-header-info card-header-icon">
						            <div class="card-icon" style="float: none !important;"><h4>Ajout du statut CEC</h4></div></div>
									<div class="card-body table-responsive">
											<div class="form-group">
                                                <label for="">Type de Cancer:</label>
                                           
                                                    <select class="form-control" name="cec">
                                                    <option value =""></option>
                                                         <% 
                                                         for(TypeStatut statut : statuts ){
				                                		%>	
				                                			    <option value ="<%=statut.getId() %>"><%=statut %></option>
				                                		<% 
				                                			}
				                                		%>
                                                    </select>
                                                </div>
                                          
                                            <div class="form-group">
                                                <label for="datecec" for="">Année:</label>
                                                  <input type="text" name="anneecec" placeholder="aaaa" class="form-control" id="annee" style="width:250px">
                                                </div>
                                          
											<div class="form-group">
                                                <label for="agecec" for="" >Age:</label>
                                                <input type="text" class="form-control" name="agecec" id="ageccr" placeholder="Age" style="width:250px">
                                            </div>
                                            
											<div class="form-group">
                                                <label for="">Site:</label>
                                              
                                                    <select class="form-control" name="sitecec">
                                                         <% 
                                                         for(Site site : sites ){
				                                		%>	
				                                			    <option value ="<%=site.getId() %>"><%=site %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                           
											<div class="form-group">
                                                <label for="">Type:</label>
                                               
                                                    <select class="form-control" name="typecec">
                                                      <% 
                                                         for(Type type : types ){
				                                		%>	
				                                			    <option value ="<%=type.getId() %>"><%=type %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                         
											<div class="form-group">
                                                <label for="">T:</label>
                                              
                                                    <select class="form-control" name="tcec">
                                                         <option><%=T.T0%></option>
                                                        <option><%=T.T1%></option> 
                                                        <option><%=T.T2%></option> 
                                                        <option><%=T.T3%></option> 
                                                        <option><%=T.Tis%></option> 
                                                        <option><%=T.Tx%></option> 
                                                    </select>
                                                </div>
                                          
											<div class="form-group">
                                                <label for="">M:</label>
                                               
                                                    <select class="form-control" name="mcec">
                                                        <option><%=M.M0%></option>
                                                        <option><%=M.M1%></option>
                                                        <option><%=M.Mx%></option> 
                                                    </select>
                                                </div>
                                         
											<div class="form-group">
                                                <label for="">N:</label>
                                               
                                                    <select class="form-control" name="ncec">
                                                         <option><%=N.N0%></option>
                                                        <option><%=N.N1%></option>
                                                        <option><%=N.N2%></option>
                                                        <option><%=N.N3%></option>
                                                        <option><%=N.NX%></option> 
                                                    </select>
                                                </div>
                                            
											<div class="form-group">
											<label for="">Prise en charge:</label>
											</br>
											 <%
											            	prises  = priseDAO.listerPriseEnCharge();
											            
				                                			for(PriseEnCharge prise : prises ){
				                                			
				                               %>
											<div class="col-md-6">
											
													<div class="checkbox">
														<input id="checkbox1" type="checkbox" name="priseEnChargecec" value="<%=prise.getId()%>">
														<label for="checkbox1" >
														<%=prise%>
														</label>
														</div>
															
												</div>
										
											<% } %>
										</div>
                                    </div>
									</br></br>
									


									<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>Ajout du statut P</h4></div></div>
													<div class="card-body table-responsive">
											<div class="form-group">
                                                <label for="">Type de Cancer:</label>
                                             
                                                    <select class="form-control" name="p">
                                                    <option value =""></option>
                                                         <% 
                                                         for(TypeStatut statut : statuts ){
				                                		%>	
				                                			    <option value ="<%=statut.getId() %>"><%=statut %></option>
				                                		<% 
				                                			}
				                                		%>
                                                    </select>
                                                </div>
                                          
                                            <div class="form-group">
                                                <label for="datep" for="">Année:</label>
                                               
                                                  <input type="text" name="anneep" placeholder="aaaa" class="form-control" id="annee" style="width:250px">
                                                </div>
                                         
											<div class="form-group">
                                                <label for="agep" for="" >Age:</label>
                                                <input type="text" class="form-control" name="agep" id="ageccr" placeholder="Age" style="width:250px">
                                            </div>
                                            
											<div class="form-group">
                                                <label for="">Forme:</label>
                                              
                                                    <select class="form-control" name="formep">
                                                         <%
											            	FormeDAO formeDAO = new FormeDAO();
											            	List<Forme> formes = new ArrayList<>();
											            	formes  = formeDAO.listerForme();
											            %>
											            <% 
				                                			for(Forme forme : formes ){
				                                				%>	
				                                			    <option value ="<%=forme.getId() %>"><%=forme %></option>
				                                			    <% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                          
											<div class="form-group">
											<label for="">Prise en charge:</label>
											</br>
											 <%
											            
											            	prises  = priseDAO.listerPriseEnCharge();
											            
				                                			for(PriseEnCharge prise : prises ){
				                                			
				                               %>
											<div class="col-md-6">
												
													<div class="checkbox">
														<input id="checkbox1" type="checkbox" name="priseEnChargep" value ="<%=prise.getId()%>">
														<label for="checkbox1" >
														<%=prise%>
														</label>
													
															
												</div>
											</div>
											<% } %>
										</div>
                                    </div> 
                                    	</br></br>
                                  
											<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>Ajout du statut MEC</h4></div></div>
													<div class="card-body table-responsive">
											<div class="form-group">
                                                <label for="">Type de Cancer:</label>
                                             
                                                    <select class="form-control" name="mec">
                                                    <option value =""></option>
                                                         <% 
                                                         for(TypeStatut statut : statuts ){
				                                		%>	
				                                			    <option value ="<%=statut.getId() %>"><%=statut %></option>
				                                		<% 
				                                			}
				                                		%>
                                                    </select>
                                                </div>
                                          
                                            <div class="form-group">
                                                <label for="datemec" for="">Année:</label>
                                          
                                                  <input type="text" name="anneemec" placeholder="aaaa" class="form-control" id="annee" style="width:250px">
                                                </div>
                                           
											<div class="form-group">
                                                <label for="agemec" for="" >Age:</label>
                                                <input type="text" class="form-control" name="agemec" id="ageccr" placeholder="Age" style="width:250px">
                                            </div>
                                            
											<div class="form-group">
                                                <label for="">Type:</label>
                                               
                                                    <select class="form-control" name="typemec">
                                                        <% 
                                                         for(Type type : types ){
				                                		%>	
				                                			    <option value ="<%=type.getId() %>"><%=type %></option>
				                                		<% 
				                                			}
				                                		%> 
                                                    </select>
                                                </div>
                                            
											<div class="form-group">
											<label for="">Prise en charge:</label>
											</br>
											 <%
											            	prises  = priseDAO.listerPriseEnCharge();
											            
				                                			for(PriseEnCharge prise : prises ){
				                                			
				                               %>
											<div class="col-md-6">
												
													<div class="checkbox">
														<input id="checkbox1" type="checkbox" name="priseEnChargemec" value="<%=prise.getId()%>">
														<label for="checkbox1" >
														<%=prise%>
														</label>
														
															
												</div>
											</div>
											<% } %>
										</div>
										
                                        <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
                                    </div>
							</form>
									
                          
				
				
        </div>
    </div>	
	</div>
					<!-- End row -->

				</div>
				<!-- /.container-fluid -->

		

		</div>
		<!-- /#wrapper -->
	
</body>

<%@include file="piedUt.jsp"%>
</html>