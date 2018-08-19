<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <c:if test="${confirmation == 'ok'}">
                        <p>Veuillez sélectionner vos adresses de facturation et de livraison</p>
                    </c:if>
                    <div class="row">
                        <div class="col-md-4 flex flex-column align-items-center justify-content-center" style="min-width: 250px; margin-top: 15px; margin-bottom: 15px;">
                            <div class="card border-grey" style="height: 245px;">
                                <a href="Controller?Adresse=Add" class="btn btn-adr">
                                    <h1 class="btn btn-adr">+</h1>
                                    <p class="btn btn-adr">Ajouter une adresse</p>
                                </a> 
                            </div>
                        </div>
                        <c:if test="${adrfac != null}">
                            <c:forEach items="${adrfac}" var="p">
                                <div class="col-md-4" style="min-width: 250px; margin-top: 15px; margin-bottom: 15px;">
                                    <div class="card border-grey" style="height: 245px;">
                                        <div class="card-header bg-transparent"><small>Adresse de ${p.type}</small></div>
                                        <div class="card-body text-dark">
                                            <p class="card-text">
                                                <strong>${p.genre} ${p.nom} ${p.prenom}</strong>
                                                <br>
                                                <small>
                                                    ${p.adresse}
                                                    <br>

                                                    ${p.codePostal} ${p.ville}
                                                </small>
                                            </p>
                                            <c:if test="${confirmation == 'notok'}">
                                                <div class="row" style="padding-top: 45px; padding-left: 15px">
                                                    <form action="Controller" method="post">
                                                        <input type="hidden" name="cliId" value="${numClient}">
                                                        <input type="hidden" name="adrId" value="${p.id}">
                                                        <input type="hidden" name="type" value="facturation">
                                                        <button class="btn btn-link" type="submit" name="Adresse" value="Mod">Modifier</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <c:if test="${confirmation == 'ok'}">
                                                <div class="row" style="padding-top: 45px; padding-left: 15px">
                                                    <form action="Controller" method="post">
                                                        <input type="hidden" name="cliId" value="${numClient}">
                                                        <input type="hidden" name="adrId" value="${p.id}">
                                                        <input type="hidden" name="type" value="facturation">
                                                        <button class="btn btn-link" type="submit" name="Adresse" value="Mod">Modifier</button><button class="btn btn-link" type="submit" name="okadresse" value="Mod">Sélectionner</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>                    
                        </c:if>
                        <c:if test="${adrliv != null}">
                            <c:forEach items="${adrliv}" var="p">
                                <div class="col-md-4" style="min-width: 250px; margin-top: 15px; margin-bottom: 15px;">
                                    <div class="card border-grey" style="height: 245px;">
                                        <div class="card-header bg-transparent"><small>Adresse de ${p.type}</small></div>
                                        <div class="card-body text-dark">
                                            <p class="card-text">
                                                <strong>${p.genre} ${p.nom} ${p.prenom}</strong>
                                                <br>
                                                <small>
                                                    ${p.adresse}
                                                    <br>

                                                    ${p.codePostal} ${p.ville}
                                                </small>
                                            </p>
                                              <c:if test="${confirmation == 'notok'}">
                                                <div class="row" style="padding-top: 45px; padding-left: 15px">
                                                    <form action="Controller" method="post">
                                                        <input type="hidden" name="cliId" value="${numClient}">
                                                        <input type="hidden" name="adrId" value="${p.id}">
                                                        <input type="hidden" name="type" value="livraison">
                                                        <button class="btn btn-link" type="submit" name="Adresse" value="Mod">Modifier</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                            <c:if test="${confirmation == 'ok'}">
                                                <div class="row" style="padding-top: 45px; padding-left: 15px">
                                                    <form action="Controller" method="post">
                                                        <input type="hidden" name="cliId" value="${numClient}">
                                                        <input type="hidden" name="adrId" value="${p.id}">
                                                        <input type="hidden" name="type" value="livraison">
                                                        <button class="btn btn-link" type="submit" name="Adresse" value="Mod">Modifier</button><button class="btn btn-link" type="submit" name="okadresse" value="Mod">Sélectionner</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="row" style="height: 20px;">

                    </div>
                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>

