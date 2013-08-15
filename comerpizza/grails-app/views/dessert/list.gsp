
<%@ page import="br.com.comerpizza.Dessert" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dessert.label', default: 'Dessert')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dessert" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dessert" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'dessert.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'dessert.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="createdOn" title="${message(code: 'dessert.createdOn.label', default: 'Created On')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'dessert.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'dessert.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'dessert.isHidden.label', default: 'Is Hidden')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dessertInstanceList}" status="i" var="dessertInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dessertInstance.id}">${fieldValue(bean: dessertInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: dessertInstance, field: "price")}</td>
					
						<td><g:formatDate date="${dessertInstance.createdOn}" /></td>
					
						<td>${fieldValue(bean: dessertInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${dessertInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${dessertInstance.isHidden}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dessertInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
