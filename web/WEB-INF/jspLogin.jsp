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
                    <center><form name="loginform" action="Controller">
                            <br>Identifiant<br><input type="text" name="login" value="" /><br><br>
                            Mot de passe<br><input type="text" name="password" value="" /><br><br>
                            <input type="submit" value="Se connecter" name="oklogin" /><br><br>
                            <a href="Controller?section=newCompteClient">Vous n'avez pas encore de compte IBWT ? Inscrivez vous</a>
                        </form></center>
                </div></div>
                <!-- footer -->
                <%@include file="Footer.jsp" %>
            </div>
    </body>
</html>
