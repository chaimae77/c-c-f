<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<%@ page import="dao.entities.Deroulement.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				
                    
                        	
                        	<div class="col-md-12 col-md-offset-0">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Traitement</h4>
							</div>
						</div>
								<form role="form" action="modTraitementTrait.chu" method="post">
                                    <div class="row">
										<div class="card-body table-responsive">
												<div class="col-md-6 col-sm-12">
										<div class="panel-body">
											<%
											String id_trait = (String)session.getAttribute("idTrait");
											int  idTrait = Integer.parseInt(id_trait);
											TraitementDAO traitDAO = new TraitementDAO();
											Traitement examen = traitDAO.trouverTumeurById(idTrait);
											Date date = examen.getDate();
											SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
											SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy");
											String dateFormatee = formatDateJour.format(date);
											%>
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="dossier" value="<%=examen.getDossier().getId() %>">
		                                    </div>
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="idTrait" id="idTrait" value="<%=examen.getId()%>">
		                                    </div>
		                                    <div class="form-group">
	                                                <label for="" >Date de traitement :</label>
	                                                <input type="text" class="form-control" name="dateTrait" id="" value="<%=dateFormatee%>">
	                                            </div>
		                                    <div class="form-group">
	                                                <label for="" >Indication</label>
	                                                <input type="text" class="form-control" name="indication" id="" value="<%=examen.getIndication()%>"> 
	                                               
	                                            </div>
	                                            
	                                    	<div class="form-group">
													<label>Hopital:</label>
													
													<%
											            	HopitalDAO hopDAO = new HopitalDAO();
											            	List<Hopital> hopitaux = new ArrayList<>();
											            	hopitaux=hopDAO.listerLesHopitaux();
											            	System.out.println("hopitaux :"+hopitaux);
											            %>
											            
														<select class="form-control" name="hopital">
														<% 
				                                			for(Hopital hop : hopitaux ){
				                                		%>	
				                                			    <option value ="<%=hop.getId() %>"><%=hop.getHopital() %></option>
				                                		<% 
				                                			}
				                                		%>  
														</select>
													</div>
										
												<h1>Chirurgie</h1></div>
	                                    <div class="panel-body">
	                                    	
	                                    	<div class="form-group">
	                                                <label for="">en temps</label>
	                                                <input type="text" class="form-control" name="temps" id="" value="<%=examen.getChirurgie().getTemps() %>"> 
	                                               
	                                            </div>
	                                    	<div class="form-group">
	                                                <label for="" >Date:</label>
	                                                <input type="text" class="form-control" name="date" id="" value="<%=dateFormatee %>">
	                                            </div>
	                                       	<div class="form-group">
	                                                <label for="" >Service:</label>
	                                                <input type="text" class="form-control" name="service"  value="<%=examen.getChirurgie().getService() %>">
	                                            </div>
	                                       
	                                       
												<div class="form-group">
	                                                <label>Type d'exerèse</label>
	                                              
	                                                    <select class="form-control" name="typeExerese">
	                                                    <%
	                                                    TypeExereseDAO typeDAO = new TypeExereseDAO();
	                                                    List<TypeExerese> types = new ArrayList<>();
	                                                    types = typeDAO.listerTypeExerese();
	                                                    
	                                                    %>
	                                                        <%
	                                                        	for(TypeExerese type : types){
	                                                        %>
							                               <option value="<%=type.getId() %>"><%=type.getTypeExerese() %></option>
							                              <%
	                                                        	}
							                              %>
	                                                    </select>
	                                                </div>
	                                         
	                                            <div class="form-group">
	                                                <label>Elargie à:</label>
	                                              
	                                                    <select class="form-control" name="elargissement">
	                                                    <%
	                                                    ElargissementDAO elargDAO = new ElargissementDAO();
	                                                    List<Elargissement> elargies = new ArrayList<>();
	                                                    elargies = elargDAO.listerLesElargissement();
	                                                    %>
	                                                        <%
	                                                        	for(Elargissement elarg : elargies){
	                                                        %>
							                               <option value="<%=elarg.getId() %>"><%=elarg.getElargie() %></option>
							                              <%
	                                                        	}
							                              %>
	                                                    </select>
	                                                </div>
	                                           
	                                           <div class="form-group">
	                                                <label>Gestes Complémentaires:</label>
	                                                
	                                                    <select class="form-control" name="geste">
	                                                    <%
	                                                    GesteDAO gestDAO = new GesteDAO();
	                                                    List<Geste> gestes = new ArrayList<>();
	                                                    gestes = gestDAO.listerLesGeste();
	                                                    
	                                                    %>
	                                                        <%
	                                                        	for(Geste geste : gestes){
	                                                        %>
							                               <option value="<%=geste.getId() %>"><%=geste %></option>
							                              <%
	                                                        	}
							                              %>
	                                                    </select>
	                                                </div>
	                                           
	                                            <div class="form-group">
	                                                <label>RR scoring:</label>
	                                           
	                                                    <select class="form-control" name="scoring">
	                                                    <%
	                                                    RRscoringDAO scoringDAO = new RRscoringDAO();
	                                                    List<RRscoring> scoring = new ArrayList<>();
	                                                    scoring = scoringDAO.listerRRscoring();
	                                                    %>
	                                                        <%
	                                                        	for(RRscoring scor : scoring){
	                                                        %>
							                               <option value="<%=scor.getId() %>"><%=scor.getScoring() %></option>
							                              <%
	                                                        	}
							                              %>
	                                                    </select>
	                                                </div>
	                                       
												<div class="form-group">
	                                                <label for="" >Ref Ana-path:</label>
	                                                <input type="text" class="form-control" name="refChirg" value="<%=examen.getChirurgie().getRefAnaPath() %>">
	                                            </div>
	                                            <div class="form-group">
	                                                <label>Complication:</label>
	                                               
	                                                    <select class="form-control" name="complicationChirurg">
	                                                    <%
	                                                    ComplicationDAO compDAO = new ComplicationDAO();
	                                                    List<Complication> complications = new ArrayList<>();
	                                                    complications = compDAO.listerLesComplication();
	                                                    %>
	                                                        <%
	                                                        	for(Complication comp : complications){
	                                                        %>
							                               <option value="<%=comp.getId() %>"><%=comp.getComplication() %></option>
							                             <%} %>
	                                                    </select>
	                                                </div>
	                                            </div>
	                                        
	                                  </div>
											<div class="col-md-6 col-sm-12">
											<h1>Traitement Endoscopique</h1>
	                                    <div class="panel-body">
	                                    	
												<div class="form-group">
	                                                <label>Type d'intervention</label>
	                                               
	                                                    <select class="form-control" name="typeInterv">
	                                                    <%
	                                                    TypeInterventionDAO typeIntDAO = new TypeInterventionDAO();
	                                                    List<TypeIntervention> interventions = new ArrayList<>();
	                                                    interventions = typeIntDAO.listerTypeIntervention();
	                                                    %>
	                                                        <%
	                                                        	for(TypeIntervention interv : interventions){
	                                                        %>
							                               <option value="<%=interv.getId() %>"><%=interv.getIntervention() %></option>
							                             <%} %>
	                                                    </select>
	                                                </div>
	                                           
	                                            
	                                            
												<div class="form-group">
	                                                <label for="">Ref Ana-path:</label>
	                                                <input type="text" class="form-control" name="refTrait"  placeholder="degre" value="<%=examen.getTraitEndo().getRefAnaPath() %>">
	                                            </div>
	                                            <div class="form-group">
	                                                <label>Complication:</label>
	                                                
	                                                    <select class="form-control" name="complicationTrait">
	                                                     <%
	                                                    complications = compDAO.listerLesComplication();
	                                                    System.out.println("complications 2 :"+complications);
	                                                    %>
	                                                        <%
	                                                        	for(Complication comp : complications){
	                                                        %>
							                               <option value="<%=comp.getId() %>"><%=comp.getComplication() %></option>
							                             <%} %>
	                                                    </select>
	                                               
	                                            </div>
	                                        
	                                    </div>
									
										<h1>Chimiothérapie</h1>
	                                    <div class="panel-body">
											  <div class="form-group">
	                                                <label>Deroulement</label>
	                                               
	                                                    <select class="form-control" name="deroulementChim">
							                               <option value=""><%=Deroulement.ADJUVANTE %></option>
							                               <option value=""><%=Deroulement.NEO_ADJUVANTE%></option>
							                               <option value=""><%=Deroulement.PALLIATIVE %></option>
							                              
	                                                    </select>
	                                                </div>
	                                           
												<div class="form-group">
	                                                <label for="" >Date de début :</label>
	                                                <input type="text" class="form-control" name="dateDebutChim" id="" <c:if test="${not empty examen.getChimiotherapie()}"> value="<%=examen.getChimiotherapie().getDebut() %>" </c:if> >
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="">Date de fin:</label>
	                                                <input type="text" class="form-control" name="dateFinChim" id="" <c:if test="${not empty examen.getChimiotherapie()}"> value="<%=examen.getChimiotherapie().getFin() %>" </c:if>>
	                                            </div>
	                                            
	                                    </div>
									
										<h1>Radiothérapie</h1>
	                                    <div class="panel-body">
	                                    	<div class="form-group">
	                                                <label >Deroulement</label>
	                                               
	                                                    <select class="form-control" name="deroulementRadio">
	                                                   
							                               <option value=""><%=Deroulement.ADJUVANTE %></option>
							                               <option value=""><%=Deroulement.NEO_ADJUVANTE%></option>
							                               <option value=""><%=Deroulement.PALLIATIVE %></option>
							                              
	                                                    </select>
	                                               
	                                            </div>
												<div class="form-group">
	                                                <label for="">Date de début :</label>
	                                               
	                                                <input type="text" class="form-control" name="dateDebutRad" id="" <c:if test="${not empty examen.getRadiotherapie()}"> value="<%=examen.getRadiotherapie().getDebut() %>" </c:if>  >
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="" >Date de fin:</label>
	                                                <input type="text" class="form-control" name="dateFinRad" id="" <c:if test="${not empty examen.getRadiotherapie()}"> value="<%=examen.getRadiotherapie().getFin() %>" </c:if> >
	                                            </div>
	                                    </div>
							
														
									
										<div class="col-md-12">
								<button type="submit"
											class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button>
											</div>
										</div>
									</div> 
							</form>
                        </div>
						
                </div>		
               </div> 
				
				
				
        </div>
    </div>	
</body>

</html>