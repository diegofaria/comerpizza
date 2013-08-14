
<%@ page import="br.com.comerpizza.Ingredient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ingredient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'ingredient.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'ingredient.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'ingredient.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'ingredient.isHidden.label', default: 'Is Hidden')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'ingredient.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ingredientInstance.id}">${fieldValue(bean: ingredientInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: ingredientInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${ingredientInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${ingredientInstance.isHidden}" /></td>
					
						<td>${fieldValue(bean: ingredientInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ingredientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
