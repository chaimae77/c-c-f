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
	
   <title>Dossiers médicaux</title>

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
				<div class="row">
						<div class="col-md-8 col-md-offset-2">
						<div class="card">
							<div class="card-header card-header-info card-header-icon">
						<div class="card-icon" style="float: none !important;"><h4>Création d'un nouveau dossier</h4></div></div>
                        <div class="card-body table-responsive">
                             <form class="form-horizontal" role="form" action="ajoutDossier.chu" method="post">
											<div class="form-group">
                                                <label for="">Date de création:</label>
                                                  <input type="date" name="dateDossier" placeholder="jj/mm/aaaa" class="form-control" id="dateCreat">
                                                </div>
                                           
                                            	<%
                                            	String idInd= (String)session.getAttribute("Individu");
                                            	int idIndividu =Integer.parseInt(idInd);
                                            	
											%>
		                                    <div class="form-group">
		                                         <input type="hidden" class="form-control" name="patient" value="<%=idIndividu %>"  style="width:250px">
		                                    </div>
                                            
                                                  <button type="submit" class="btn btn-info waves-effect waves-light btnCardInfo">Enregistrer</button>
                                            
                                        </form>
                        </div><!-- panel-body -->
						
                    </div> <!-- panel -->
                </div>

				</div> <!-- End row -->
				
            </div>
            <!-- /.container-fluid -->
			
        </div>
        <!-- /#page-wrapper -->
        
	<%@include file="piedUt.jsp" %>
    </div>
    <!-- /#wrapper -->
    

    </body>
    
	
</html>
    
	