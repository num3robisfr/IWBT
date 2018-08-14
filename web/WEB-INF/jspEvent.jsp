<%-- 
    Document   : jspEvent
    Created on : 30 juil. 2018, 19:58:33
    Author     : thierry
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />

        <title>Evènement ${evenement.eveIntitule}</title>
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
                    <center> <br><h1>${evenement.eveIntitule}</h1><br><img src="${evenement.eveUrl}" class = "imageflottante"alt=${evenement.eveIntitule} width="40%"><br></center>
                    <p class="eveDescription">${evenement.eveDescription}</p>                   

                    <c:if test="${promo =='ok'}">
                        <p class="eveDescription">Promotion de ${evenement.eveTauxPromo}%</p>
                    </c:if>

                    <p class="dessous" style="color: green;"><h2 class="date"><center><blink> du ${evenement.eveDateDebut} au ${evenement.eveDateFin}</blink></center></h2></p>
                    <hr>
                    <c:if test="${listevide == 'ok'}">
                        <h1><center>Nombreuses promotions à venir</center></h1><br>
                            </c:if>

                    <c:if test="${listevide == 'notok'}">
                        <h1>   <center>Livres concernés</center></h1><br>
                        <div class="row">
                            <div class="container">
                                <div class="row d-flex wrap">
                                    <c:forEach items="${listeevenementoeuvre}" var="p">

                                        <div class="col-4">
                                            <div class="card" style="width: 18rem; height: 400px;">
                                                <img class="card-img-top mx-auto d-block" style="height: 50%; width: 50%;" src="${p.oeuUrlImage}" alt="${p.oeuTitre}">
                                                <div class="card-body">
                                                    <h6 class="card-title">${p.oeuTitre}</h6>
                                                    <p>${p.autNom}</p>
                                                    <p>${p.oeuPrix}€</p>
                                                    <a class="btn btn-primary mx-auto d-block" href="Controller?section=oeuvre&isbn=${p.oeuIsbn}">Sélectionner</a>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </div></div>
                        </div>
                    </c:if>

                </div>


            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
