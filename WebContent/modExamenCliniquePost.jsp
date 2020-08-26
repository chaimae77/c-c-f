<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.css"/>
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"/>
<script src="js/jquery.min.js">  </script>
<script src="js/bootstrap.js">  </script>
<title>Gestion des examens Cliniques</title>
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

	<!--  
	<div class="container">
		<div    class="row" >
			<div  class="col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 col-xs-1 col-xs-offset-1" id="logo">
          		<img  class="img"  src="images\logo.png " width="" height="" alt="logo"/>
          	</div>
     		<div class="col-lg-12 ">
				</br></br>
            </div>
			<div class="row">
				
                <div class="pull-left col-lg-1">
                                
                    <div class="panel-body">
                        <a href="espaceUtilisateur.jsp"><button type="button" class="btn btn-primary btn-custom waves-effect waves-light m-b-5" style="width:250px" >Gestion Des Familles</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div></br></br>
                        <a href="gestionDossier.jsp"><button type="button" class="btn btn-success btn-custom waves-effect waves-light m-b-5" style="width:250px">Gestion Des Dossiers Medicales</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div></br></br>
                        <a href="ajoutRendezVous.jsp"><button type="button" class="btn btn-info btn-custom waves-effect waves-light m-b-5" style="width:250px" >Gestion Des Rendez-Vous</button></a>
						<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2"></div></br></br>
						<a><button type="button" class="btn btn-purple btn-custom waves-effect waves-light m-b-5" style="width:250px" >Deconnexion</button></a>
                    </div>
                                
                </div>
				
                <div class="col-lg-9 col-lg-offset-2">
                    <div class="panel-body">
                        <a href="gestionDossier.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:250px">Nouveau Dossier Médical</button></a>
                        <a href="examens.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:250px">Examens Medicales</button></a>
                        <a href="consultation.jsp"><button type="button" class="btn btn-warning btn-rounded waves-effect waves-light m-b-5" style="width:250px">Consultation</button></a>
						</br> </br>
						<button type="button" class="btn btn-purple btn-rounded waves-effect waves-light m-b-5" style="width:770px; height:150px">Dossier Médical</button>
                    </div>                       
                </div>
				<div class="col-lg-12 ">
                    <div class="panel-body">
                        <a href="statut.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Satut</button></a>
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Génétique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Traitement</button></a>
                    </div>                       
                </div> -->
			
					<div class="row">
					

						<div class="col-md-10 col-md-offset-1">
					<div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Modification de l'examen clinique post-opératoire </h4>
							</div>
						</div>
								<form  role="form" action="modExamenCliniquePostTrait.chu" method="post">
                   
											<%
												String id_Dossier = (String)session.getAttribute("idDossier");
												int  idDossier = Integer.parseInt(id_Dossier);
												DossierDAO dosDAO = new DossierDAO();
												DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
											
												ExamenPostOp examen = (ExamenPostOp)session.getAttribute("ExamenPostOp");
											%>
											
													<div class="col-md-8 col-md-offset-2">
											    <div class="card-body table-responsive">
											    
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="dossier" value="<%=examen.getDossier().getId()%>"  >
		                                    </div>
		                                     <div class="form-group">
		                                         <input type="hidden" class="form-control" name="idExamen" value="<%=examen.getId()%>" >
		                                    </div>
				
											<div class="form-group">
													<label for="">Hopital:</label>
													
													<%
											            	HopitalDAO hopDAO = new HopitalDAO();
											            	List<Hopital> hopitaux = new ArrayList<>();
											            	hopitaux=hopDAO.listerLesHopitaux();
											            %>
											            
														<select class="form-control" name="hopital" >
														<option value="<%=examen.getHopital().getId()%>"><%=examen.getHopital() %></option>
														<% 
				                                			for(Hopital hop : hopitaux ){
				                                				if(examen.getHopital().getId()!=hop.getId())
				                                				{
				                                		%>	
				                                			    <option value ="<%=hop.getId() %>"><%=hop %></option>
				                                		<% 
				                                			}
				                                			}
				                                		%>  
														</select>
													</div>
										
											<div class="form-group">
                                                <label for="">Medecin:</label>
                                                
                                                <%
                                                MedecinDAO medDAO = new MedecinDAO();
												List<Object[]> medecins = medDAO.listerLesMedecin();
											            %>
                                                    <select class="form-control" name="medecin" >
                                                       <%
														 for (Object[] med : medecins) {
																
														%>	
				                                			    <option value ="<%=med[0] %>"><%=med[1]+" "+med[2]%></option>
				                                		<% 
				                                			}
				                                		%>  
                                                    </select>
                                                </div>
                                          
											<%
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
											String dateFormatee = formatDateJour.format(examen.getDateExamen());
											%>
                                            <div class="form-group">
                                                <label for="dateexamen" for="">Date d'examen:</label>
                                                
                                                  <input type="text" name="dateexamen" value="<%=dateFormatee %>" class="form-control" id="dateexamen" >
                                                </div>
                                           
											<div class="form-group">
                                                <label for="poids" for="" >poids</label>
                                                <input type="text" class="form-control" name="poids" id="poids" value="<%=examen.getPoids() %>" >
                                            </div>
											<div class="form-group">
                                                <label for="taille" for="">Taille</label>
                                                <input type="text" class="form-control" name="taille" id="taille" value="<%=examen.getTaille() %>" >
                                            </div>
											<div class="form-group">
                                                <label for="oms" for="" >OMS</label>
                                                <input type="text" class="form-control" name="oms" id="oms" value="<%=examen.getOMS() %>"  >
                                            </div>
											<div class="form-group">
                                                <label for="imc" for="">IMC</label>
                                                <input type="text" class="form-control" name="imc" id="imc" value="<%=examen.getIMC() %>"   >
                                            </div>			
										</div>
										</div>
									<div class="row">
									<div class="col-sm-5 col-sm-offset-1">
                        	
										<div class="form-box">
										
											<div class="form-bottom">
											<div class="panel panel-default">
																		   <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Examen initial ou de suivi</h4>
							</div>
						</div>
								
											<div class="panel-body">
												<div class="form-group">
													<label for="">Type Examen:</label>
													
														<select class="form-control" name="typeExamen" required>
															<option><%=TypeExamen.INITIAL %></option>
                                                        	<option><%=TypeExamen.SUIVI %></option>
														</select>
													</div>
												
												<div class="form-group">
													<label for="residence"> Syndrome Anormal: </label>
													</br>
													   <div class="col-md-6">
													<div class="checkbox">
													 <%
													 	CategorieSynAnormalDAO catDAO = new CategorieSynAnormalDAO();
											            	List<CategorieSynAnormal> categories = new ArrayList<>();
											            	categories=catDAO.listerCategorieSynAnormal();
											           
				                                			for(CategorieSynAnormal cat : categories ){
				                                		%>
														<input id="syndrome" type="checkbox"  name="syndromePreOp" value ="<%=cat.getId() %>">
														<label for="syndrome">
															<%=cat %>
														</label>
														</br></br>
														<% 
				                                			}
				                                		%> 
													</div>
												</div>
											</div>
											</div> 
											</div>
										</div>
									</div></div>
                        
									<div class="col-sm-5">
                        	
									<div class="form-box">
										
										<div class="form-bottom">
											<div class="panel panel-default">
											<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Examen Post-Opératoire</h4>
							</div>
						</div>
											<div class="panel-body">
												<div class="form-group">
													<label for="delai" for="">Delai</label>
													<input type="text" class="form-control" name="delai"  placeholder="<%=examen.getDelai() %>"  style="width:250px" >
												</div>
												<div class="form-group">
													<label for="nbSelle" for="">Nombre de Selles</label>
													<input type="text" class="form-control" name="nbSelle"  placeholder="<%=examen.getNbreSelles() %>" style="width:250px" >
												</div>
												<div class="form-group">
													<label for=""> Syndrome de résection rectale: </label>
														<div class="col-md-12">
													<div class="checkbox">
													<%
														SyndromesPostOpDAO synDAO = new SyndromesPostOpDAO();
											            	List<SyndromesPostOp> syndromes = new ArrayList<>();
											            	syndromes = synDAO.listerSyndromesPostOp();
											           
				                                			for(SyndromesPostOp synd : syndromes ){
				                                		%>
														<input id="syndrome" type="checkbox"  name="syndrome" value="<%=synd.getId()%>">
														<label for="syndrome">
															<%=synd %>
														</label>
														</br></br>
														<% 
				                                			}
				                                		%> 
													</div>
												</div></div>
												<div class="form-group">
													<label for="residence"> Toucher Rectal: </label>
													</br>
																<div class="col-md-12">
													<div class="checkbox">
													<%
													ToucherRectalDAO rectDAO = new ToucherRectalDAO();
											            	List<ToucherRectal> touchers = new ArrayList<>();
											            	touchers = rectDAO.listerToucher();
											           
				                                			for(ToucherRectal toucher : touchers ){
				                                		%>
														<input id="syndrome" type="checkbox"  name="toucher" value ="<%=toucher.getId() %>">
														<label for="syndrome">
															<%=toucher %>
														</label>
														</br></br>
														<% 
				                                			}
				                                		%> 
													</div>
												</div>
											</div>
										
                        		</div>
									</div> </br>
									 <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
								
											
									
							</form>
                        </div>
						
                </div>		
               </div> 
				
				
				
        </div>
    </div>	
</body>

</html>