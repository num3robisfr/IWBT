<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>jspOeuvre</title>     
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->     
                <%@include file="Sidebar.jsp" %>

                <div id="catalogue">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5">
                            <img class="img-fluid mx-auto d-block" src="${oeuvre.oeuUrlImage}" alt="${oeuvre.oeuTitre}">
                        </div>
                        <div class="col-5">
                            <h1 class="card-title">${oeuvre.oeuTitre}</h1>
                            <p><strong>${oeuvre.autNom}</strong>  <small>Date de parution : ${oeuvre.oeuDateParution}</small>
                            </p>

                            <div class="card bg-light mb-3 border-primary" style="max-width: 18rem;">
                                <div class="card-body">
                                    <h1 class="card-title text-danger text-center"><strong>${oeuvre.oeuPrix}€</strong></h1>
                                    
                                </div>
                                <div class="card-footer">
                                    <form action="Controller" method="get">
                                        <button type="submit" class="btn btn-primary mx-auto d-block" value="add" name="panier">Ajouter</button>
                                    </form>
                                </div>
                            </div>   

                        </div>
                        <div class="col-1"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10 text-justify">
                            <p>
                            <h3>Résumé: </h3><br>  
                            ${oeuvre.oeuResume} 
                            </p>
                        </div>
                        <div class="col-1"></div>
                    </div>
                    <hr>
                    <div class="row">


                        <div class="col-1"></div>
                        <div class="col-10">
                            <h3>Détails sur le produit</h3><br>
                            <p>
                                Nombre de page : ${oeuvre.oeuNbrePage}<br>
                                Auteur : ${oeuvre.autNom}<br>
                                Editeur : ${oeuvre.ediNom}<br>
                                ISBN : ${oeuvre.oeuIsbn}<br>
                                Moyenne des commentaires : 
                                <c:if test="${oeuvre.oeuMoyenneCmt == null}">
                                    pas de note 
                                </c:if>
                                <c:if test="${oeuvre.oeuMoyenneCmt != null}">
                                    ${oeuvre.oeuMoyenneCmt} (${oeuvre.oeuNbreCmt} commentaire(s) )
                                </c:if><br>    
                            </p>
                        </div>
                        <div class="col-1"></div>
                    </div>

                    <hr>
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-5">
                            <h3>Avis des Lecteurs</h3><br>
                            <c:if test="${oeuvre.oeuMoyenneCmt == null}">
                                pas de commentaire
                            </c:if>
                            <c:if test="${oeuvre.oeuMoyenneCmt != null}">
                                liste des commentaires en cours de construction
                            </c:if><br> 
                        </div>
                        <div class="col-1"></div>
                    </div>

                </div>

                <!--   
                <div id="couvoeuvre">
                    <img src="${oeuvre.oeuUrlImage}"/><br><br>
                ${oeuvre.oeuTitre}
                <br>
                <input type="submit" value="Ajouter au panier" name="addbook" />
                <div id="commentaire">
                ${oeuvre.oeuMoyenneCmt}<br>
                <c:if test="${oeuvre.oeuMoyenneCmt == null}">
                    PAS DE NOTE   
                </c:if>
                <c:if test="${oeuvre.oeuMoyenneCmt != null}">
                    SUR &nbsp ${oeuvre.oeuNbreCmt} &nbsp COMMENTAIRE(S)
                </c:if><br>
                ${oeuvre.oeuNbreCdc}&nbsp <3
            </div>
        </div>
                -->
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
