<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="header">
    <div id="logo"><a href="Controller">In Book We Trust</a></div>
    <div id="espace"></div>
    <div id="ensemble_header">
        <div class="login">

            <c:if test="${okay == '1' || okay == '0'}">

                <a href="Controller?section=login">Identifiez-vous</a>
            </c:if> 

            <c:if test="${okay == '2'}">
                
                <a href="Controller?section=infopersonnelle">${nom}</a><br>
                <a href="Controller?section=logout"><img style="width: 30px; height: 30px; margin-left: 5px;" src="./Images/shutdown.png"></a>

            </c:if>  


        </div>
        <div class="panier">
            <a href="Controller?section=affichePanier">Panier</a>
        </div>

    </div>
</div>


