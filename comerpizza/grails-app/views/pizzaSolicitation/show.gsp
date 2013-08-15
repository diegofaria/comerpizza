
<%@ page import="br.com.comerpizza.PizzaSolicitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pizzaSolicitation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pizzaSolicitation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pizzaSolicitation">
			
				<g:if test="${pizzaSolicitationInstance?.pizza}">
				<li class="fieldcontain">
					<span id="pizza-label" class="property-label"><g:message code="pizzaSolicitation.pizza.label" default="Pizza" /></span>
					
						<span class="property-value" aria-labelledby="pizza-label"><g:link controller="pizza" action="show" id="${pizzaSolicitationInstance?.pizza?.id}">${pizzaSolicitationInstance?.pizza?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaSolicitationInstance?.specialBorder}">
				<li class="fieldcontain">
					<span id="specialBorder-label" class="property-label"><g:message code="pizzaSolicitation.specialBorder.label" default="Special Border" /></span>
					
						<span class="property-value" aria-labelledby="specialBorder-label"><g:link controller="border" action="show" id="${pizzaSolicitationInstance?.specialBorder?.id}">${pizzaSolicitationInstance?.specialBorder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaSolicitationInstance?.dough}">
				<li class="fieldcontain">
					<span id="dough-label" class="property-label"><g:message code="pizzaSolicitation.dough.label" default="Dough" /></span>
					
						<span class="property-value" aria-labelledby="dough-label"><g:link controller="dough" action="show" id="${pizzaSolicitationInstance?.dough?.id}">${pizzaSolicitationInstance?.dough?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaSolicitationInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="pizzaSolicitation.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${pizzaSolicitationInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pizzaSolicitationInstance?.flavors}">
				<li class="fieldcontain">
					<span id="flavors-label" class="property-label"><g:message code="pizzaSolicitation.flavors.label" default="Flavors" /></span>
					
						<g:each in="${pizzaSolicitationInstance.flavors}" var="f">
						<span class="property-value" aria-labelledby="flavors-label"><g:link controller="flavor" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pizzaSolicitationInstance?.id}" />
					<g:link class="edit" action="edit" id="${pizzaSolicitationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
