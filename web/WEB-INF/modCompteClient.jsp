<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - Gestion du Compte</title>     
    </head>
    <body>
        <div id="bloc-page">
            <!-- header -->

            <%@include file="Header.jsp" %>

            <!-- section sidebar et catalogue -->
            <div id="section">
                <%@include file="Sidebar2.jsp" %>
                <div id="catalogue">
                    <div class="container">
                        <div class="row">
                            <h1>Gestion du compte</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p>Informations personnelles</p>
                                <form action="Controller" method="post">
                                    <input type="hidden" name="id" value="${client['id']}" />
                                    <div class="form-row">
                                        <div class="form-group col-md-3">
                                            <label for="civilite">Civilité</label>
                                            <select class="form-control form-control-sm" name="civilite">
                                                <option>M</option>
                                                <option>Mme</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="nom">Nom</label>
                                            <input type="text" class="form-control form-control-sm" name="nom" placeholder="" value="${client['nom']}">
                                            <span class="text-danger">${erreurs['nom']}</span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="prenom">Prénom</label>
                                            <input type="text" class="form-control form-control-sm" name="prenom" placeholder="" value="${client['prenom']}">
                                            <span class="text-danger">${erreurs['prenom']}</span>
                                        </div>
                                    </div>
                                    <div class="form-row">    
                                        <div class="form-group col-md-6">
                                            <label for="telephone">Numéro de téléphone</label>
                                            <input type="text" class="form-control form-control-sm" name="telephone" placeholder="" value="${client['telephone']}">
                                            <span class="text-danger">${erreurs['numTel']}</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Adresse mail</label>
                                        <input type="text" class="form-control form-control-sm" name="email" placeholder="nom.prenom@exemple.fr" value="${client['email']}">
                                        <span class="text-danger">${erreurs['email']}</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mot de passe</label>
                                        <input type="password" class="form-control form-control-sm" name="password" placeholder="" value="${client['password']}">
                                        <span class="text-danger">${erreurs['password']}</span>
                                    </div>
                                        <c:if test="${resultat['message'] == null }">
                                    <div class="row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary mx-auto d-block" value="infopersonnelle" name="section">annuler</button>
                                            <br>
                                        </div>
                                        <div class="col">
                                            <button type="submit" class="btn btn-primary mx-auto d-block" value="modClient" name="client">modifier</button>
                                            <br>
                                        </div>

                                    </div>
                                    </c:if>
                                </form>
                            </div>
                            <div class="col-md-6">
                                            <c:if test="${resultat['message'] != null }">
                                                    <div class="col-md-12">
                                                        <div class="alert alert-success" role="alert">
                                                            ${resultat['message']}
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${resultat['erreur'] != null}">
                                                    <div class="col-md-12">
                                                        <div class="alert alert-danger" role="alert">
                                                            ${resultat['erreur']}
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${resultat['message'] != null }">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        
                                                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=infopersonnelle">retourner à la gestion du compte</a>
                                                        
                                                    </div>
                                       
                                                        
                                                </div>
                                                 </c:if>               
                                        </div>        
                        </div>
                    </div>
                </div><br></div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
