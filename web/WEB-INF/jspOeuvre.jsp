<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
<div id="couvoeuvre">
<img src="${oeuvre.oeuUrlImage}"/><br><br>
${oeuvre.oeuTitre}
<br>
<input type="submit" value="Ajouter au panier" name="addbook" />
<div id="commentaire">
    ${oeuvre.oeuMoyenneCmt}<br>
    <c:if test="${oeuvre.oeuMoyenneCmt == null}">
                    PAS DE NOTE   
    </c:if>
                    <c:if test="${oeuvre.oeuMoyenneCmt != null}">
    SUR &nbsp ${oeuvre.oeuNbreCmt} &nbsp COMMENTAIRE(S)
                    </c:if><br>
                    ${oeuvre.oeuNbreCdc}&nbsp <3
</div>
</div>
</div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
