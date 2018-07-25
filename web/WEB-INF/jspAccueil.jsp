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
            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->     
                <%@include file="Sidebar.jsp" %>
                <!-- catalogue -->    
                <%--<%@include file="Catalogue.jsp" %>--%>
                <jsp:include page="/Controller?section=catalog" flush="true" />
                <%--<br />
                <jsp:include page="/Controller?section=affichePanier" flush="true" />--%>
                <%--<a href="Controller?section=affichePanier">Voir votre panier</a>
                <br />--%>
                </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
        
    </body>
</html>

<!--
    CL - cdi1804 - 18.07.23 
-->