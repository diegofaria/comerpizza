
<%@ page import="br.com.comerpizza.Dessert" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dessert.label', default: 'Dessert')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dessert" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dessert" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dessert">
			
				<g:if test="${dessertInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="dessert.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dessertInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="dessert.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${dessertInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.createdOn}">
				<li class="fieldcontain">
					<span id="createdOn-label" class="property-label"><g:message code="dessert.createdOn.label" default="Created On" /></span>
					
						<span class="property-value" aria-labelledby="createdOn-label"><g:formatDate date="${dessertInstance?.createdOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="dessert.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${dessertInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="dessert.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${dessertInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.isHidden}">
				<li class="fieldcontain">
					<span id="isHidden-label" class="property-label"><g:message code="dessert.isHidden.label" default="Is Hidden" /></span>
					
						<span class="property-value" aria-labelledby="isHidden-label"><g:formatBoolean boolean="${dessertInstance?.isHidden}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="dessert.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${dessertInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.thumbnailUrl}">
				<li class="fieldcontain">
					<span id="thumbnailUrl-label" class="property-label"><g:message code="dessert.thumbnailUrl.label" default="Thumbnail Url" /></span>
					
						<span class="property-value" aria-labelledby="thumbnailUrl-label"><g:fieldValue bean="${dessertInstance}" field="thumbnailUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dessertInstance?.updatedOn}">
				<li class="fieldcontain">
					<span id="updatedOn-label" class="property-label"><g:message code="dessert.updatedOn.label" default="Updated On" /></span>
					
						<span class="property-value" aria-labelledby="updatedOn-label"><g:formatDate date="${dessertInstance?.updatedOn}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dessertInstance?.id}" />
					<g:link class="edit" action="edit" id="${dessertInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
