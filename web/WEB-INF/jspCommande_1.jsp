<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT</title>
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
                <%--<%@include file="Catalogue.jsp" %>--%>
<div id="catalogue">
    <div class="container">

        <br><h1>Résultats de la recherche</h1><br>
<div class="row d-flex wrap">
            <c:forEach items="${beanca2}" var="p">

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
        </div>
    </div></div></div></div>
