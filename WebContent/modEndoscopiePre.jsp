<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Custom CSS -->
<link href="css/sb-admin.css" rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div id="wrapper">
		<%@include file="enteteUt.jsp"%>

		<div class="container-fluid">
			<%@include file="navbar.jsp"%>
			<div class="row">
          
              
                        <div class="col-md-6 col-ms-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Cas d'une endoscopie normale</h4>
							</div>
						</div>
						
									<%
										
												Endoscopie examen = (Endoscopie)session.getAttribute("Endoscopie");
												SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
												String dateFormatee = formatDateJour.format(examen.getDateEndo());
													
											
											%>
											
											<div class="card-body table-responsive">
										    <form role="form" action="modEndoscopieTrait.chu" method="post" enctype='multipart/form-data'>
											<div class="row">
											<div class="panel-body">
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="dossier" value="<%=examen.getDossier().getId()%>">
		                                    </div>
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="idExamen" value="<%=examen.getId()%>">
		                                    </div>
													<div class="form-group">
													<label>Hôpital:</label>
												
													<%
											            	HopitalDAO hopDAO = new HopitalDAO();
											            	List<Hopital> hopitaux = new ArrayList<>();
											            	hopitaux=hopDAO.listerLesHopitaux();
											            %>
											            
														<select class="form-control" name="hopital">
														<option value="<%=examen.getHopital().getId()%>"><%=examen.getHopital() %></option>
														<% 
				                                			for(Hopital hop : hopitaux ){
				                                				if(examen.getHopital().getId()!= hop.getId()){
				                                		%>	
				                                			    <option value ="<%=hop.getId() %>"><%=hop %></option>
				                                		<% 
				                                			  }
				                                			}
				                                		%>  
														</select>
													</div>
												
													<div class="form-group">
	                                                <label>Médecin:</label>
	                                                <%
														MedecinDAO medDAO = new MedecinDAO();
														List<Object[]> medecins = medDAO.listerLesMedecin();
														
													%>
													<select class="form-control" name="medecin">
														<%
														 for (Object[] med : medecins) {
																
														%>
														<option value="<%=med[0]%>"><%=med[1]+" "+med[2]%></option>
														<%
															}
														%>
													</select>
	                                                </div>
                                           		
													
													<div class="form-group">
														<label>Type Examen endoscopique:</label>
														
														 <%
														 TypeAndoscopieDAO typeDAO = new TypeAndoscopieDAO();
												            	List<TypeAndoscopie> types = new ArrayList<>();
												            	types=typeDAO.listerTypeAndoscopie();
												            %>
															<select class="form-control" name="typeExamen">
															<option value="<%=examen.getTypeEndo().getId()%>"><%=examen.getTypeEndo() %></option>
															<% 
					                                			for(TypeAndoscopie type : types ){
					                                				if(examen.getTypeEndo().getId()!= type.getId()){
					                                		%>	
					                                			    <option value ="<%=type.getId() %>"><%=type %></option>
					                                		<% 
					                                			  }
					                                			}
					                                		%>  
															</select>
														</div>
												
													<div class="form-group">
														<label for="dateexamen">Date d'examen:</label>
														
														  <input type="text" name="dateexamen" value="<%=dateFormatee %>" class="form-control" id="dateexamen">
														
													</div> 
													<div class="form-group">
														<label for="poids">Numéro:</label>
														<input type="text" class="form-control" name="numero" id="numero" value="<%=examen.getNumero() %>" >
													</div>
												 <div class="form-group">
	                                                <label>Ansthesie</label>
	                                             
	                                                    <select class="form-control" name="anesthesie">
	                                                       <option value="<%=examen.getAnestesie()%>"><%=examen.getAnestesie()%></option>
	                                                       <% 
	                                                       List<Anesthesie> enumValues = Arrays.asList(Anesthesie.values());
	                                                         for(Anesthesie ane : enumValues){
	                                                        if(!ane.equals(examen.getAnestesie())){	 
	                                                         
	                                                       %>
							                               <option value="<%=ane%>"><%=ane%></option>
							                               <%
	                                                         }
	                                                         }
							                               %>
							                              
	                                                    </select>
	                                                </div>
	                                            
												</div> <!-- panel-body -->
												
												
												</div>
                        </div>     
                 </div> </div>
                 <div class="row">
                 	
                        <div class="col-md-6 col-ms-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Masse tumorale</h4>
							</div>
						</div>
												<div class="panel-body">
													<div class="form-group">
                                                <label for="">Siège:</label>
                                                <%
                                                	SiegeDAO siegeDAO = new SiegeDAO();
                                                	List<Siege> sieges = new ArrayList<>();
                                                	sieges = siegeDAO.listerSiege();
                                                
                                                %>
                                               
                                                    <select class="form-control" name="siegeMasse">
                                                    <option value=""></option>
                                                    <% 
						                                			for(Siege  siege : sieges){
						                                		%>
						                                			    <option value="<%=siege.getId()  %>"><%=siege %></option>
						                                		<% 
						                                			}
						                                		%>
                                                    </select>
                                                
												</div>
												<div class="form-group">
                                                <label for="">Aspect Macroscopique:</label>
                                                 <%
                                                	AspectMacroDAO aspectDAO = new AspectMacroDAO();
                                                	List<AspectMacro> aspects = new ArrayList<>();
                                                	aspects = aspectDAO.listerAspect();
                                                
                                                %>
                                              
                                                    <select class="form-control" name="aspectMasse">
                                                        <% 
						                                			for(AspectMacro  aspect : aspects){
						                                		%>
						                                			    <option value="<%=aspect.getId() %>"><%=aspect %></option>
						                                		<% 
						                                			}
						                                		%> 
                                                    </select>
                                                </div>
												
												<div class="form-group">
                                                <label for="">Circonférence:</label>
                                                <%
                                                	CirconferenceDAO cirDAO = new CirconferenceDAO();
                                                	List<Circonference> circonferences= new ArrayList<>();
                                                	circonferences = cirDAO.listerLesCirconference();
                                                
                                                %>
                                              
                                                    <select class="form-control" name="circonferenceMasse">
                                                        <% 
						                                			for(Circonference  cir : circonferences){
						                                		%>
						                                			    <option value="<%=cir.getId() %>"><%=cir %></option>
						                                		<% 
						                                			}
						                                		%>  
                                                    </select>
                                            
												</div>
												<div class="form-group">
                                                <label for="poids" >Taille :</label>
                                                <input type="text" class="form-control" name="tailleMasse" id="taille" placeholder="" >
												</div>
												<div class="form-group">
                                                <label>Sténose:</label>
                                         
                                                    <select class="form-control" name="stenose">
                                                        <option><%=Stenose.FRANCHISSABLE %></option>
                                                        <option><%=Stenose.NON_FRANCHISSABLE %></option> 
                                                    </select>
                                                </div>
											
												<div class="form-group">
                                                <label for="poids">Ref AnaPathologie:</label>
                                                <input type="text" class="form-control" name="refAnaPathMasse" id="refAnaPath" placeholder="">
												</div>
												</div>
                 	</div>
                 </div></div>
                  <div class="row">
                 	
                        <div class="col-md-6 col-ms-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Polype</h4>
							</div>
						</div>
												<div class="panel-body">
												<div class="form-group">
                                                <label>Siège:</label>
                                               
                                                    <select class="form-control" name="siegePolype">
                                                    	<option value=""></option>
                                                        <% 
						                                			for(Siege  siege : sieges){
						                                		%>
						                                			    <option value="<%=siege.getId()  %>"><%=siege %></option>
						                                		<% 
						                                			}
						                                		%>
                                                    </select>
                                                </div>
											
													<div class="form-group">
                                                <label>Nombre:</label>
                                               
                                                    <select class="form-control" name="nbre">
                                                        <option>1</option>
                                                        <option>2</option>
														<option>3</option> 
														<option>4</option> 
														<option>5</option> 
                                                    </select>
                                                </div>
												
												<div class="form-group">
                                                <label for="nbr1">Nombre > 1 cm:</label>
                                                <input type="text" class="form-control" name="nbre1" id="nbre1" placeholder="">
												</div>
												
												<div class="form-group">
                                                <label>Aspect Macroscopique:</label>
                                             
                                                    <select class="form-control" name="aspectPolype">
                                                        <% 
						                                			for(AspectMacro  aspect : aspects){
						                                		%>
						                                			    <option value="<%=aspect.getId() %>"><%=aspect %></option>
						                                		<% 
						                                			}
						                                		%>  
                                                    </select>
                                                </div>
												
												<div class="form-group">
                                                <label>Circonférence:</label>
                                              
                                                    <select class="form-control" name="circonferencePolype">
                                                         <% 
						                                			for(Circonference  cir : circonferences){
						                                		%>
						                                			    <option value="<%=cir.getId() %>"><%=cir %></option>
						                                		<% 
						                                			}
						                                		%>
                                                    </select>
                                                </div>
											
												<div class="form-group">
                                                <label for="poids">Taille (grand diamètre):</label>
                                                <input type="text" class="form-control" name="taillePolype" id="taille" placeholder="" >
											
												<div class="form-group">
                                                <label>Couleur:</label>
                                              
                                                    <select class="form-control" name="couleur">
                                                        <option>Bleu</option>
                                                        <option>Rouge</option> 
                                                    </select>
                                                </div>
												
												<div class="form-group">
                                                <label for="poids">Ref AnaPathologie:</label>
                                                <input type="text" class="form-control" name="refAnaPathPolype" id="refAnaPath" placeholder="">
												</div>
                 	</div>
                 </div></div>
                 </div>
                 	
                  <div class="row">
                 	
                        <div class="col-md-6 col-ms-12">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Complications: </h4>
							</div>
						</div>
												<div class="panel-body">
													<div class="form-group">
													<label for=""> Complications: </label>
												<div class="col-md-12">
														<div class="checkbox">
													 <%
													 	ComplicationDAO compDAO = new ComplicationDAO();
											            	List<Complication> complications = new ArrayList<>();
											            	complications=compDAO.listerLesComplication();
											           
				                                			for(Complication comp : complications ){
				                                		%>
														<input id="syndrome" type="checkbox"  name="complication" value ="<%=comp.getId() %>">
														<label for="syndrome">
															<%=comp %>
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
            
                <div class="row">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
									</div>
								</div> </div>    </div>
                 </form> 
				
				
				
        </div>
    </div>	
</body>

</html>