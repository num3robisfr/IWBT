<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="catalogue">
    <div class="container">

        <jsp:include page="jspEvenement.jsp" flush="true" />
        <br>
        <div class="row">
        <c:forEach items="${beanca}" var="p" begin="0" end="5">
            
                <div class="col-2">
                    <div class="card" style="width: auto;">
                        <img class="card-img-top" src="${p.oeuUrlImage}" alt="${p.oeuTitre}">
                        <div class="card-body">
                            <h6 class="card-title">${p.oeuTitre}</h6>
                            <p>${p.autNom}</p>
                            <p>${p.oeuPrix}€</p>
                            <a class="btn btn-primary" href="Controller?section=oeuvre&isbn=${p.oeuIsbn}">Sélectionner</a>
                        </div>
                    </div>
                </div>
            

        </c:forEach>
        </div>
        <h1>Nouveauté</h1>

</div>

