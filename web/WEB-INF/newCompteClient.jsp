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
                            <h1>Je crée mon compte personnel</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p>Informations personnelles</p>
                                <form action="Controller" method="get">
                                    <div class="form-row">
                                        <div class="form-group col-md-3">
                                            <label for="civilite">Civilité</label>
                                            <select class="form-control" name="civilite">
                                                <option>M</option>
                                                <option>Mme</option>
                                            </select>
                                        </div>
                                    </div>
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
                                        <label for="telephone">Numéro de téléphone</label>
                                        <input type="text" class="form-control" name="telephone" placeholder="0102030405">
                                    </div>
                                    <div class="form-group">
                                        <label for="dateNaissance">Date de naissance</label>
                                        <input type="date" class="form-control" name="dateNaissance" placeholder="30/07/2018">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mot de passe</label>
                                        <input type="password" class="form-control" name="password" placeholder="">
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary d-block" value="addClient" name="client">créer</button>
                                            <br>
                                        </div>
                                        
                                    </div>    
                                </form>
                            </div>  
                        </div>
                    </div>
                </div><br></div>
                <!-- footer -->
                <%@include file="Footer.jsp" %>
            </div>
    </body>
</html>
