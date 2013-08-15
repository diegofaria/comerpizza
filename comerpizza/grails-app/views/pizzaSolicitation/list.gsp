
<%@ page import="br.com.comerpizza.PizzaSolicitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pizzaSolicitation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pizzaSolicitation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="pizzaSolicitation.pizza.label" default="Pizza" /></th>
					
						<th><g:message code="pizzaSolicitation.specialBorder.label" default="Special Border" /></th>
					
						<th><g:message code="pizzaSolicitation.dough.label" default="Dough" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'pizzaSolicitation.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pizzaSolicitationInstanceList}" status="i" var="pizzaSolicitationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pizzaSolicitationInstance.id}">${fieldValue(bean: pizzaSolicitationInstance, field: "pizza")}</g:link></td>
					
						<td>${fieldValue(bean: pizzaSolicitationInstance, field: "specialBorder")}</td>
					
						<td>${fieldValue(bean: pizzaSolicitationInstance, field: "dough")}</td>
					
						<td>${fieldValue(bean: pizzaSolicitationInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pizzaSolicitationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
