
<%@ page import="br.com.comerpizza.State" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-state" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-state" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list state">
			
				<g:if test="${stateInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="state.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${stateInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stateInstance?.acronym}">
				<li class="fieldcontain">
					<span id="acronym-label" class="property-label"><g:message code="state.acronym.label" default="Acronym" /></span>
					
						<span class="property-value" aria-labelledby="acronym-label"><g:fieldValue bean="${stateInstance}" field="acronym"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stateInstance?.cities}">
				<li class="fieldcontain">
					<span id="cities-label" class="property-label"><g:message code="state.cities.label" default="Cities" /></span>
					
						<g:each in="${stateInstance.cities}" var="c">
						<span class="property-value" aria-labelledby="cities-label"><g:link controller="city" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stateInstance?.id}" />
					<g:link class="edit" action="edit" id="${stateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
