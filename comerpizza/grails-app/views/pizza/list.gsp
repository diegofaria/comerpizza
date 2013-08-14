
<%@ page import="br.com.comerpizza.Pizza" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pizza.label', default: 'Pizza')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pizza" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pizza" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'pizza.name.label', default: 'Name')}" />
					
						<th><g:message code="pizza.size.label" default="Size" /></th>
					
						<th><g:message code="pizza.specialBorder.label" default="Special Border" /></th>
					
						<th><g:message code="pizza.dough.label" default="Dough" /></th>
					
						<g:sortableColumn property="createdOn" title="${message(code: 'pizza.createdOn.label', default: 'Created On')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'pizza.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pizzaInstanceList}" status="i" var="pizzaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pizzaInstance.id}">${fieldValue(bean: pizzaInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: pizzaInstance, field: "size")}</td>
					
						<td>${fieldValue(bean: pizzaInstance, field: "specialBorder")}</td>
					
						<td>${fieldValue(bean: pizzaInstance, field: "dough")}</td>
					
						<td><g:formatDate date="${pizzaInstance.createdOn}" /></td>
					
						<td>${fieldValue(bean: pizzaInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pizzaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
