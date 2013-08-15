<%@ page import="br.com.comerpizza.PizzaType" %>



<div class="fieldcontain ${hasErrors(bean: pizzaTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="pizzaType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${pizzaTypeInstance?.name}"/>
</div>

