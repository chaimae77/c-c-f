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

<title>Examens Cliniques</title>
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
										int idPatient = dos.getPatient().getId();
									
									%>
                              
                        
                        	<%
										
										IndividuDAO indDAO = new IndividuDAO();
										Individu patient = indDAO.trouverIndById(idPatient);
										List<ExamenPostOp> examensPost = new ArrayList<>();
										examensPost = dosDAO.listerExamenPostOPParPatient(idPatient);
										 List<ExamenPreOp> examensPre = new ArrayList<>();
										 examensPre=dosDAO.listerExamenPreOpParPatient(idPatient);
										 List<ExamenPreOpAnormal> examensAnormal = new ArrayList<>();
										 examensAnormal =dosDAO.listerExamenPreOpAnormalParPatient(idPatient);
									%>
									
							<div class="col-md-8 col-md-offset-2">
                        			<button type="button" 
						style="float: right; border: none;" onclick="location.href='ajoutExamenClinique.jsp'" >
						<i class="material-icons preced">add_circle_outline</i></button> 
                    			</div></br></br>
                    			
                    		
                    		<div class="col-md-8 col-md-offset-2">
					<div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Examen Clinique Pré Opératoire de <%=patient.getPrenom()%> <%=patient.getNom() %></h4>
							</div>
						</div>
                                    <div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                         
                                                         <%
                                                         	for(ExamenPreOp e: examensPre){
                                                         		Date date = e.getDateExamen();
            													SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yyyy");
            													SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
            													String dateFormatee = formatDateJour.format(date);
                                                         %>
                                        		
                                                    </thead>
                                                     <tbody> 
                                                    <tr>
                                                    	<td>Examen clinique</td>
                                                     	<td>du <%=dateFormatee%></td> 
                                                     	<td><a href="consExamenCliniqueNormal.chu?id=<%=e.getId()%>" ><i class="material-icons" title="Détail de l'examen">remove_red_eye</i></a></td>
                                                        </tr>             
                                                     </tbody>
                                                     <%		
                                        				}
                                        			 %> 
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                        	
                        	<div class="col-md-8 col-md-offset-2">
					<div class="card">
                                         <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Examen Clinique Post Operatoire de <%=patient.getPrenom()%> <%=patient.getNom() %></h4>
							</div>
						</div>
                                     <div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                         
                                                         <%
                                                         	for(ExamenPostOp e: examensPost){
                                                         		Date date = e.getDateExamen();
            													SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yyyy");
            													SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
            													String dateFormatee = formatDateJour.format(date);	
                                                         %>
                                        		
                                                    </thead>
                                                     <tbody> 
                                                    <tr>
                                                    	<td>Examen clinique</td>
                                                     	<td>du <%=dateFormatee%></td> 
                                                     	<td><a href="consExamenCliniquePost.chu?id=<%=e.getId()%>" ><i class="material-icons" title="Détail de l'examen">remove_red_eye</i></a></td> 
                                                        
                                                        </tr>             
                                                     </tbody>
                                                     <%		
                                        				}
                                        			 %> 
                                                </table>
                                            </div>
                                     </div>
                 
				
             
                         <a href="modExamenClinique.chu?id=<%=dos.getPatient().getId()%>"> <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Modifier</button></a>
                </br></br></br>
                                    </div>
                               
											
						</div>			
                            </div> 
				
				
        </div>
   
   
</body>

</html>