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
            <h1>Votre panier </h1>
            <br />
            <c:if test="${isempty}">
            <p class="panier">Panier vide !</p>
            </c:if>
            <c:if test="${!isempty}">
                <Table>
            <c:forEach var="l" items="${list}">
                <tr>
                    <td><a class="" href="Controller?section=oeuvre&isbn=${l.ref}"><img src='${l.urlImage}' title='${l.ref}'/></a></td>
                    <td>${l.titre} / ${l.qty}</td>
                    <td>
                        <form action="Controller" method="get">
                            <input type='hidden' name='section' value='affichePanier' />
                            <input type='hidden' name='urlImage' value='${l.urlImage}' />
                            <input type='hidden' name='ref' value='${l.ref}' />
                            <input type='hidden' name='titre' value='${l.titre}' />
                            <input type='hidden' name='qty' value='${l.qty}' />
                            <INPUT TYPE='SUBMIT' class="" NAME='add' VALUE='+' />
                            <INPUT TYPE='SUBMIT' class="" NAME='dec' VALUE='-' />   
                            <INPUT TYPE='SUBMIT' class="" NAME='del' VALUE='Supprimer' />
                        </form>
                            <%--<a href="Controller?section=affichePanier&add=(urlImage=${l.urlImage}&ref=${l.ref}&titre=${l.titre}&qty=${l.qty}')"><INPUT TYPE='SUBMIT' NAME='add' VALUE='+' /></a>
                            <a href="Controller?section=affichePanier&dec=(urlImage=${l.urlImage}&ref=${l.ref}&titre=${l.titre}')"><INPUT TYPE='SUBMIT' NAME='dec' VALUE='-' /></a>
                            <a href="Controller?section=affichePanier&del=${l.ref}"><INPUT TYPE='SUBMIT' NAME='del' VALUE='Supprimer' /></a>--%> 
                    </td>
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
            <a href="Controller?section=affichePanier&clean">Vider le panier</a>
            </c:if>
            <a href="Controller?section=accueil">Retour à l'accueil</a>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>


<!--
    CL - cdi1804 - 18.07.23 
-->