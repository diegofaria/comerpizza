
<%@ page import="br.com.comerpizza.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-address" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="address.city.label" default="City" /></th>
					
						<g:sortableColumn property="complement" title="${message(code: 'address.complement.label', default: 'Complement')}" />
					
						<g:sortableColumn property="neighborhood" title="${message(code: 'address.neighborhood.label', default: 'Neighborhood')}" />
					
						<g:sortableColumn property="number" title="${message(code: 'address.number.label', default: 'Number')}" />
					
						<g:sortableColumn property="street" title="${message(code: 'address.street.label', default: 'Street')}" />
					
						<g:sortableColumn property="zipCode" title="${message(code: 'address.zipCode.label', default: 'Zip Code')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${addressInstanceList}" status="i" var="addressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "city")}</g:link></td>
					
						<td>${fieldValue(bean: addressInstance, field: "complement")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "neighborhood")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "number")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "street")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "zipCode")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${addressInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
