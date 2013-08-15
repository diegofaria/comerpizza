
<%@ page import="br.com.comerpizza.Size" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'size.label', default: 'Size')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-size" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-size" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'size.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'size.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="isActive" title="${message(code: 'size.isActive.label', default: 'Is Active')}" />
					
						<g:sortableColumn property="isHidden" title="${message(code: 'size.isHidden.label', default: 'Is Hidden')}" />
					
						<g:sortableColumn property="photoUrl" title="${message(code: 'size.photoUrl.label', default: 'Photo Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sizeInstanceList}" status="i" var="sizeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sizeInstance.id}">${fieldValue(bean: sizeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: sizeInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${sizeInstance.isActive}" /></td>
					
						<td><g:formatBoolean boolean="${sizeInstance.isHidden}" /></td>
					
						<td>${fieldValue(bean: sizeInstance, field: "photoUrl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sizeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
