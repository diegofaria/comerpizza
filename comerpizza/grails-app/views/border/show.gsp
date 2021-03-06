
<%@ page import="br.com.comerpizza.Border" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'border.label', default: 'Border')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-border" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-border" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list border">
			
				<g:if test="${borderInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="border.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${borderInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${borderInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="border.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${borderInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${borderInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="border.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${borderInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${borderInstance?.thumbnailUrl}">
				<li class="fieldcontain">
					<span id="thumbnailUrl-label" class="property-label"><g:message code="border.thumbnailUrl.label" default="Thumbnail Url" /></span>
					
						<span class="property-value" aria-labelledby="thumbnailUrl-label"><g:fieldValue bean="${borderInstance}" field="thumbnailUrl"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${borderInstance?.id}" />
					<g:link class="edit" action="edit" id="${borderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
