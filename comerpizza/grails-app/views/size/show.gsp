
<%@ page import="br.com.comerpizza.Size" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'size.label', default: 'Size')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-size" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-size" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list size">
			
				<g:if test="${sizeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="size.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sizeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sizeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="size.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${sizeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sizeInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="size.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${sizeInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sizeInstance?.isHidden}">
				<li class="fieldcontain">
					<span id="isHidden-label" class="property-label"><g:message code="size.isHidden.label" default="Is Hidden" /></span>
					
						<span class="property-value" aria-labelledby="isHidden-label"><g:formatBoolean boolean="${sizeInstance?.isHidden}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sizeInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="size.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${sizeInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sizeInstance?.id}" />
					<g:link class="edit" action="edit" id="${sizeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
