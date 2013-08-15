
<%@ page import="br.com.comerpizza.Drink" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drink.label', default: 'Drink')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-drink" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-drink" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'drink.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'drink.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="createdOn" title="${message(code: 'drink.createdOn.label', default: 'Created On')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'drink.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'drink.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'drink.isHidden.label', default: 'Is Hidden')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${drinkInstanceList}" status="i" var="drinkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${drinkInstance.id}">${fieldValue(bean: drinkInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: drinkInstance, field: "price")}</td>
					
						<td><g:formatDate date="${drinkInstance.createdOn}" /></td>
					
						<td>${fieldValue(bean: drinkInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${drinkInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${drinkInstance.isHidden}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${drinkInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
