
<%@ page import="br.com.comerpizza.Flavor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flavor.label', default: 'Flavor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flavor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flavor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flavor">
			
				<g:if test="${flavorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="flavor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${flavorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="flavor.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${flavorInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorInstance?.ingredients}">
				<li class="fieldcontain">
					<span id="ingredients-label" class="property-label"><g:message code="flavor.ingredients.label" default="Ingredients" /></span>
					
						<g:each in="${flavorInstance.ingredients}" var="i">
						<span class="property-value" aria-labelledby="ingredients-label"><g:link controller="flavorIngredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${flavorInstance?.isActive}">
				<li class="fieldcontain">
					<span id="isActive-label" class="property-label"><g:message code="flavor.isActive.label" default="Is Active" /></span>
					
						<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${flavorInstance?.isActive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorInstance?.isHidden}">
				<li class="fieldcontain">
					<span id="isHidden-label" class="property-label"><g:message code="flavor.isHidden.label" default="Is Hidden" /></span>
					
						<span class="property-value" aria-labelledby="isHidden-label"><g:formatBoolean boolean="${flavorInstance?.isHidden}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${flavorInstance?.id}" />
					<g:link class="edit" action="edit" id="${flavorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
