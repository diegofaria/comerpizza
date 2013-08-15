
<%@ page import="br.com.comerpizza.FlavorIngredient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flavorIngredient.label', default: 'FlavorIngredient')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flavorIngredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flavorIngredient" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="flavorIngredient.ingredient.label" default="Ingredient" /></th>
					
						<g:sortableColumn property="isAdditional" title="${message(code: 'flavorIngredient.isAdditional.label', default: 'Is Additional')}" />
					
						<th><g:message code="flavorIngredient.pizza.label" default="Pizza" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'flavorIngredient.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flavorIngredientInstanceList}" status="i" var="flavorIngredientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flavorIngredientInstance.id}">${fieldValue(bean: flavorIngredientInstance, field: "ingredient")}</g:link></td>
					
						<td><g:formatBoolean boolean="${flavorIngredientInstance.isAdditional}" /></td>
					
						<td>${fieldValue(bean: flavorIngredientInstance, field: "pizza")}</td>
					
						<td>${fieldValue(bean: flavorIngredientInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flavorIngredientInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
