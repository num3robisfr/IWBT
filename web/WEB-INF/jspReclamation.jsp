<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>Réclamation</title>     

        <fmt:setLocale value="fr_FR"/>

    </head> 
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->   
                <%@include file="Sidebar2.jsp" %>

                <div id="catalogue">
                    <br>

                    <c:if test="${Soumettre == 'ok'}">
                        <h2><center>Merci de nous avoir fait part de votre réclamation,</center></h2><br>
                        <h2><center>nous donnerons suite à votre demande dans les plus brefs délais</center></h2>
                        <br>
                        <p><center><a href="Controller?section=accueil">Retour à l'accueil</a></center></p>
                        
                    </c:if>
                      <c:if test="${Soumettre != 'ok'}">
                         <h1>Commande n° ${comId} du ${date} </h1>
                    <textarea name="Reclamation" rows="4" cols="100">
${Idcom} du ${date} 
                    </textarea>

                    <br>  
                    <hr>
         <form action="Controller?section=reclamation" method="POST"> 
                        <center> <input type="submit" value="Soumettre" name="Soumettre" /></center>
                       </form> 
                      </c:if>
                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
