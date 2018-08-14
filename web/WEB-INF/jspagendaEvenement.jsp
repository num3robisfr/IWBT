<%-- 
    Document   : jspagendaEvenement
    Created on : 7 août 2018, 01:48:57
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
        <title>Agenda Evènements</title>
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->
            <%@include file="Header.jsp" %>
            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->     
                <%@include file="Sidebar.jsp" %>
                <!-- catalogue -->    
                <div id="catalogue">
                    <div class="container">

                        <br><h1>Agenda Evènements</h1><br>
                        <div class="row d-flex wrap">
                            <div class="row"> 
                                <c:forEach items="${listeEvenement}" var="l">
                                    <div class="col-4"> 
                                        <a class="card-img-top mx-auto d-block" href="Controller?section=evenement&intitule=${l.eveId}"><center class = "lien">${l.eveIntitule}</center><center class = "lien"> du ${l.eveDateDebut} au ${l.eveDateFin}</center><img src="${l.eveUrl}" alt=${l.eveIntitule} width="100%"></a>                                       
                                    </div>
                                </c:forEach>
                            </div>
                        </div></div>
                </div></div>
        </div>
    </body>
</html>