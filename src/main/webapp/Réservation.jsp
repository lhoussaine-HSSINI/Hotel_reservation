<%@ page import="MVC.model.ReservationBeans" %>
<%@ page import="MVC.metier.Operation_reservation" %>
<%@ page import="MVC.metier.Reservation" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="MVC.metier.Operation_co_chambre" %>
<%@ page import="MVC.model.Co_chambreBeans" %>
<%@ page import="MVC.metier.Co_chambre" %><%--
  Created by IntelliJ IDEA.
  User: fahof
  Date: 10/21/2022
  Time: 9:25 PM
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
  <meta http-equiv="Cache-control" content="public">
  <link rel="stylesheet"  href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Oswald" rel=“stylesheet”>
  <link rel="apple-touch-icon" sizes="180x180" href="#">
  <title>Réservation</title>

</head>

<body class="text-center ">
<%
    ReservationBeans reservations ;
    Co_chambreBeans co_chambres ;
    Operation_co_chambre op_co = new Operation_co_chambre();
    co_chambres = new Co_chambreBeans();
    if (request.getAttribute("modele") != null)
    { reservations = (ReservationBeans) request.getAttribute("modele");}
    else
    {
        Operation_reservation op = new Operation_reservation();
        reservations = new ReservationBeans();
        reservations.setList_reservation(op.getAll_reservation());


    }
%>
<header class="navbar  navbar-expand mx-auto mb-2 ">
  <div class="container ">
    <a class="navbar-brand" href="Dashboard">
      <img src="Image/logo_1.svg" alt="Cinque Terre"> </a>
    <nav class="nav navbar-nav align-items-center">
        <a class="nav-link" href="Dashboard.jsp" aria-label="lien Home">les chambres</a>
<%--        <a class="nav-link" href="Dashboard.jsp" aria-label="lien Reservation">Bénéfices</a>--%>
        <a class="nav-link" href="Réservation.jsp" aria-label="lien Reservation">Réservation</a>
        <a class="nav-link" href="Dashboard.jsp" aria-label="lien Logut">
            <img src="Image/logout.svg" class="img-circle" alt="Logut">
        </a>
    </nav>
  </div>
</header>
<div class="container d-flex w-100 h-75 p-1 mx-auto flex-column">
  <!-- start tableau de reservation -->
  <div class="card text-center" style="margin-top: 62px!important;">

    <a href="toutreservation.jsp" class=" btn bg_btn_tout_passager bg_btn_ajouter_passager btn-sm d-flex align-items-center" aria-label="lien Passageres" >
      <i id="passager_plus" class="mt-1 fas fa-eye"></i> cochambres
    </a>
    <!-- </div> -->
    <div class="card-header">
      reservation
    </div>
    <div class="card-body " id="card-body">
      <div class="table-responsive">
        <table class="table caption-top">
          <thead >
          <tr>
            <th scope="col">#</th>
            <th scope="col">nom</th>
            <th scope="col">Prénom</th>
<%--            <th scope="col">Nombre placce</th>--%>
            <th scope="col">Action</th>
          </tr>
          </thead>
          <tbody>
          <%
              Iterator<Reservation> list = reservations.getList_reservation().iterator();
              while (list.hasNext()){
                  Reservation res = list.next();

          %>
          <tr>
            <th scope="row" class="id_reservation"><%=res.getId() %></th>
            <td><%=res.getNom() %></td>
            <td><%=res.getPrenom() %></td>
<%--            <td><%=res.getNumbre_persone() %></td>--%>
            <td class="d-flex flex-row align-items-center justify-content-center">
<%--              data-bs-target="#reserve<?php echo $value["id"];?>"--%>
              <a class="btn bg_btn_ajouter_passager btn-sm d-flex align-items-center"  data-bs-toggle="modal" data-bs-target="#reserve<%=res.getId() %>"  aria-label="hhh" href="#">
              <i id="passager_plusa" class="mt-1 fas fa-eye"></i> cochambres </a>
            </td>
            <!-- start card information reservation modal-->

            <!-- Modal view information reservation-->
<%--            id="reserve<?php echo $value["id"];?>"--%>
            <div class="modal fade" id="reserve<%=res.getId() %>" tabindex="-1" aria-labelledby="reservation" aria-hidden="true">
            <div class="modal-dialog">
              <!-- start test card information de vol -->
              <div class="card text-center  mt-3">
                <div class="card-header">
                  perseon de reservation
                </div>
                <div class="card-body ">
                    <%
                        co_chambres.setList_co_chambre(op_co.getAll_co_chambre_use_id(res.getId()));
                        Iterator<Co_chambre> list_co_chambre = co_chambres.getList_co_chambre().iterator();
                        while (list_co_chambre.hasNext()){
                            Co_chambre co = list_co_chambre.next();

                    %>
                  <div>
                        <h6>==============================================</h6>
                        <span>Nom :</span> <%=co.getNom_co_chambre()%> <br>
                        <span>Prénom : </span> <%=co.getPrénom_co_chambre()%>  <br>
                        <span>Cin : </span> <%=co.getCin_co_chambre()%>  <br>
                        <span>Date de naissance : </span> <%=co.getDate_de_naissance_co_chambre()%>  <br>
                  </div>
                    <%
                        }
                    %>
                </div>

              </div>
              <!-- end   card information reservation -->
            </div>
      </div>
      <!-- end card information reservation modal -->

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
<!--<script src="js/vol-reserve.js "></script>-->
<script>

</script>

</html>
