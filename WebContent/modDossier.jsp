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

   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" />
<script src="js/jquery.min.js">
	
</script>
<script src="js/bootstrap.js">
	
</script>
	
    <title>Modifier un dossier</title>
    
    <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	


    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <div id="wrapper">
	<%@include file="enteteUt.jsp" %>

        

            <div class="container-fluid">
            	<%@include file="navbar.jsp"%>

				<div class="row">
				
											<% 
                                            	String id_Dossier = (String)session.getAttribute("idDos");
												int  idDossier = Integer.parseInt(id_Dossier);
												DossierDAO dosDAO = new DossierDAO();
                                            	DossierMedicale dos = dosDAO.trouverDossierById(idDossier);
                                            
												SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
												String dateFormatee = formatDateJour.format(dos.getDateCreation()); 
											%>
				<div class="col-md-12 col-lg-offset-0">
					<a class="back" href="listIndDoss.chu?id=<%=dos.getPatient().getFamille().getId()%>"><i class="material-icons preced">arrow_back</i></a>
				</div>
                   <div class=" col-lg-offset-2 col-md-8">
					<div class="card">
						<div class="card-header card-header-info card-header-icon">
							<div class="card-icon" style="float: none !important;">
								<h4>Modification du dossier de <%=dos.getPatient() %></h4>
							</div>
						</div> 
                        <div class="card-body table-responsive" >
                             <form class="form-horizontal" role="form" action="modifierTrait.chu" method="post">
                             				
											<div class="form-group">
                                                <label for="">Date de création :</label>
                                                  <input type="date" name="dateDossier" class="form-control" placeholder="<%=dateFormatee %>"  id="dateCreat">
                                                </div>
                                                <div class="form-group">
		                                         <input type="hidden" class="form-control" name="patient" value="<%=dos.getPatient().getId()%>"  style="width:250px">
		                                    </div>
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="idDossier" value="<%=dos.getId()%>"  style="width:250px">
		                                    </div>
                                                 <button type="submit"
								class="btn btn-purple waves-effect waves-light btnCardInfo">Modifier</button>
                                            
                                        </form>
                        </div>
						
                    </div> 
                </div>
				
			</div> 
				
            </div>
         
         </body>
        
	<%@include file="piedUt.jsp" %>
    </div>
    <!-- /#wrapper -->
    
    </div>
  
    
	
</html>