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
                            <h1>Je crée mon compte personnel (étape 1/2)</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p>Informations personnelles</p>
                                <form action="Controller" method="post">
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
                                            <input type="text" class="form-control" name="nom" placeholder="" value="${client['nom']}">
                                            <span class="text-danger">${erreurs['nom']}</span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="prenom">Prénom</label>
                                            <input type="text" class="form-control" name="prenom" placeholder="" value="${client['prenom']}">
                                            <span class="text-danger">${erreurs['prenom']}</span>
                                        </div>
                                    </div>
                                    <div class="form-row">    
                                        <div class="form-group col-md-6">
                                            <label for="telephone">Numéro de téléphone</label>
                                            <input type="text" class="form-control" name="telephone" placeholder="" value="${client['numTel']}">
                                            <span class="text-danger">${erreurs['numTel']}</span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="dateNaissance">Date de naissance</label>
                                            <input type="date" class="form-control" name="dateNaissance" placeholder="30/07/2018" value="${client['dateNaissance']}">
                                            <span class="text-danger">${erreurs['dateNaissance']}</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Adresse mail</label>
                                        <input type="text" class="form-control" name="email" placeholder="nom.prenom@exemple.fr" value="${client['email']}">
                                        <span class="text-danger">${erreurs['email']}</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mot de passe</label>
                                        <input type="password" class="form-control" name="password" placeholder="" value="${client['password']}">
                                        <span class="text-danger">${erreurs['password']}</span>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary mx-auto d-block" value="addClient" name="client">étape suivante</button>
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
