<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="catalogue">
    <div class="container">

        <jsp:include page="jspEvenement.jsp" flush="true" />
        <br>
        
        <h1>Nouveauté</h1>
        <br>
<div class="row d-flex wrap">
            <c:forEach items="${beanca}" var="p">

                <div class="col-4">
                    <div class="card" style="width: 18rem; height: 400px;">
                        <img class="card-img-top mx-auto d-block" style="height: 50%; width: 50%;" src="${p.oeuUrlImage}" alt="${p.oeuTitre}">
                        <div class="card-body">
                            <h6 class="card-title">${p.oeuTitre}</h6>
                            <p>${p.autNom}</p>
                            <p>${p.oeuPrix}€</p>
                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=oeuvre&isbn=${p.oeuIsbn}">Sélectionner</a>
                        </div>
                    </div>
                </div>
                <br>


            </c:forEach>
        </div>
    </div>

