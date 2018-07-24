<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IBWT</title>
    </head>
    <body>
        <h1>Bienvenue sur InBookWeTrust !</h1>
        <br />
        <jsp:include page="/Controller?section=catalog" flush="true" />
        <br />
        <hr />
        <br />
        <%--<jsp:include page="/Controller?section=affichePanier" flush="true" />--%>
        <a href="Controller?section=affichePanier">Voir votre panier</a>
        <br />
        
    </body>
</html>

<!--
    CL - cdi1804 - 18.07.23 
-->