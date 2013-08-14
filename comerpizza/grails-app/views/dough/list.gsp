
<%@ page import="br.com.comerpizza.Dough" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dough.label', default: 'Dough')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dough" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dough" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'dough.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'dough.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="imageUrl" title="${message(code: 'dough.imageUrl.label', default: 'Image Url')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'dough.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'dough.isHidden.label', default: 'Is Hidden')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${doughInstanceList}" status="i" var="doughInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${doughInstance.id}">${fieldValue(bean: doughInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: doughInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: doughInstance, field: "imageUrl")}</td>
					
						<td><g:formatBoolean boolean="${doughInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${doughInstance.isHidden}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${doughInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
