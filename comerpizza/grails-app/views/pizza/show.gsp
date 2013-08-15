
<%@ page import="br.com.comerpizza.Pizza" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pizza.label', default: 'Pizza')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pizza" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pizza" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pizza">
			
				<g:if test="${pizzaInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="pizza.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${pizzaInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.flavor}">
				<li class="fieldcontain">
					<span id="flavor-label" class="property-label"><g:message code="pizza.flavor.label" default="Flavor" /></span>
					
						<span class="property-value" aria-labelledby="flavor-label"><g:link controller="flavor" action="show" id="${pizzaInstance?.flavor?.id}">${pizzaInstance?.flavor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="pizza.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:link controller="size" action="show" id="${pizzaInstance?.size?.id}">${pizzaInstance?.size?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="pizza.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${pizzaInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.createdOn}">
				<li class="fieldcontain">
					<span id="createdOn-label" class="property-label"><g:message code="pizza.createdOn.label" default="Created On" /></span>
					
						<span class="property-value" aria-labelledby="createdOn-label"><g:formatDate date="${pizzaInstance?.createdOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="pizza.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${pizzaInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="pizza.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${pizzaInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.isHidden}">
				<li class="fieldcontain">
					<span id="isHidden-label" class="property-label"><g:message code="pizza.isHidden.label" default="Is Hidden" /></span>
					
						<span class="property-value" aria-labelledby="isHidden-label"><g:formatBoolean boolean="${pizzaInstance?.isHidden}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.photoUrl}">
				<li class="fieldcontain">
					<span id="photoUrl-label" class="property-label"><g:message code="pizza.photoUrl.label" default="Photo Url" /></span>
					
						<span class="property-value" aria-labelledby="photoUrl-label"><g:fieldValue bean="${pizzaInstance}" field="photoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.thumbnailUrl}">
				<li class="fieldcontain">
					<span id="thumbnailUrl-label" class="property-label"><g:message code="pizza.thumbnailUrl.label" default="Thumbnail Url" /></span>
					
						<span class="property-value" aria-labelledby="thumbnailUrl-label"><g:fieldValue bean="${pizzaInstance}" field="thumbnailUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaInstance?.updatedOn}">
				<li class="fieldcontain">
					<span id="updatedOn-label" class="property-label"><g:message code="pizza.updatedOn.label" default="Updated On" /></span>
					
						<span class="property-value" aria-labelledby="updatedOn-label"><g:formatDate date="${pizzaInstance?.updatedOn}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pizzaInstance?.id}" />
					<g:link class="edit" action="edit" id="${pizzaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
