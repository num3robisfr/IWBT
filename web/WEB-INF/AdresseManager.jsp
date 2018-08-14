<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - Gestion des adresses du compte</title>     
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <%@include file="Sidebar2.jsp" %>
                <div id="catalogue">
                    <div class="row" style="height: 20px;">

                    </div>
                    <h1>Vos Adresses</h1>
                    <div class="row">
                        <div class="col-md-4 flex flex-column align-items-center justify-content-center" style="min-width: 250px;">
                            <div class="card border-grey" style="height: 245px;">
                                <a href="#" class="btn btn-adr">
                                    <h1 class="btn btn-adr">+</h1>
                                    <p class="btn btn-adr">Ajouter une adresse</p>
                                </a> 
                            </div>
                        </div>
                        <c:if test="${adrfac != null}">

                            <div class="col-md-4" style="min-width: 250px;">
                                <div class="card border-grey" style="height: 245px;">
                                    <div class="card-header bg-transparent"><small>Adresse de ${adrfac['type']}</small></div>
                                    <div class="card-body text-dark">
                                        <p class="card-text">
                                            <strong>${adrfac['genre']} ${adrfac['nom']} ${adrfac['prenom']}</strong>
                                            <br>
                                            <small>
                                                ${adrfac['adresse']}
                                                <br>

                                                ${adrfac['codePostal']} ${adrfac['ville']}
                                            </small>
                                        </p>
                                        <div class="row" style="padding-top: 45px; padding-left: 15px">
                                            <a href="#">Modifier</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${adrliv != null}">

                            <div class="col-md-4" style="min-width: 250px;">
                                <div class="card border-grey" style="height: 245px;">
                                    <div class="card-header bg-transparent"><small>Adresse de ${adrliv['type']}</small></div>
                                    <div class="card-body text-dark">
                                        <p class="card-text">
                                            <strong>${adrliv['genre']} ${adrliv['nom']} ${adrliv['prenom']}</strong>
                                            <br>
                                            <small>
                                                ${adrliv['adresse']}
                                                <br>

                                                ${adrliv['codePostal']} ${adrliv['ville']}
                                            </small>
                                        </p>
                                        <div class="row" style="padding-top: 45px; padding-left: 15px">
                                            <a href="#">Modifier</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>

