<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css" />
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
            <div id="panier">
            <h1>Votre panier </h1>
            <br />
            </div>
            <div id="panier-container">
            <c:if test="${isempty}">
            <p class="panier">Panier vide !</p>
            <p class="panier"><a href="Controller?section=accueil">Retour à l'accueil</a></p>
            </c:if>
            <c:if test="${!isempty}">
                <Table>
                <%--<tr>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td><p>Qantité</p></td>
                    <td><p>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</p></td>
                    <td><p>Oeuvre</p></td>
                    <td><p>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</p></td>
                    <td><p>Prix unitaire</p></td>
                    <td>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</td>
                    <td><p>Prix total</p></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                </tr>--%>
            <c:forEach var="l" items="${list}">
                <tr>
                    <td><a class="" href="Controller?section=oeuvre&isbn=${l.ref}"><img src='${l.urlImage}' title='${l.titre}'/></a></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td><p>${l.qty}</p></td>
                    <td><p>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</p></td>
                    <td><p>${l.titre}</p></td>
                    <td><p>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</p></td>
                    <td><p>${l.prix} €</p></td>
                    <td>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</td>
                    <td><p> ${l.somme} €TTC</p></td>
                    <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    
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
                
                <%--<tr>
                    <td><img src='${oeuvre.oeuUrlImage}' title='${oeuvre.oeuTitre}'/></td>
                    <td>${oeuvre.oeuTitre} / ${l.qty}</td>
                    <td>
                    <a href="Controller?section=affichePanier&add=${l.ref}"><INPUT TYPE='SUBMIT' NAME='add' VALUE='+' /></a>
                    <a href="Controller?section=affichePanier&dec=${l.ref}"><INPUT TYPE='SUBMIT' NAME='dec' VALUE='-' /></a>
                    <a href="Controller?section=affichePanier&del=${l.ref}"><INPUT TYPE='SUBMIT' NAME='del' VALUE='Supprimer' /></a>
                    </td>--%>
            <br>
                </tr>
            </c:forEach>
                </Table>
                
                <br />
                <br />
                <p class="panier">Total du panier : ${total} €TTC
                &nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
                <a class="btn btn-primary mx-auto d-block" href="Controller?section=accueil">Valider la commande </a></p>
                
                
                <br />
                <br />
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