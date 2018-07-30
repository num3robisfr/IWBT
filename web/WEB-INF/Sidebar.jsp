<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="sidebar">
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <form name="search" action="Controller" method="POST">
                <div class="navbar input-group input-group-sm mb-3">
                    <input type="text" class="form-control" placeholder="Recherche" aria-label="Recherche" name="search">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2" value="OK" name="doit">OK</button>
                    </div>
                </div>    
                </form>
                
            </div>
        </div>
    </div>
    
    
    <ul class="un">
        <c:forEach items="${AllTheme}" var="p">
            <li>${p.intitule}</li>
                <c:forEach var="s" items="${AllSousTheme}">
                    <c:if test="${s.id == p.id}">
                    <ul class="deux">
                        <li>${s.soustheme}</li>
                    </ul>
                </c:if>
            </c:forEach>
        </c:forEach>
    </ul> 
</div>
