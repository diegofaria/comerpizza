
<%@ page import="br.com.comerpizza.Flavor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flavor.label', default: 'Flavor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-flavor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-flavor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'flavor.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'flavor.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'flavor.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'flavor.isHidden.label', default: 'Is Hidden')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${flavorInstanceList}" status="i" var="flavorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${flavorInstance.id}">${fieldValue(bean: flavorInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: flavorInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${flavorInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${flavorInstance.isHidden}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${flavorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
