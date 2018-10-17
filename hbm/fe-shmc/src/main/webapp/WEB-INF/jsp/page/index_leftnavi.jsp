<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="menu" items="${subMenuList}">
    <c:choose>
        <c:when test="${not empty menu.subMenuList}">
            <li><a href="###" ><span class="bs-menu-text">${menu.modelName}</span> </a>
                <ul class="ul_sub_menu">
                    <c:set var="subMenuList" value="${menu.subMenuList}" scope="request" />
                    <c:import url="/WEB-INF/jsp/page/index_leftnavi.jsp" />
                </ul>
          </li>
        </c:when>
        <c:otherwise>
            <li>
             <a href="###" hgUri="${menu.uri}"><span>${menu.modelName}</span></a></li>
        </c:otherwise>
    </c:choose>
</c:forEach>