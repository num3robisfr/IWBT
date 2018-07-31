<%-- 
    Document   : jspEvenement
    Created on : 25 juil. 2018, 21:30:40
    Author     : thierry
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div id="evenement">
    <!-- bienvenue -->
    <br><h1> Evènement</h1>
    <div class="row"> 
        <c:forEach items="${listeevenement}" var="l">
            <div class="col-4"> 
                <br><a class="card-img-top mx-auto d-block" href="Controller?section=evenement&intitule=${l.eveId}">${l.eveIntitule}<img src="${l.eveUrl}" alt=${l.eveIntitule} width="100%"></a><br>
                <p></p>
                <p style="color: green;"> du ${l.eveDateDebut} au ${l.eveDateFin}</p>
            </div>
        </c:forEach>
    </div>   
</div>