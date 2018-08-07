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
                                <p>Adresse de facturation</p>
                                <form action="Controller" method="post">
                                    <div class="form-group">
                                        <label for="adresse">Adresse</label>
                                        <input type="text" class="form-control" name="adresse" placeholder="" value="${adresse['adresse']}">
                                        <span class="text-danger">${erreurs['adresse']}</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="complement">Complement d'adresse</label>
                                        <input type="text" class="form-control" name="complement" placeholder="Appartement, étage, etc ..." value="${adresse['complement']}">
                                        <span class="text-danger">${erreurs['complement']}</span>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="codePostal">Code postal</label>
                                            <input type="text" class="form-control" name="codePostal" placeholder="75000" value="${adresse['codePostal']}">
                                            <span class="text-danger">${erreurs['codePostal']}</span>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="ville">Ville</label>
                                            <input type="text" class="form-control" name="ville" placeholder="Paris" value="${adresse['ville']}">
                                            <span class="text-danger">${erreurs['ville']}</span>
                                        </div>
                                    </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <c:if test="${resultat['message'] == null }">
                                                        <button type="submit" class="btn btn-primary mx-auto d-block" value="addAdresse" name="adr">Créer le compte</button>
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
