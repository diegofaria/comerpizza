
<%@ page import="br.com.comerpizza.Solicitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitation.label', default: 'Solicitation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solicitation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solicitation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="total" title="${message(code: 'solicitation.total.label', default: 'Total')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'solicitation.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="createdOn" title="${message(code: 'solicitation.createdOn.label', default: 'Created On')}" />
					
						<th><g:message code="solicitation.customer.label" default="Customer" /></th>
					
						<g:sortableColumn property="notes" title="${message(code: 'solicitation.notes.label', default: 'Notes')}" />
					
						<g:sortableColumn property="updatedOn" title="${message(code: 'solicitation.updatedOn.label', default: 'Updated On')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solicitationInstanceList}" status="i" var="solicitationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solicitationInstance.id}">${fieldValue(bean: solicitationInstance, field: "total")}</g:link></td>
					
						<td>${fieldValue(bean: solicitationInstance, field: "status")}</td>
					
						<td><g:formatDate date="${solicitationInstance.createdOn}" /></td>
					
						<td>${fieldValue(bean: solicitationInstance, field: "customer")}</td>
					
						<td>${fieldValue(bean: solicitationInstance, field: "notes")}</td>
					
						<td><g:formatDate date="${solicitationInstance.updatedOn}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solicitationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
