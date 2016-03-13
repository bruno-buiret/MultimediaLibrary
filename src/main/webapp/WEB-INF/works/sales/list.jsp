<%@include file="/WEB-INF/_inc/bootstrap.jsp" %>
<c:set var="_page_title" value="Catalogue des ventes" />
<c:set var="_page_current" value="works_sales_list" />
<c:set var="_page_scripts">
    <script type="text/javascript">
        $(function () {
            $("[data-toggle='tooltip']").tooltip();
        });
    </script>
</c:set>
<%@include file="/WEB-INF/_inc/header.jsp" %>
    <div class="page-header">
        <h1>Catalogue des ventes</h1>
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
        <c:url value="sellableWorks.jsp?action=add" var="_url" />
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
                        Titre
                    </th>
                    <th>
                        Prix
                    </th>
                    <th>
                        Propri�taire
                    </th>
                    <th style="width: 70px;">
                    </th>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
            <tbody>
                <c:choose>
                    <c:when test="${fn:length(works) gt 0}">
                        <c:forEach items="${works}" var="work">
                            <tr>
                                <td>
                                    ${fn:escapeXml(work.name)}
                                </td>
                                <td>
                                    <fmt:formatNumber value="${work.price}" type="currency" />
                                </td>
                                <td>
                                    ${fn:escapeXml(work.owner.firstName)}
                                    ${fn:escapeXml(work.owner.lastName)}
                                </td>
                                <td class="text-center">
                                    <%-- @todo Hide this link if the work has already been booked --%>
                                    <c:url value="sellableWorks.jsp?action=book&id=${work.id}" var="_url" />
                                    <a
                                        href="${fn:escapeXml(_url)}"
                                        class="color-success"
                                        data-toggle="tooltip"
                                        data-placement="left"
                                        title="R�server cette oeuvre pour l'acheter"
                                    ><!--
                                        --><span class="glyphicon glyphicon-tag"></span><!--
                                    --></a>
                                    <c:url value="sellableWorks.jsp?action=edit&id=${work.id}" var="_url" />
                                    <a
                                        href="${fn:escapeXml(_url)}"
                                        data-toggle="tooltip"
                                        data-placement="left"
                                        title="�diter cette oeuvre"
                                    ><!--
                                        --><span class="glyphicon glyphicon-pencil"></span><!--
                                    --></a>
                                    <a
                                        href="sellableWorks.jsp?action=delete&id=${work.id}"
                                        class="color-danger"
                                        data-toggle="tooltip"
                                        data-placement="left"
                                        title="Supprimer cette oeuvre"
                                    ><!--
                                        --><span class="glyphicon glyphicon-trash"></span><!--
                                    --></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">
                                Il n'y a aucune vente pour le moment.
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
<%@include file="/WEB-INF/_inc/footer.jsp" %>