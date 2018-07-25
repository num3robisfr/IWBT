<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <title>Accueil</title>     
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
                <%@include file="Catalogue.jsp" %>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
