
<%@ page import="br.com.comerpizza.Solicitation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitation.label', default: 'Solicitation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solicitation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solicitation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solicitation">
			
				<g:if test="${solicitationInstance?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="solicitation.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${solicitationInstance}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="solicitation.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${solicitationInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.createdOn}">
				<li class="fieldcontain">
					<span id="createdOn-label" class="property-label"><g:message code="solicitation.createdOn.label" default="Created On" /></span>
					
						<span class="property-value" aria-labelledby="createdOn-label"><g:formatDate date="${solicitationInstance?.createdOn}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="solicitation.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${solicitationInstance?.customer?.id}">${solicitationInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.desserts}">
				<li class="fieldcontain">
					<span id="desserts-label" class="property-label"><g:message code="solicitation.desserts.label" default="Desserts" /></span>
					
						<g:each in="${solicitationInstance.desserts}" var="d">
						<span class="property-value" aria-labelledby="desserts-label"><g:link controller="dessert" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.drinks}">
				<li class="fieldcontain">
					<span id="drinks-label" class="property-label"><g:message code="solicitation.drinks.label" default="Drinks" /></span>
					
						<g:each in="${solicitationInstance.drinks}" var="d">
						<span class="property-value" aria-labelledby="drinks-label"><g:link controller="drink" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="solicitation.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${solicitationInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.pizzaSolicitations}">
				<li class="fieldcontain">
					<span id="pizzaSolicitations-label" class="property-label"><g:message code="solicitation.pizzaSolicitations.label" default="Pizza Solicitations" /></span>
					
						<g:each in="${solicitationInstance.pizzaSolicitations}" var="p">
						<span class="property-value" aria-labelledby="pizzaSolicitations-label"><g:link controller="pizzaSolicitation" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitationInstance?.updatedOn}">
				<li class="fieldcontain">
					<span id="updatedOn-label" class="property-label"><g:message code="solicitation.updatedOn.label" default="Updated On" /></span>
					
						<span class="property-value" aria-labelledby="updatedOn-label"><g:formatDate date="${solicitationInstance?.updatedOn}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solicitationInstance?.id}" />
					<g:link class="edit" action="edit" id="${solicitationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
