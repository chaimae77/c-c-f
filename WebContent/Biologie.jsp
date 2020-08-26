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
<title>Biologie</title>
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
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Génétique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Traitement</button></a>
                    </div>                       
                </div> -->
                  <div class="row">
                <%
										String id_Dossier = (String)session.getAttribute("idDossier");
										int  idDossier = Integer.parseInt(id_Dossier);
										DossierDAO dosDAO = new DossierDAO();
										DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
										int idPatient = dos.getPatient().getId();
									
									%>
				<div class="col-md-8 col-md-offset-2">
									
									<%
										IndividuDAO indDAO = new IndividuDAO();
										Individu patient = indDAO.trouverIndById(idPatient);
										List<Biologie> analyses = new ArrayList<>();
										analyses = dosDAO.listerBiologieParPatient(idPatient);
									%>
								<div class="panel-actions">
						<button type="button" 
						style="float: right; border: none;" onclick="location.href='ajoutBiologie.jsp?id=<%=dos.getId()%>'" ><i class="material-icons preced">add_circle_outline</i></button> 
                    			</div></br></br>
                    			
                                      <div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Examens Biologiques de <%=dos.getPatient() %></h4>
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
                                                         	for(Biologie e: analyses){
                                                         		Date date = e.getDataeAnalyse();
            													SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yyyy");
            													SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
            													String dateFormatee = formatDateJour.format(date);
                                                         %>
                                        		
                                                    </thead>
                                                     <tbody> 
                                                    <tr>
                                                    	<td>Analyse médical </td>
                                                     	<td>du <%=dateFormatee %></td> 
                                                     	<td><a href="detailBiologie.chu?id=<%=e.getId()%>" ><i class="material-icons" title="Détail de biologie">remove_red_eye</i></a> <a href="modBiologie.chu?id=<%=e.getId()%>" ><i class="material-icons " title="modifier biologie">edit</i></a></td> 
                                                        
                                                        </tr>             
                                                     </tbody>
                                                     <%		
                                        				}
                                        			 %> 
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
              </div> <!-- col -->
				
				
        </div>
    </div>	
</body>

</html>