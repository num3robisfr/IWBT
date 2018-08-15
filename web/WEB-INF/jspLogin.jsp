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

        <%--Test si il y a un cookie 'username' sur le navigateur
                 pour afficher le nom du client --%>

        <c:if test="${okay == '2' }">
            <title>${nom}</title>     
        </c:if>
        <c:if test="${okay != '2' }">
            <title>Connectez-vous</title>     
        </c:if>
    </head> 
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->   

                <%--Test si il y a un cookie 'username' sur le navigateur 
                                   pour  afficher la bonne sidebar--%>

                <c:if test="${okay == '2' }">
                    <%@include file="Sidebar2.jsp" %>
                </c:if>
                <c:if test="${okay != '2' }">
                    <%@include file="Sidebar.jsp" %>
                </c:if>

                <div id="catalogue">
                    <br>
                    <%--S'il y a pas de cookie 'username' sur le navigateur :
               on affiche les champs 'login' et 'password' --%>

                    <c:if test="${okay == '0'}">
                        <form name="loginform" action="Controller?section=login" method="POST">
                            <div class="row" style="margin-top: 100px;">

                            </div>
                            <div class="row align-items-center justify-content-center">

                                <div class="col-md-6">
                                    <div class="card text-center bg-light">
                                        <div class="form-group mr-5 ml-5" style="padding-top: 15px;">
                                            <label for="identifiant">Identifiant</label>
                                            <input type="text" class="form-control form-control-sm" name="login" placeholder="" value="">
                                        </div>
                                        <div class="form-group mr-5 ml-5">
                                            <label for="password">Mot de passe</label>
                                            <input type="password" class="form-control form-control-sm" name="password" placeholder="" value="">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary" value="Se connecter" name="oklogin">Se connecter</button>
                                            </div>    
                                        </div>
                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col">
                                                <p>
                                                    <a href="Controller?section=newCompteClient">Vous n'avez pas encore de compte IBWT ? Inscrivez vous</a>
                                                </p>
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>


                    <%--Test si le identifiant/mot de passe est incorrect : 
                   message d'erreur, et ré-affichage des champs vides--%>

                    <c:if test="${okay == '1'}">
                        <form name="loginform" action="Controller?section=login" method="POST">
                            <div class="row" style="margin-top: 100px;">

                            </div>
                            <div class="row align-items-center justify-content-center">

                                <div class="col-md-6">
                                    <div class="card text-center bg-light">
                                        <div class="form-group mr-5 ml-5">
                                            <label for="identifiant">Identifiant</label>
                                            <input type="text" class="form-control" name="login" placeholder="" value="">
                                        </div>
                                        <div class="form-group mr-5 ml-5">
                                            <label for="password">Mot de passe</label>
                                            <input type="password" class="form-control" name="password" placeholder="" value="">
                                            <span class="text-danger">Votre identifiant et/ou mot de passe sont incorrects</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary" value="Se connecter" name="oklogin">Se connecter</button>
                                            </div>    
                                        </div>
                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col">
                                                <p>
                                                    <a href="Controller?section=newCompteClient">Vous n'avez pas encore de compte IBWT ? Inscrivez vous</a>
                                                </p>
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                            </div>
                        </form> 
                    </c:if>

                    <%--Test si il y a un cookie "username" dans le navigateur, 
                            si oui : accès direct à la page compte client--%>

                    <c:if test="${okay == '2' }">     
                        <p><strong>Historique des commandes</strong></p>
                        <select name="datelimit"> 
                            <option>3 mois</option>
                            <option>6 mois</option>
                            <option>1 ans</option>
                            <option>Toutes les commandes</option>
                        </select>
                        <br>
                        <br>
                        <%--Test s'il y a des commandes précédentes existantes :
                        si oui, afficher la derniere commande dans un tableau
                        sinon, afficher un message 'Aucune commande effectuée'--%>

                        <c:if test="${empty listeCommande }">   
                            <h1>Aucune commande effectuée</h1>
                        </c:if>

                        <c:if test="${not empty listeCommande }">
                            <c:forEach var="t" items="${tabCommande}">
                                <c:set var="total" value="${0}" scope="page" />

                                <h1>Commande n° ${t}</h1>

                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th><center>Date</center></th>
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
                                        <c:if test="${t ==lc.comId}">
                                            <c:set  var="total" value="${(total + (lc.comPrixUnitaireTTC*lc.comQty))}" />
                                            <tr>
                                                <td><center><strong>${lc.comDate}</strong></center></td>
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
                                            </c:if>

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
                                    <td></td>
                                    <td><center><strong><fmt:formatNumber value="${total}" type="currency"/></center></td>
                                    <td><center>5 €</center></td>
                                </table>
                                <br>  
                                <h3>Total de la commande TTC : <strong><fmt:formatNumber value="${total+5}" type="currency"/></p></strong></h3>


                                <hr>
                            </c:forEach>
                            </c:if>
                        
                        </c:if>
                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
