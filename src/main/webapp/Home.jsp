<%@ page import="MVC.model.ChambreBeans" %>
<%@ page import="MVC.metier.Operation" %>
<%@ page import="MVC.metier.Chambre" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: fahof
  Date: 10/23/2022
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Dashboard</title>
</head>
<body class="text-center">
<%
        ChambreBeans chambres ;
        Operation op = new Operation();
        chambres = new ChambreBeans();
        chambres.setList(op.getAll());
%>
<header class="navbar  navbar-expand mx-auto mb-2">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="Image/logo_1.svg" alt="Cinque Terre"> </a>
        <nav class="nav navbar-nav align-items-center">
            <a class=" nav-link" href="Home.jsp" aria-label="lien Home">les chambres</a>
            <a class=" nav-link" href="Réservation.jsp" aria-label="lien Reservation">Réservation</a>
            <a class=" nav-link" href="Dashboard.jsp" aria-label="lien Logut">
                <img src="Image/logout.svg" class="img-circle" alt="Logut"></a>
        </nav>
    </div>
</header>
<div class="container d-flex w-100 h-75 p-1 mx-auto flex-column">
    <div class="card-title " style="margin-top: 62px!important;">
        <div class="btn btn-success" ><a class="type_chambre_link_id" href="#individuelle">individuelle</a> </div>
        <div class="btn btn-success" ><a class="type_chambre_link_id " href="#double">double</a></div>
        <div class="btn btn-success" ><a class="type_chambre_link_id" href="#triple">triple</a></div>
        <div class="btn btn-success" ><a class="type_chambre_link_id" href="#suite">suite</a></div>
    </div>
    <div class="mb-5" id="individuelle"></div>
    <h2 class="text-start  mt-3 mb-3" >individuelle</h2>
        <div class="row">
            <%
                Iterator<Chambre> list_individuelle = chambres.getList().iterator();
                while (list_individuelle.hasNext()){
                    Chambre ch_list_individuelle = list_individuelle.next();
                    if (ch_list_individuelle.getEtat_chambre()==0 && ch_list_individuelle.getType_chambre().equals("individuelle")){
            %>
            <div class="col-lg-6 mb-2  col-md-6 col-sm-12 text-center mb-3">
                <%
                    String str = ch_list_individuelle.getDbFileName();
                    String[] arrOfStr = str.split("\\+", 6);
                %>
                <div class="card">
                    <img class="card-img-top" src="images/<%=arrOfStr[0]%>" alt="Card image cap"  width="342" height="300" id="change_image<%=ch_list_individuelle.getId()%>">
                    <input type="hidden"  name="table_aimage<%=ch_list_individuelle.getId()%>" value="<%=str%>">
                    <div  class="d-flex ma_image_group_1 justify-content-around">
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 0)">image : 1 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 1)">image : 2 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 2)">image : 3 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 3)">image : 4 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 4)">image : 5 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_individuelle.getId()%>, 5)">image : 6 </button>
                    </div>
                    <div class="card-footer d-flex justify-content-evenly">
                        <strong> <%=ch_list_individuelle.getPrix()%>DH ====> 1Jour</strong>
                        <% if (ch_list_individuelle.getPromo()!= 0 )%>
                            <strong>promotion : <%=ch_list_individuelle.getPrix()%>%</strong>
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reserve<%=ch_list_individuelle.getId()%>">Reserve maintenant</a>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="reserve<%=ch_list_individuelle.getId()%>" tabindex="-1" aria-labelledby="reserve">
            <div class="modal-dialog">
                <div id='form' class="modal-content">
                        <h3 id="form__head" class="mb-4 ">Autres extras avec réservation de chambre</h3>

                        <form id="newform"  method="POST" class="needs-validation" action="reservation" novalidate>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="checkbox" name="le_petit_déjeuner" value="1" id="le_petit_déjeuner">
                                    <label class="form-check-label" for="le_petit_déjeuner">
                                        Le petit déjeuner : 12DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="déjeuner" name="déjeuner" value="1">
                                    <label class="form-check-label" for="déjeuner">
                                        Déjeuner : 20DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="dîner" name="dîner" value="1">
                                    <label class="form-check-label" for="dîner">
                                        Dîner : 10DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="fruits" name="fruits" value="1">
                                    <label class="form-check-label" for="fruits">Fruits : 13DH</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="musique" name="musique" value="1">
                                    <label class="form-check-label" for="musique">
                                        Musique : 9DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="spa" name="spa" value="1">
                                    <label class="form-check-label" for="spa">
                                        Spa : 24DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="massage" name="massage" value="1">
                                    <label class="form-check-label" for="massage">
                                        Massage : 13DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="soin" name="soin" value="1">
                                    <label class="form-check-label" for="soin">
                                        Soin : 8DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="excursion" name="Excursion" value="1">
                                    <label class="form-check-label" for="excursion">
                                        Excursion : 120DH
                                    </label>
                                </div>
                                <div class="form-group mt-1">
                                    <label for="residence_date<%=ch_list_individuelle.getId()%>">Date départ</label>
                                    <input type="datetime-local" class="form-control" name="residence_date" placeholder="Date départ" required id="residence_date<%=ch_list_individuelle.getId()%>"  onclick="setmin_date_residence_date(<%=ch_list_individuelle.getId()%>)"/>
                                </div>
                                <div class="form-group mt-1">
                                    <label for="exit_date<%=ch_list_individuelle.getId()%>"> Date d'arrivé</label>
                                    <input type="datetime-local" class="form-control" name="exit_date" placeholder="Date d'arrivé" required id="exit_date<%=ch_list_individuelle.getId()%>" onclick="setmin_date_exit_date(<%=ch_list_individuelle.getId()%>)"/>
                                </div>
                            </div>
                            <input type="hidden" name="id_chambre" value="<%=ch_list_individuelle.getId()%>">
                            <input type="hidden" name="id_user" value="<%=ch_list_individuelle.getId()%>">
                            <input type="hidden" name="Prix" value="<%=ch_list_individuelle.getPrix()%>">
                            <input type="hidden" name="days_reserve" value="" id="days_reserve">
                            <button name="reserve" type="submit" class=" mt-4 d-block w-100 btn btn-primary" onclick="return calculate_days(<%=ch_list_individuelle.getId()%>)">Validé</button>
                        </form>
                </div>
            </div>
            </div>
            <%
                     }
                }
            %>
        </div>
        <div class="mb-5" id="double"></div>
        <h2 class="text-start  mt-3 mb-3">double</h2>
        <div class="row">
            <%
                Iterator<Chambre> list_double = chambres.getList().iterator();
                while (list_double.hasNext()){
                    Chambre ch_list_double = list_double.next();
                    if (ch_list_double.getEtat_chambre()==0 && ch_list_double.getType_chambre().equals("double")){
            %>
            <div class="col-lg-6 mb-2  col-md-6 col-sm-12 text-center mb-3">
                <%
                    String aa = ch_list_double.getDbFileName();
                    String[] arrOfStraa = aa.split("\\+", 6);
                %>
                <div class="card">
                    <img class="card-img-top" src="images/<%=arrOfStraa[0]%>" alt="Card image cap" width="342" height="342" id="change_image<%=ch_list_double.getId()%>">
                    <input type="hidden"  name="table_aimage<%=ch_list_double.getId()%>" value="<%=aa%>">
                    <div  class="d-flex ma_image_group_1 justify-content-around">
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 0)">image : 1 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 1)">image : 2 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 2)">image : 3 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 3)">image : 4 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 4)">image : 5 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_double.getId()%>, 5)">image : 6 </button>
                    </div>
                    <div class="card-footer d-flex justify-content-evenly">
                        <strong> <%=ch_list_double.getPrix()%>DH ====> 1Jour</strong>
                        <% if (ch_list_double.getPromo()!= 0 )%>
                            <strong>promotion : <%=ch_list_double.getPrix()%>%</strong>
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservea<%=ch_list_double.getId()%>">Reserve maintenant</a>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="reservea<%=ch_list_double.getId()%>" tabindex="-1" aria-labelledby="reserve">
                <div class="modal-dialog">
                    <div id='forma' class="modal-content">
                        <h3 id="form__heada" class="mb-4 ">Autres extras avec réservation de chambre</h3>
                        <form id="newforma"  method="POST" class="needs-validation" action="Reservation" novalidate>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="checkbox" value="le_petit_déjeuner" id="le_petit_déjeunera">
                                    <label class="form-check-label" for="le_petit_déjeunera">
                                        Le petit déjeuner : 12DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="déjeunera" value="déjeuner">
                                    <label class="form-check-label" for="déjeunera">
                                        Déjeuner : 20DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="dînera" value="dîner">
                                    <label class="form-check-label" for="dînera">
                                        Dîner : 10DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="fruitsa" value="fruits">
                                    <label class="form-check-label" for="fruitsa">Fruits : 13DH</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="musiquea" value="musique">
                                    <label class="form-check-label" for="musiquea">
                                        Musique : 9DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="spaa" value="spa">
                                    <label class="form-check-label" for="spaa">
                                        Spa : 24DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="massagea" value="massage">
                                    <label class="form-check-label" for="massagea">
                                        Massage : 13DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="soina" value="soin">
                                    <label class="form-check-label" for="soina">
                                        Soin : 8DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="excursiona" value="Excursion">
                                    <label class="form-check-label" for="excursiona">
                                        Excursion : 120DH
                                    </label>
                                </div>

                            </div>
                            <input type="hidden" name="id_chambre" value="<%=ch_list_double.getId()%>">
                            <input type="hidden" name="id_user" value="<%=ch_list_double.getId()%>">
                            <button name="reserve" type="submit" class=" mt-4 d-block w-100 btn btn-primary">Validé</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    <div class="mb-5" id="triple"></div>
    <h2 class="text-start  mt-3 mb-3" >triple</h2>
        <div class="row" id="triple">
            <%
                Iterator<Chambre> list_triple = chambres.getList().iterator();
                while (list_triple.hasNext()){
                    Chambre ch_list_triple = list_triple.next();
                    if (ch_list_triple.getEtat_chambre()==0 && ch_list_triple.getType_chambre().equals("triple")){
            %>
            <div class="col-lg-6 mb-2  col-md-6 col-sm-12 text-center mb-3">
                <%
                    String aaa = ch_list_triple.getDbFileName();
                    String[] arrOfStraaa = aaa.split("\\+", 6);
                %>
                <div class="card">
                    <img class="card-img-top" src="images/<%=arrOfStraaa[0]%>" alt="Card image cap" width="342" height="342" id="change_image<%=ch_list_triple.getId()%>">
                    <input type="hidden"  name="table_aimage<%=ch_list_triple.getId()%>" value="<%=aaa%>">
                    <div  class="d-flex ma_image_group_1 justify-content-around">
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 0)">image : 1 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 1)">image : 2 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 2)">image : 3 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 3)">image : 4 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 4)">image : 5 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_triple.getId()%>, 5)">image : 6 </button>
                    </div>
                    <div class="card-footer d-flex justify-content-evenly">
                        <strong><%=ch_list_triple.getPrix()%>DH ====> 1Jour</strong>
                        <% if (ch_list_triple.getPromo()!= 0 )%>
                            <strong>promotion : <%=ch_list_triple.getPrix()%>%</strong>
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reserveb<%=ch_list_triple.getId()%>">Reserve maintenant</a>                    </div>
                </div>
            </div>
            <div class="modal fade" id="reserveb<%=ch_list_triple.getId()%>" tabindex="-1" aria-labelledby="reserve">
                <div class="modal-dialog">
                    <div id='formb' class="modal-content">
                        <h3 id="form__headb" class="mb-4 ">Autres extras avec réservation de chambre</h3>
                        <form id="newformb"  method="POST" class="needs-validation" action="Reservation" novalidate>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="checkbox" value="le_petit_déjeuner" id="le_petit_déjeunerb">
                                    <label class="form-check-label" for="le_petit_déjeunerb">
                                        Le petit déjeuner : 12DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="déjeunerb" value="déjeuner">
                                    <label class="form-check-label" for="déjeunerb">
                                        Déjeuner : 20DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="dînerb" value="dîner">
                                    <label class="form-check-label" for="dînerb">
                                        Dîner : 10DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="fruitsb" value="fruits">
                                    <label class="form-check-label" for="fruitsb">Fruits : 13DH</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="musiqueb" value="musique">
                                    <label class="form-check-label" for="musiqueb">
                                        Musique : 9DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="spab" value="spa">
                                    <label class="form-check-label" for="spab">
                                        Spa : 24DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="massageb" value="massage">
                                    <label class="form-check-label" for="massageb">
                                        Massage : 13DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="soinb" value="soin">
                                    <label class="form-check-label" for="soinb">
                                        Soin : 8DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="excursionb" value="Excursion">
                                    <label class="form-check-label" for="excursionb">
                                        Excursion : 120DH
                                    </label>
                                </div>

                            </div>
                            <input type="hidden" name="id_chambre" value="<%=ch_list_triple.getId()%>">
                            <input type="hidden" name="id_user" value="<%=ch_list_triple.getId()%>">
                            <button name="reserve" type="submit" class=" mt-4 d-block w-100 btn btn-primary">Validé</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    <div class="mb-5" id="suite"></div>
    <h2 class="text-start  mt-3 mb-3">suite</h2>
        <div class="row" id="suite">
            <%
                Iterator<Chambre> list_suite = chambres.getList().iterator();
                while (list_suite.hasNext()){
                    Chambre ch_list_suite = list_suite.next();
                    if (ch_list_suite.getEtat_chambre()==0 && ch_list_suite.getType_chambre().equals("suite")){
            %>
            <div class="col-lg-6 mb-2  col-md-6 col-sm-12 text-center mb-3">
                <%
                    String aaaa = ch_list_suite.getDbFileName();
                    String[] arrOfStraaaa = aaaa.split("\\+", 6);
                %>
                <div class="card">
                    <img class="card-img-top" src="images/<%=arrOfStraaaa[0]%>" alt="Card image cap" width="342" height="342" id="change_image<%=ch_list_suite.getId()%>">
                    <input type="hidden"  name="table_aimage<%=ch_list_suite.getId()%>" value="<%=aaaa%>">
                    <div  class="d-flex ma_image_group_1 justify-content-around">
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 0)">image : 1 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 1)">image : 2 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 2)">image : 3 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 3)">image : 4 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 4)">image : 5 </button>
                        <button class="images_11" onclick="get_list_image(<%=ch_list_suite.getId()%>, 5)">image : 6 </button>
                    </div>
                    <div class="card-footer d-flex justify-content-evenly">
                        <strong> <%=ch_list_suite.getPrix()%>DH ====> 1Jour</strong>
                        <% if (ch_list_suite.getPromo()!= 0 )%>
                        <strong>promotion : <%=ch_list_suite.getPrix()%>%</strong>
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reservec<%=ch_list_suite.getId()%>">Reserve maintenant</a>                    </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="reservec<%=ch_list_suite.getId()%>" tabindex="-1" aria-labelledby="reserve">
                <div class="modal-dialog">
                    <div id='formc' class="modal-content">
                        <h3 id="form__headc" class="mb-4 ">Autres extras avec réservation de chambre</h3>
                        <form id="newformc"  method="POST" class="needs-validation"action="Reservation"  novalidate>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline" >
                                    <input class="form-check-input" type="checkbox" value="le_petit_déjeuner" id="le_petit_déjeunerc">
                                    <label class="form-check-label" for="le_petit_déjeunerc">
                                        Le petit déjeuner : 12DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="déjeunerc" value="déjeuner">
                                    <label class="form-check-label" for="déjeunerc">
                                        Déjeuner : 20DH
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="dînerc" value="dîner">
                                    <label class="form-check-label" for="dînerc">
                                        Dîner : 10DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="fruitsc" value="fruits">
                                    <label class="form-check-label" for="fruitsc">Fruits : 13DH</label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="musiquec" value="musique">
                                    <label class="form-check-label" for="musiquec">
                                        Musique : 9DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="spac" value="spa">
                                    <label class="form-check-label" for="spac">
                                        Spa : 24DH
                                    </label>
                                </div>
                            </div>
                            <div class="form-group p-1">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="massagec" value="massage">
                                    <label class="form-check-label" for="massagec">
                                        Massage : 13DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="soinc" value="soin">
                                    <label class="form-check-label" for="soinc">
                                        Soin : 8DH
                                    </label>
                                </div>

                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="excursionc" value="Excursion">
                                    <label class="form-check-label" for="excursionc">
                                        Excursion : 120DH
                                    </label>
                                </div>

                            </div>
                            <input type="hidden" name="id_chambre" value="<%=ch_list_suite.getId()%>">
                            <input type="hidden" name="id_user" value="<%=ch_list_suite.getId()%>">
                            <button name="reserve" type="submit" class=" mt-4 d-block w-100 btn btn-primary">Validé</button>
                        </form>
                    </div>
                </div>
            </div>

            <%
                    }
                }
            %>
        </div>
    <%--    <?php  endif;--%>
<%--                   endforeach; ?>--%>

</div>

</body>
<script src="js/bootstrap.min.js"></script>
<script src="js/vol-reserve.js"></script>

</html>
