<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.entities.*" %>
<%@ page import="beans.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Statut</title>

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
	<%@include file="enteteUt.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">
             <%@include file="navbar.jsp"%>
				<%
				String id_Dossier = (String)session.getAttribute("idDossier");
				int  idDossier = Integer.parseInt(id_Dossier);
				DossierDAO dosDAO = new DossierDAO();
				DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
				int idPatient = dos.getPatient().getId();				
				%>
                <!-- Page Heading
                <div class="row">
                  <h3 class="page-header" style="text-align:center">
                            <img class="img"  src="images\logo.png " width="" height="" alt="logo"/><small></small>
                   </h3> 
                   <h3 class="page-header" >
                            Consultation du dossier de <%=dos.getPatient() %> <small></small>
                   </h3> -->
                <!-- /.row -->
				<div class="row">

	<div class="col-lg-12 ">
                    <div class="panel-body">
                        <a href="statut.jsp"><button type="button" class="btn btn-info btn-rounded waves-effect waves-light m-b-5" style="width:100px">Statut</button></a>
                        <a href="ExamenClinique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:150px">Examen Clinique</button></a>
                        <a href="Endoscopie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Endoscopie</button></a>
                        <a href="AnaPathologie.jsp" ><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:200px">Anatomie Pathologique</button></a>
                        <a href="Imagerie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Imagerie</button></a>
						<a href="Biologie.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Biologie</button></a>
						<a href="Genetique.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Génétique</button></a>
						<a href="Traitement.jsp"><button type="button" class="btn btn-default btn-rounded waves-effect m-b-5" style="width:100px">Traitement</button></a>
                   </br></br></br>
                    </div>                       
                </div>
               
					<div class="col-md-4 col-md-offset-4">
								<div class="panel-actions">
						<button type="button" class="btn btn-info waves-effect waves-light btnCardInfo"
						style="float: right; border: none;" onclick="location.href='ajoutStatut.jsp'" >Ajouter</button>
                    			</div></br>
                                                     <div class="card">
                            <div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;"><h4>Statuts  de  <%=dos.getPatient() %></h4>
							</div>
						</div>
										 <div >
										 	<%StatutDAO statDAO = new StatutDAO();
											List<StatutCancereux> statuts = new ArrayList<>();
											statuts = statDAO.listerStatutParIndividu(idPatient);
											%>
                                                <div class="card-body table-responsive">
							<table class="table table-hover" id="idDataTable">
								<thead class="text-warning">
                                                        <tr>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                       
                                        		
                                                    </thead>
                                                     <tbody> 
                                                     <% for(StatutCancereux s :statuts){ %>
                                                    <tr>
                                                    	<td><%=s.getTypeStatut() %></td>
                                                     	<td><a href="detailStatut.chu?id=<%=s.getId()%>" ><i class="material-icons" title="Détail du statut">remove_red_eye</i></a>  <a  href="modStatut.chu?id=<%=s.getId()%>" ><i  class="material-icons " title="modifier le statut">edit</i></a></td> 
                                                        
                                                        </tr>             
                                                     </tbody>
                                                     <%		
                                        				}
                                        			 %> 
                                                </table>
                                            </div>
                                   
                                </div>	
                            </div> <!-- col -->
				
	</div> <!-- End row -->
				
            </div>
            <!-- /.container-fluid -->
			
        </div>
        <!-- /#page-wrapper -->
    
    </div>
    <!-- /#wrapper -->
    
    </div>
    </body>
    
	
</html>