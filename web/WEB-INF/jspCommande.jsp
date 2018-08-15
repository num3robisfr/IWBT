<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />

        <%--Déclaration variable 'total' --%>

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
                    <c:set var="total" value="${0}" scope="page" />

                    <h1>Commande n° ${comId} du ${date}</h1>
                    <table border="1">
                        <thead>
                            <tr>
                        <th><center>Article</center></th>
                        <th><center>Etat de la commande</center></th>
                        <th><center>Titre</center></th>
                        <th><center>Prix unitaire HT</center></th>
                        <th><center>Tva</center></th>
                        <th><center>Prix unitaire TTC</center></th>
                        <th><center>Quantité</center></th>
                        <th><center>&nbsp&nbsp&nbspPrix&nbsp&nbsp TTC&nbsp&nbsp&nbsp</center></th>
                        <th><center>Promo</center></th>
                        <th><center>&nbsp&nbspSous-Total TTC&nbsp&nbsp</center></th>
                        <th><center>Frais de port</center></th>
                        </tr>
                        </thead>
                        <c:forEach var="lc" items="${listeCommande}">
                            <c:set  var="total" value="${(total + (lc.comPrixUnitaireTTC*lc.comQty))}" />
                            <tr>
                            <td><a class="" href="Controller?section=oeuvre&isbn=${lc.comIsbn}"><img class="card-img-top mx-auto d-block" style=" width: 30%;" src = "${lc.comUrlImage}" alt ="illustration" ></a></td>
                            <td><center><span class="statut">${lc.comStatut}</span></center></td>
                            <td><center><div class = "titre">${lc.comTitre}</div></center></td>
                            <td><center><strong><fmt:formatNumber value="${lc.comPrixUnitaireHT}" type="currency"/></center></td>       
                            <td><center>${lc.comTva} % </center></td>
                            <td><center><strong><fmt:formatNumber value="${lc.comPrixUnitaireTTC}" type="currency"/></center></td>
                            <td><center><strong>${lc.comQty}</center></td>
                            <td><center><strong> <fmt:formatNumber value="${lc.comTotalTtc}" type="currency"/> </center></td>
                            <td><center>${lc.comPromo} %</center></td>
                            <td><center><strong> <fmt:formatNumber value="${(lc.comPrixUnitaireTTC*lc.comQty)-((lc.comPrixUnitaireTTC*lc.comQty)*lc.comPromo)/100}" type="currency"/></center></td>

                        </c:forEach>  

                        </tr>
                        <td><center><strong>Tous vos articles</strong></center></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><center><strong><fmt:formatNumber value="${total}" type="currency"/></center></td>
                        <td><center>5 €</center></td>
                    </table>
                    <br>  
                    <h3>Total de la commande TTC : <strong><fmt:formatNumber value="${total+5}" type="currency"/></p></strong></h3>


                    <hr>


                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
