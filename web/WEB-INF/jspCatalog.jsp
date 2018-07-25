<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<a href="Controller?section=panier&add=livre 1">TEST LIVRE 1</a><br />
<a href="Controller?section=panier&add=livre 2">TEST LIVRE 2</a><br />
<a href="Controller?section=panier&add=livre 3">TEST LIVRE 3</a><br />
<a href="Controller?section=panier&add=livre 4">TEST LIVRE 4</a><br />
<a href="Controller?section=panier&add=livre 5">TEST LIVRE 5</a><br />
<a href="Controller?section=panier&add=livre 6">TEST LIVRE 6</a><br />--%>

<%--<jsp:useBean class="Model.beanOeuvre" scope="request" id="beanOeuvre"/>
<jsp:setProperty name="beanOeuvre" property="*"/>--%>


<c:forEach var="beanOeuvre" items="listeOeuvres">
    <jsp:getProperty name="beanOeuvre" property="oeuTitre"/>
</c:forEach>