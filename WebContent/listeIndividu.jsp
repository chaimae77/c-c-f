z<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

    <title>Consultation</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet'
        type='text/css'>

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assetss/js/common/jquery.min.js"></script>
    <script src="assetss/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>

    <div id="wrapper">
        <%@include file="enteteUt.jsp" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    
                    <h3 class="page-header" style="text-align:center">
                        <img class="img" src="images\logo.png " width="" height="" alt="logo" /><small></small>
                    </h3>
                    <%
                        String id_Famille = (String)session.getAttribute("idFamille");
						int  idFamille = Integer.parseInt(id_Famille);
						FamilleDAO famDAO = new FamilleDAO();
						Famille famille= famDAO.trouverFamilleById(idFamille);
						IndividuDAO indDAO = new IndividuDAO();
						List<Individu> individus = indDAO.listIndividuByFamille(idFamille);
                        %>
                    <div class="col-md-10 col-lg-offset-1">
                        <h3 class="page-header">
                            Consultation<small></small>
                        </h3>
                    </div>
                    <!-- <div class="panel-actions">
                                <button onclick="location.href='ajoutIndividu.jsp?id=<%=idFamille  %>'" type="button"
                                    class="btn btn-info btn-sm pull-right">
                                    Ajouter</button>
                            </div></br> -->


                    <!-- <div class="row"> -->
                    <div class="col-lg-12">
                        <div class="panel-actions">
                            <button type="button" class="btn btn-info btn-sm pull-right" data-toggle="modal"
                                data-target="#myModal">Ajouter</button>
                        </div>
                        </br>
                    </div>
                    <!-- </div> -->

                    <!-- <div class="panel panel-default"> -->

                </div> <!-- End row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-info card-header-icon">
                                <div class="card-icon" style="float: none !important;">
                                    <!-- <div class="panel-heading"> -->
                                    <h4>Liste des individus de la famille
                                        <%=famille.getNomFamille() %>
                                    </h4>
                                </div>
                            </div>

                            <div class="card-body table-responsive">
                                <table class="table table-hover" id="idDataTable">
                                    <thead class="text-warning">
                                        <tr>
                                            <th></th>
                                            <th>Nom</th>
                                            <th>Prenom</th>
                                            <th>Date de Naissance</th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
												int i=1;
												
												for(Individu ind : individus){	
													Date date = ind.getDateNaissance();
													SimpleDateFormat sdf = new SimpleDateFormat ("dd/MM/yyyy");
													SimpleDateFormat formatDateJour = new SimpleDateFormat("dd/MM/yyyy"); 
													String dateFormatee = formatDateJour.format(date); 
				                               %>
                                        <tr>
                                            <td><%=i %></td>
                                            <td><%=ind.getNom()%></td>
                                            <td><%=ind.getPrenom()%></td>
                                            <td><%=dateFormatee%></td>
                                            <td><a href="suppInd.chu?id=<%=ind.getId()%>"
                                                    onclick="return(confirm('Etes-vous s�r de vouloir supprimer cet individu?'));">
                                                    <i class="fa fa-times"> </i> Supprimer </a> <a
                                                    href="modIndividu.chu?id=<%=ind.getId()%>"><i
                                                        class="fa fa-pencil-square-o"></i> Modifier </a>
                                                <a href="compInd.chu?id=<%=ind.getId()%>"><i
                                                        class="fa fa-pencil-square-o"></i>
                                                    Compl&eacute;ter
                                                    info</a></td>
                                        </tr>

                                        <% 
													i++;
                                        			}
												
													%>
                                    </tbody>
                                </table>
                            </div><!-- panel-body -->

                        </div>
                    </div>
                </div> <!-- End row -->




            </div><!-- /.container-fluid -->
        </div><!-- /#page-wrapper -->
    </div> <!-- /#wrapper -->
</body>

<%@include file="piedUt.jsp" %>

</html>