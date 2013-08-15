
<%@ page import="br.com.comerpizza.FlavorIngredient" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'flavorIngredient.label', default: 'FlavorIngredient')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-flavorIngredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-flavorIngredient" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list flavorIngredient">
			
				<g:if test="${flavorIngredientInstance?.ingredient}">
				<li class="fieldcontain">
					<span id="ingredient-label" class="property-label"><g:message code="flavorIngredient.ingredient.label" default="Ingredient" /></span>
					
						<span class="property-value" aria-labelledby="ingredient-label"><g:link controller="ingredient" action="show" id="${flavorIngredientInstance?.ingredient?.id}">${flavorIngredientInstance?.ingredient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorIngredientInstance?.isAdditional}">
				<li class="fieldcontain">
					<span id="isAdditional-label" class="property-label"><g:message code="flavorIngredient.isAdditional.label" default="Is Additional" /></span>
					
						<span class="property-value" aria-labelledby="isAdditional-label"><g:formatBoolean boolean="${flavorIngredientInstance?.isAdditional}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorIngredientInstance?.pizza}">
				<li class="fieldcontain">
					<span id="pizza-label" class="property-label"><g:message code="flavorIngredient.pizza.label" default="Pizza" /></span>
					
						<span class="property-value" aria-labelledby="pizza-label"><g:link controller="pizza" action="show" id="${flavorIngredientInstance?.pizza?.id}">${flavorIngredientInstance?.pizza?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${flavorIngredientInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="flavorIngredient.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${flavorIngredientInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${flavorIngredientInstance?.id}" />
					<g:link class="edit" action="edit" id="${flavorIngredientInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
