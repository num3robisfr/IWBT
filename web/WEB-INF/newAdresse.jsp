<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - Nouveau compte client</title>     
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <!-- Sidebar -->     
                <%@include file="Sidebar.jsp" %>

                <div id="catalogue">
                    <div class="container">
                        <div class="row">
                            <h1>Je crée mon compte personnel (étape 2/2)</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p>Adresse de livraison</p>
                                <form action="Controller" method="get">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="nom">Nom</label>
                                            <input type="text" class="form-control" name="nom" placeholder="">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="prenom">Prénom</label>
                                            <input type="text" class="form-control" name="prenom" placeholder="">
                                        </div>  
                                    </div>
                                    <div class="form-group">
                                        <label for="adresse">Adresse</label>
                                        <input type="text" class="form-control" name="adresse" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="complement">Complement d'adresse</label>
                                        <input type="text" class="form-control" name="complement" placeholder="Appartement, étage, etc ...">
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="codePostal">Code postal</label>
                                            <input type="text" class="form-control" name="codePostal" placeholder="75000">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="ville">Ville</label>
                                            <input type="text" class="form-control" name="ville" placeholder="Paris">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary mx-auto d-block" value="addAdresse" name="adresse">Créer le compte</button>
                                        </div>
                                    </div>    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer -->

            </div>
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
