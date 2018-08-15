<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - ajout d'une adresse</title>     
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
                            <h1>Ajouter une nouvelle adresse</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <form action="Controller" method="get">

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="civilite">Type</label>
                                            <select class="form-control form-control-sm" name="type">
                                                <option>facturation</option>
                                                <option>livraison</option>
                                            </select>
                                        </div>  
                                        <div class="form-group col-md-6">
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
                                    <div class="form-group">
                                        <label for="adresse">Adresse</label>
                                        <input type="text" class="form-control form-control-sm" name="adresse" placeholder="" value="${client['adresse']}">
                                        <span class="text-danger">${erreurs['adresse']}</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="complement">Complement d'adresse</label>
                                        <input type="text" class="form-control form-control-sm" name="complement" placeholder="Appartement, étage, etc ..." value="${client['complement']}">
                                        <span class="text-danger">${erreurs['complement']}</span>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="codePostal">Code postal</label>
                                            <input type="text" class="form-control form-control-sm" name="codePostal" placeholder="75000" value="${client['codePostal']}">
                                            <span class="text-danger">${erreurs['codePostal']}</span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="ville">Ville</label>
                                            <input type="text" class="form-control form-control-sm" name="ville" placeholder="Paris" value="${client['ville']}">
                                            <span class="text-danger">${erreurs['ville']}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <c:if test="${resultat['message'] == null }">
                                                <button type="submit" class="btn btn-primary mx-auto d-block" value="infopersonnelle" name="section">Annuler</button>
                                            </c:if>
                                        </div>
                                        <div class="col-md-6">
                                            <c:if test="${resultat['message'] == null }">
                                                <button type="submit" class="btn btn-primary mx-auto d-block" value="checkAdd" name="Adresse">Ajouter l'adresse</button>
                                            </c:if>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <br>
                                    </div>     
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
                                        <div class="col-md-6">

                                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=accueil">retourner à l'accueil</a>

                                        </div>
                                        <div class="col-md-6">
                                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=affichePanier">valider votre panier</a>
                                        </div>

                                    </div>
                                </c:if>               
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
