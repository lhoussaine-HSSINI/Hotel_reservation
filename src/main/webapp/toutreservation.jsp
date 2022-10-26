<%@ page import="MVC.model.Co_chambreBeans" %>
<%@ page import="MVC.metier.Operation_co_chambre" %>
<%@ page import="MVC.metier.Co_chambre" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: fahof
  Date: 10/21/2022
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="application-name" content="FAHO">
    <meta name="author" content="lhoussaine hssini">
    <meta name="description" content="Avec nous, vous voyagerez confortablement">
    <meta name="Keywords" content="VOL, vol, reservation">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Oswald" rel=“stylesheet”>
    <link rel="apple-touch-icon" sizes="180x180" href="#">
    <title>Cochambres</title>
</head>

<body class="text-center ">

<%
    Co_chambreBeans co_chambres ;
    if (request.getAttribute("modele") != null)
    { co_chambres = (Co_chambreBeans) request.getAttribute("modele");}
    else
    {
        Operation_co_chambre op = new Operation_co_chambre();
        co_chambres = new Co_chambreBeans();
        co_chambres.setList_co_chambre(op.getAll_co_chambre());
    }
%>

<header class="navbar  navbar-expand mx-auto mb-2">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="Image/logo_1.svg" alt="Cinque Terre"> </a>
        <nav class="nav navbar-nav align-items-center">
            <a class="  nav-link" href="Dashboard.jsp" aria-label="lien Home">les chambres</a>
<%--            <a class=" nav-link" href="Dashboard.jsp" aria-label="lien Reservation">Bénéfices</a>--%>
            <a class=" nav-link" href="Réservation.jsp" aria-label="lien Reservation">Réservation</a>
            <a class=" nav-link" href="Dashboard.jsp" aria-label="lien Logut">
                <img src="Image/logout.svg" class="img-circle" alt="Logut">
            </a>
        </nav>
    </div>
</header>
<div class="container d-flex w-100 h-75 p-1 mx-auto flex-column">
    <!-- start tableau de passagéres -->
    <div class="card text-center" style="margin-top: 62px!important;">
        <a href="Réservation.jsp" class=" btn bg_btn_tout_passager bg_btn_ajouter_passager btn-sm d-flex align-items-center" aria-label="lien Reservation" >
            <i id="passager_plus" class="mt-1 fas fa-eye"></i> Réservation
        </a>
        <div class="card-header">
            cochambres
        </div>
        <div class="card-body" id="card-body">
            <!-- <h5 class="card-title">Special title treatment</h5> -->
            <div class="table-responsive">
                <table class="table caption-top">
                    <!-- <caption>List of users</caption> -->
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nom</th>
                        <th scope="col">Prénom</th>
                        <th scope="col">Cin</th>
                        <th scope="col">Date_de_naissance</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        Iterator<Co_chambre> list = co_chambres.getList_co_chambre().iterator();
                        while (list.hasNext()){
                            Co_chambre co = list.next();
                    %>
                    <tr>
                        <th scope="row" class="id_reservation"><%=co.getId_co_chambre()%></th>
                        <td><%=co.getNom_co_chambre()%></td>
                        <td><%=co.getPrénom_co_chambre()%></td>
                        <td><%=co.getCin_co_chambre()%></td>
                        <td><%=co.getDate_de_naissance_co_chambre()%></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end tableau de reservation -->
</div>


</body>

<script src="js/bootstrap.min.js "></script>
<script src="js/vol-reserve.js "></script>
<script>

</script>

</html>
