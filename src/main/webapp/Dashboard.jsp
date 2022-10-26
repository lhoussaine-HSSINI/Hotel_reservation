<%@ page import="MVC.model.ChambreBeans" %>
<%@ page import="MVC.metier.Chambre" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="MVC.metier.Operation" %><%--
  Created by IntelliJ IDEA.
  User: fahof
  Date: 10/16/2022
  Time: 12:34 PM
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
    ChambreBeans  chambres ;
    if (request.getAttribute("modele") != null)
    { chambres = (ChambreBeans) request.getAttribute("modele");}
    else
    {
        Operation op = new Operation();
        chambres = new ChambreBeans();
        chambres.setList(op.getAll());
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
                <img src="Image/logout.svg" class="img-circle" alt="Logut"></a>
        </nav>
    </div>
</header>
<div class="container d-flex w-100 h-75 p-1 mx-auto flex-column">
    <!-- start tableau de vol -->
        <div class="card text-center" style="margin-top: 62px!important;">
            <!-- <div class="d-flex justify-content-evenly mt-1 mb-1">  -->
            <a href="#" class="bg_btn_ajouter_passager btn bg_btn_add_vol  btn-sm d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#ajouter_chambre" aria-label="#ajouter_chambre" >
                <i class="fa-solid fa-plus" id="passager_plus"></i> Chambre
            </a>
            <!-- start Modal ajouter chambre-->
            <div class="modal fade" id="ajouter_chambre" aria-hidden="true">
                <div class="modal-dialog">
                    <div id='form' class="modal-content">
                        <h3 id="form__head" class="mt-1 ">Ajouter un chambre</h3>
                        <form   method="POST" action="Dashboard" id="newform"  class="needs-validation" enctype="multipart/form-data" novalidate >
                            <div class="form-group mt-2">
                                <label> Type chambre </label>
                                <select class="form-select mt-1" aria-label="Default select example" name="type_chambre">
                                    <option selected hidden>Open this select menu</option>
                                    <option value="individuelle">individuelle</option>
                                    <option value="double">double</option>
                                    <option value="triple">triple</option>
                                    <option value="suite">suite</option>
                                </select>
                            </div>
                            <div class="form-group mt-2">
                                <label>Prix</label>
                                <input type="number" class="form-control mt-1" name="prix" placeholder="Prix" required/>
                            </div>
                            <div class="form-group mt-2">
                                <label>Promo</label>
                                <input type="number" class="form-control mt-1" name="promo"  placeholder="Promo" required/>
                            </div>
                            <div class="d-flex flex-wrap justify-content-center">
                                <div class="form-group mt-2  d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 1</small>
                                    <input type="file" class="form-control mt-1 " style ="width: 70%;font-size: smaller;" name="file_1"  required/>
                                </div>
                                <div class="form-group mt-2  d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 2</small>
                                    <input type="file" class="form-control mt-1" style ="width: 70%; font-size: smaller;" name="file_2"  required/>
                                </div>
                                <div class="form-group mt-2  d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 3</small>
                                    <input type="file" class="form-control mt-1" style ="width: 70%; font-size: smaller;" name="file_3"  required/>
                                </div>
                                <div class="form-group mt-2 d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 4</small>
                                    <input type="file" class="form-control mt-1" style ="width: 70%; font-size: smaller;" name="file_4"  required/>
                                </div>
                                <div class="form-group mt-2 d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 5</small>
                                    <input type="file" class="form-control mt-1" style ="width: 70%; font-size: smaller;" name="file_5"  required/>
                                </div>
                                <div class="form-group mt-2  d-flex flex-column align-items-center" style="width: 26%;">
                                    <small>image : 6</small>
                                    <input type="file" class="form-control mt-1" style ="width: 70%; font-size: smaller;" name="file_6"  required/>
                                </div>
                            </div>
                            <input type="hidden" name="operation_add" value="add">
                            <button name='Add_chambre' type="submit" class="mt-2 btn btn-primary">Ajouter</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- end modal ajouter chambre -->

            <!-- </div> -->
            <div class="card-header">
                les chambres
            </div>
            <div class="card-body  " id="card-body">
                <!-- <h5 class="card-title">Special title treatment</h5> -->
                <div class="table-responsive">
                    <table class="table caption-top">
                        <!-- <caption>List of users</caption> -->
                        <thead>
                            <tr>
                                <th scope="col">Chambre</th>
                                <th scope="col">type chambre</th>
<%--                                <th scope="col">Photo</th>--%>
                                <th scope="col">Prix</th>
                                <th scope="col">Promo</th>
                                <th scope="col">état de la chambre</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            Iterator<Chambre> list = chambres.getList().iterator();
                            while (list.hasNext()){
                                Chambre ch = list.next();

                        %>

                            <tr>
                                <td class="td_table_vol" scope="row" class="id_reservation"><%=ch.getId() %></td>
                                <td class="td_table_vol"><%=ch.getType_chambre() %></td>
<%--                                <td class="td_table_vol"><%=ch.getId()  %></td>--%>
                                <td class="td_table_vol"><%=ch.getPrix() %>DH</td>
                                <td class="td_table_vol"><%=ch.getPromo() %>%</td>
                                <td class="td_table_vol"> <%=ch.getEtat_chambre()!=0 ?  "Plein": "Vide" %> </td>
                                <td class="d-flex flex-row align-items-center justify-content-center">
                                    <a href="#"  data-bs-toggle="modal"  aria-label="#" data-bs-target="#delete<%=ch.getId() %>">
                                    <i class="fa-solid fa-trash-can"></i>
                                    </a>
                                    <a href="#" class="btn_voir_ma_reserve" data-bs-toggle="modal" data-bs-target="#info<%=ch.getId() %>"   aria-label="#" >
                                    <i class="fas fa-eye"></i>
                                    </a>
                                    <a data-bs-toggle="modal"  aria-label="#" data-bs-target="#edit_chambre<%=ch.getId() %>"  href="#">
                                    <i class="fas fa-edit"></i></a>
                                </td>
                            </tr>
                        <!-- start Modal delete information reservation-->
                        <div class="modal fade" id="delete<%=ch.getId() %>" aria-hidden="true">
                            <div class="modal-dialog">
                                <!-- start test card information de vol -->
                                <div id='form' class="modal-content">
                                    <h3 id="form__head" class="mb-4 ">supprimer chambre</h3>
                                    <form id="newform"  method="POST" class="needs-validation" action="Dashboard">
                                        <input type="hidden" name="id" value="<%=ch.getId()%>">
                                        <input type="hidden" name="action" value="delete">
                                        <div class="d-flex flex-row justify-content-evenly">
                                            <button name="delete_vol" type="submit" class="btn btn-primary">Oui</button>
                                            <button name="submit_non_delete" type="button" class="btn btn-primary bg-danger" data-bs-dismiss="modal" aria-label="Close">Non</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- end   card information reservation -->
                            </div>
                        </div>
                        <!-- end modal delete reservation modal -->
                    <%--=======================================================================================================================================================--%>
                        <!-- start Modal edit chambre-->
                        <div class="modal fade" id="edit_chambre<%=ch.getId() %>" aria-hidden="true">
                            <div class="modal-dialog">
                                <div id='form' class="modal-content">
                                    <h3 id="form__head" class="mt-1 ">Modifier un chambre</h3>
                                    <form   method="POST" action="Dashboard" id="newform"  class="needs-validation" novalidate >
                                        <div class="form-group mt-2">
                                            <label> Type chambre </label>
                                            <select class="form-select mt-1" aria-label="Default select example" name="type_chambre_edit">
                                                    <option  hidden>Open this select menu</option>
                                                    <option  value="individuelle" <%=ch.getType_chambre().equals("individuelle") ? "selected" : "" %>>individuelle</option>
                                                    <option  value="double" <%=ch.getType_chambre().equals("double") ? "selected" : "" %>>double</option>
                                                    <option  value="triple" <%=ch.getType_chambre().equals("triple") ? "selected" : "" %>>triple</option>
                                                    <option  value="suite" <%=ch.getType_chambre().equals("suite") ? "selected" : "" %> >suite</option>
                                            </select>
                                        </div>
                                        <div class="form-group mt-2">
                                            <label>Prix</label>
                                            <input type="number" class="form-control mt-1" name="prix_edit" placeholder="Prix" value="<%=ch.getPrix() %>" required/>
                                        </div>
                                        <div class="form-group mt-2">
                                            <label>Promo</label>
                                            <input type="number" class="form-control mt-1" name="promo_edit"  placeholder="Promo"  value="<%=ch.getPromo() %>" required/>
                                        </div>
                                        <input type="hidden" name="operation_edit" value="edit">
                                        <input type="hidden" name="id_edit" value="<%=ch.getId() %>">
                                        <button name='enregistrer_chambre' type="submit" class="mt-2 btn btn-primary">enregistrer</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- end modal edit chambre -->
                    <%--=======================================================================================================================================================--%>
                        <!-- start modal info chambre -->
                        <!-- Modal -->
                        <div class="modal fade" id="info<%=ch.getId() %>"  aria-hidden="true">

                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">chambre  N° : <%=ch.getId() %></h5>
                                        <button type="button" class="btn btn-primary bg-danger" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                            <div class="container table table-striped">
                                                <div class="row" id="aaa">
                                                    <div class="col">
                                                        Type : <%=ch.getType_chambre() %>
                                                    </div>
                                                    <div class="col">
                                                        Prix : <%=ch.getPrix() %>
                                                    </div>
                                                    <div class="col">
                                                        état : <%=ch.getEtat_chambre()!=0 ?  "Plein": "Vide" %>
                                                    </div>
                                                    <div class="col">
                                                        Promo : <%=ch.getPromo() %>%
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <%
                                        String str = ch.getDbFileName();
                                        String[] arrOfStr = str.split("\\+", 6);
                                    %>
                                    <img class="card-img-top" src="images/<%=arrOfStr[0]%>" alt="Card image cap" id="change_image<%=ch.getId()%>">
                                    <input type="hidden"  name="table_aimage<%=ch.getId()%>" value="<%=str%>">
                                    <div  class="d-flex ma_image_group justify-content-around">
                                        <button id="images_1" onclick="get_list_image(<%=ch.getId()%>, 0)">image : 1 </button>
                                        <button id="images_2" onclick="get_list_image(<%=ch.getId()%>, 1)">image : 2 </button>
                                        <button id="images_3" onclick="get_list_image(<%=ch.getId()%>, 2)">image : 3 </button>
                                        <button id="images_4" onclick="get_list_image(<%=ch.getId()%>, 3)">image : 4 </button>
                                        <button id="images_5" onclick="get_list_image(<%=ch.getId()%>, 4)">image : 5 </button>
                                        <button id="images_6" onclick="get_list_image(<%=ch.getId()%>, 5)">image : 6 </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end modal info chambre -->
                    <%--=======================================================================================================================================================--%>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</div>
</body>
<script src="js/bootstrap.min.js "></script>
<script src="js/vol-reserve.js "></script>
</html>
