
<%@ page import="br.com.comerpizza.Drink" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drink.label', default: 'Drink')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-drink" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-drink" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list drink">
			
				<g:if test="${drinkInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="drink.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${drinkInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="drink.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${drinkInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.createdOn}">
				<li class="fieldcontain">
					<span id="createdOn-label" class="property-label"><g:message code="drink.createdOn.label" default="Created On" /></span>
					
						<span class="property-value" aria-labelledby="createdOn-label"><g:formatDate date="${drinkInstance?.createdOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="drink.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${drinkInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="drink.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${drinkInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.isHidden}">
				<li class="fieldcontain">
					<span id="isHidden-label" class="property-label"><g:message code="drink.isHidden.label" default="Is Hidden" /></span>
					
						<span class="property-value" aria-labelledby="isHidden-label"><g:formatBoolean boolean="${drinkInstance?.isHidden}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="drink.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${drinkInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.thumbnailUrl}">
				<li class="fieldcontain">
					<span id="thumbnailUrl-label" class="property-label"><g:message code="drink.thumbnailUrl.label" default="Thumbnail Url" /></span>
					
						<span class="property-value" aria-labelledby="thumbnailUrl-label"><g:fieldValue bean="${drinkInstance}" field="thumbnailUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.updatedOn}">
				<li class="fieldcontain">
					<span id="updatedOn-label" class="property-label"><g:message code="drink.updatedOn.label" default="Updated On" /></span>
					
						<span class="property-value" aria-labelledby="updatedOn-label"><g:formatDate date="${drinkInstance?.updatedOn}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${drinkInstance?.id}" />
					<g:link class="edit" action="edit" id="${drinkInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
