<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${isempty}">
<p class="panier">Panier vide !</p>
</c:if>
<c:if test="${!isempty}">
<c:forEach var="l" items="${list}">
${l.ref}/${l.qty}
<a href="Controller?section=panier&add=${l.ref}">+</a>
<a href="Controller?section=panier&dec=${l.ref}">-</a>
<a href="Controller?section=panier&del=${l.ref}">X</a>
<br>
</c:forEach>
<a href="Controller?section=panier&clean">Vider le panier</a>
</c:if>
    

<!--
    CL - cdi1804 - 18.07.23 
-->