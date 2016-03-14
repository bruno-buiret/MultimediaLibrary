<%@include file="/WEB-INF/_inc/bootstrap.jsp" %>
<c:set var="_page_title" value="Liste des propriétaires" />
<c:set var="_page_current" value="owners_list" />
<%@include file="/WEB-INF/_inc/header.jsp" %>
    <div class="page-header">
        <h1>Liste des propriétaires</h1>
    </div>
    <c:if test="${not empty _flash}">
        <c:forEach items="${_flash}" var="item">
            <div class="alert alert-${item.type}" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Fermer">
                    <span aria-hidden="true">&times;</span>
                </button>
                ${item.contents}
            </div>
        </c:forEach>
    </c:if>
    <p>
        <c:url value="/owners.jsp?action=add" var="_url" />
        <a class="btn btn-default" href="${fn:escapeXml(_url)}" role="button">
            <span class="glyphicon glyphicon-plus"></span>
            Ajout
        </a>
    </p>
    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>
                        Prénom
                    </th>
                    <th>
                        Nom
                    </th>
                    <th style="width: 50px;">
                    </th>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
            <tbody>
                <c:choose>
                    <c:when test="${fn:length(owners) gt 0}">
                        <c:forEach items="${owners}" var="owner">
                            <tr>
                                <td>
                                    ${fn:escapeXml(owner.firstName)}
                                </td>
                                <td>
                                    ${fn:escapeXml(owner.lastName)}
                                </td>
                                <td class="text-center">
                                    <c:url value="/owners.jsp?action=edit&id=${owner.id}" var="_url" />
                                    <a href="${fn:escapeXml(_url)}"><!--
                                        --><span class="glyphicon glyphicon-pencil"></span><!--
                                    --></a>
                                    <c:url value="/owners.jsp?action=delete&id=${owner.id}" var="_url" />
                                    <a href="${fn:escapeXml(_url)}" class="color-danger"><!--
                                        --><span class="glyphicon glyphicon-trash"></span><!--
                                    --></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3">
                                Il n'y a aucun propriétaire pour le moment.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
<%@include file="/WEB-INF/_inc/footer.jsp" %>