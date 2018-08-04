<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css" />
        <title>IBWT - Login</title>     
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
                    <c:if test="${okay == '0'}">
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
                        <center>Bienvenue ${nom}</center>          

                    </c:if>

                </div>
            </div>
            <!-- footer -->
            <%@include file="Footer.jsp" %>
        </div>
    </body>
</html>
