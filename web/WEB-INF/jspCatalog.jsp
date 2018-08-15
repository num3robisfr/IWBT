<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="fr_FR"/>

<div id="catalogue">
    <div class="container">

        <jsp:include page="jspEvenement.jsp" flush="true" />
        <br>

        <h1>Nouveautés</h1>
        <br>
        <div class="row d-flex wrap">
            <c:forEach items="${listeNouv}" var="p">

                <div class="col-4 mb-3">
                    <div class="card" style="width: 18rem; height: 410px; margin-top: 15px; margin-bottom: 15px;">
                        <a href="Controller?section=oeuvre&isbn=${p.oeuIsbn}"><img class="card-img-top mx-auto d-block" style="max-height: 200px; width: auto; margin-bottom: 15px;" src="${p.oeuUrlImage}" alt="${p.oeuTitre}"></a>
                        <div class="card-body">
                            <h6 class="card-title">${p.oeuTitre}</h6>
                            <p>${p.autNom}</p>
                            <p><fmt:formatNumber value="${p.oeuPrix}" type="currency"/></p>
                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=oeuvre&isbn=${p.oeuIsbn}">Sélectionner</a>
                            <%--<br />
                            <a class="btn btn-primary mx-auto d-block" href="Controller?section=panier&ajoutV2=&urlImage=${p.oeuUrlImage}&ref=${p.oeuIsbn}&titre=${p.oeuTitre}&prix=${p.oeuPrix}"> + </a>--%>
                        </div>
                    </div>
                </div>
                <br>


            </c:forEach>
        </div>
        <div class="row">
            <br>
        </div>    
    </div>
</div>

