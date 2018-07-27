
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <div id="sidebar">
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