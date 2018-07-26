<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="catalogue">
    <p>
<!-- bienvenue -->
        <h1>Bienvenue !</h1>
        <br />
    </p>
    
    <p>
    <c:forEach items="${beanca}" var="p">
        &nbsp&nbsp<a href="Controller?section=oeuvre&isbn=${p.oeuIsbn}"><img src="${p.oeuUrlImage}" width="20%"/><br>&nbsp&nbsp${p.oeuTitre}</a> <br><br>
        </c:forEach>

    </p>


</div>

