<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
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
                <c:if test="${okay == '2' }">
                    <%@include file="Sidebar2.jsp" %>
                </c:if>
                <c:if test="${okay != '2' }">
                    <%@include file="Sidebar.jsp" %>
                </c:if>

                <div id="catalogue">
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


                    <c:if test="${okay == '2' }">
                        <div id="user"><center>Bienvenue ${nom}</center></div>
                        <br><hr>
                        <h1>Dernière commande</h1>

                        <table border="1">
                            <thead>
                                <tr>
                                    <th><center>Couverture</center></th>
                            <th><center>Date</center></th>
                            <th><center>Etat de la commande</center></th>
                            <th><center>Titre</center></th>
                            <th><center>Prix unitaire HT</center></th>
                            <th><center>Tva</center></th>
                            <th><center>Prix unitaire TTC</center></th>
                            <th><center>Quantité</center></th>
                            <th><center>Prix TTC</center></th>
                            <th><center>Promo</center></th>
                            <th><center>Sous-Total TTC</center></th>
                            <th><center>Frais de port</center></th>

                            </tr>

                            </thead>

                            <c:set var="total" value="${0}" scope="page" />

                            <c:forEach var="lc" items="${listeCommande}">
                                <c:set  var="total" value="${(total + (lc.comPrixUnitaireTTC*lc.comQty))}" />
                                <tr>
                                    <td><a class="" href="Controller?section=oeuvre&isbn=${lc.comIsbn}"><img class="card-img-top mx-auto d-block" style=" width: 30%;" src = "${lc.comUrlImage}" alt ="illustration" ></a></td>
                                    <td><center>${lc.comDate}</center></td>
                                <td><center><span class="statut">${lc.comStatut}</span></center></td>
                                <td><center>${lc.comTitre}</center></td>
                                <td><center>${lc.comPrixUnitaireHT} €</center></td>       
                                <td><center>${lc.comTva} %</center></td>
                                <td><center>${lc.comPrixUnitaireTTC} €</center></td>
                                <td><center>${lc.comQty}</center></td>
                                <td><center>${lc.comTotalTtc} €</center></td>
                                <td><center>${lc.comPromo} %</center></td>
                                <td><center>${(lc.comPrixUnitaireTTC*lc.comQty)-((lc.comPrixUnitaireTTC*lc.comQty)*lc.comPromo)/100} €</center></td>

                            </c:forEach>  

                            </tr>
                            <td></td>
                            <td></td>                           
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><center>${total} €</center></td>
                            <td><center>5 €</center></td>
                        </table>
                        <br>
                        <h3>Total TTC : ${total+5} €</h3>


                    </c:if>

                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
