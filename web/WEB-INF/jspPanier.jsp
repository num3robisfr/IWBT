<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/style.css" />
        <fmt:setLocale value="fr_FR"/>

        <title>IBWT</title>
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->
            <%@include file="Header.jsp" %>
            <div id="panier">
                <br>
                <h1>Votre panier </h1>
            </div>
            <div id="panier-container">
                <c:if test="${isempty}">
                    <p class="panier">Panier vide !</p>
                    <p class="panier"><a href="Controller?section=accueil">Retour à l'accueil</a></p>
                </c:if>
                <c:if test="${!isempty}">
                    <table border="1">
                        <tr>
                            <th><center>Article</center></th>
                        <th><center>Quantité</center></th>
                        <th><center>Titre</center></th>
                        <th><center>Prix unitaire TTC</center></th>
                        <th><center>&nbsp&nbspSous-Total TTC&nbsp&nbsp</center></th>
                        <th><center>Ajouter</center></th>
                        <th><center>Enlever</center></th>
                        <th><center>Supprimer</center></th>             
                        <th><center>Frais de port</center></th>
                        </tr>
                        <c:forEach var="l" items="${list}">
                            <tr>

                                <td><center><a class="" href="Controller?section=oeuvre&isbn=${l.ref}"><img src='${l.urlImage}' title='${l.titre}' width = 50%/></a></center></td>
                            <td><p><center>${l.qty}</center></p></td>
                            <td><p><center>${l.titre}</center></p></td>
                            <td><p><center><fmt:formatNumber value="${l.prix}" type="currency"/></center></p></td>
                            <td><p> <center><fmt:formatNumber value="${l.somme}" type="currency"/></center></p></td>

                            <form action="Controller" method="get">
                                <input type='hidden' name='section' value='affichePanier' />
                                <input type='hidden' name='urlImage' value='${l.urlImage}' />
                                <input type='hidden' name='ref' value='${l.ref}' />
                                <input type='hidden' name='titre' value='${l.titre}' />
                                <input type='hidden' name='prix' value='${l.prix}' />

                                <td><INPUT TYPE='SUBMIT' class="btn btn-primary mx-auto d-block" NAME='add' VALUE='+' /></td>
                                <td><INPUT TYPE='SUBMIT' class="btn btn-primary mx-auto d-block" NAME='dec' VALUE='-' /></td>   
                                <td><INPUT TYPE='SUBMIT' class="btn btn-primary mx-auto d-block" NAME='del' VALUE='Supprimer' /></td>


                            </form>

                            <br>
                            </tr>
                            <br>
                            </tr>

                        </c:forEach>
                        <td><center><strong>Tous vos articles</strong></center></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><center><strong><fmt:formatNumber value="${total}" type="currency"/></center></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><center>5 €</center></td>
                    </Table>
                    <br>
                    <h2>Total du panier : &nbsp<strong><fmt:formatNumber value="${total +5}" type="currency"/> &nbspTTC
                            <br>                    <br>

                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=validationcommande">Valider la commande </a></strong></h2>
                    <p class="panier"><a href="Controller?section=affichePanier&clean">Vider le panier</a>
                        &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                        <a href="Controller?section=accueil">Retour à l'accueil</a></p>
                    </c:if>


            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %> 
        </div>
    </body>
</html>


<!--
    CL - cdi1804 - 18.07.23 
-->