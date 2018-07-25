<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT</title>
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->
            <%@include file="Header.jsp" %>
            <h2>Votre panier </h2>
            <br />
            <c:if test="${isempty}">
            <p class="panier">Panier vide !</p>
            </c:if>
            <c:if test="${!isempty}">
            <c:forEach var="l" items="${list}">
            ${l.ref}/${l.qty}
            <a href="Controller?section=panier&add=${l.ref}">+</a>
            <a href="Controller?section=panier&dec=${l.ref}">-</a>
            <a href="Controller?section=panier&del=${l.ref}">X</a>
            <br>
            </c:forEach>
            <a href="Controller?section=panier&clean">Vider le panier</a>
            </c:if>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>


<!--
    CL - cdi1804 - 18.07.23 
-->