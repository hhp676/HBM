<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<c:forEach var="menu" items="${comm_subMenus}">
	<c:choose>
		<c:when test="${not empty menu.subMenuList}">
			<li <c:if test="${fn:contains(comm['navIdList'], menu.modelId)}"> class="active open"</c:if>><a href="#" class="menu-dropdown"> <i
					class="bs-menu-icon ${menu.bsStyle}"></i> <span
					class="bs-menu-text">${menu.modelName}</span> <i class="menu-expand"></i>
			</a>
				<ul class="submenu">
                    <c:set var="comm_subMenus" value="${menu.subMenuList}" scope="request" />
                    <c:import url="/WEB-INF/jsp/common/leftMenu.jsp" />
				</ul>
		  </li>
		</c:when>
		<c:otherwise>
			<li <c:if test="${fn:contains(comm['navIdList'], menu.modelId)}"> class="active"</c:if>>
			 <a href="###" hgUri="${menu.uri}"> <i
					class="bs-menu-icon ${menu.bsStyle}"></i> <span
					class="bs-menu-text">${menu.modelName}</span></a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>