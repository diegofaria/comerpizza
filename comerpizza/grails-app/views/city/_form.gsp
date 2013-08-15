<%@ page import="br.com.comerpizza.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="city.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="city.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="state" name="state.id" from="${br.com.comerpizza.State.list()}" optionKey="id" required="" value="${cityInstance?.state?.id}" class="many-to-one"/>
</div>

