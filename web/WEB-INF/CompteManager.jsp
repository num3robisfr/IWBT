<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - Gestion du compte</title>     
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <%@include file="Sidebar2.jsp" %>
                <div id="catalogue">
                    <div class="row" style="height: 20px;">

                    </div>
                    <div class="row" style="height: 245px;">
                        <div class="col-md-4" style="min-width: 250px;">
                            <a href="Controller?section=listecommande" class="btn btn-fix">
                                <div class="media">
                                    <img class="mr-3" src="./Images/box.png">
                                    <div class="media-body">
                                        <h5 class="text-left text-dark">Vos commandes</h5>
                                        <p class="text-left">Suivre, retourner ou acheter à nouveau</p>

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4" style="min-width: 250px;">
                            <a href="Controller?section=modCompteClient" class="btn btn-fix">
                                <div class="media">
                                    <img class="mr-3" src="./Images/cadenas.png">
                                    <div class="media-body">
                                        <h5 class="text-left text-dark">Connexion</h5>
                                        <p class="text-left">Modifier l'identifiant, le mot de passe, ...</p>

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4" style="min-width: 250px;">
                            <a href="Controller?section=AdresseManager" class="btn btn-fix">
                                <div class="media">
                                    <img class="mr-3" src="./Images/lieux.png">
                                    <div class="media-body">
                                        <h5 class="text-left text-dark">Adresses</h5>
                                        <p class="text-left">Modifier les adresses de livraison, de facturations</p>

                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>

