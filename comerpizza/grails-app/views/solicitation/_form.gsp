<%@ page import="br.com.comerpizza.Solicitation" %>



<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="solicitation.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" value="${fieldValue(bean: solicitationInstance, field: 'total')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="solicitation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${br.com.comerpizza.Status?.values()}" keys="${br.com.comerpizza.Status.values()*.name()}" required="" value="${solicitationInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'createdOn', 'error')} required">
	<label for="createdOn">
		<g:message code="solicitation.createdOn.label" default="Created On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdOn" precision="day"  value="${solicitationInstance?.createdOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="solicitation.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${br.com.comerpizza.Customer.list()}" optionKey="id" required="" value="${solicitationInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'desserts', 'error')} ">
	<label for="desserts">
		<g:message code="solicitation.desserts.label" default="Desserts" />
		
	</label>
	<g:select name="desserts" from="${br.com.comerpizza.Dessert.list()}" multiple="multiple" optionKey="id" size="5" value="${solicitationInstance?.desserts*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'drinks', 'error')} ">
	<label for="drinks">
		<g:message code="solicitation.drinks.label" default="Drinks" />
		
	</label>
	<g:select name="drinks" from="${br.com.comerpizza.Drink.list()}" multiple="multiple" optionKey="id" size="5" value="${solicitationInstance?.drinks*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="solicitation.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${solicitationInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'pizzaSolicitations', 'error')} ">
	<label for="pizzaSolicitations">
		<g:message code="solicitation.pizzaSolicitations.label" default="Pizza Solicitations" />
		
	</label>
	<g:select name="pizzaSolicitations" from="${br.com.comerpizza.PizzaSolicitation.list()}" multiple="multiple" optionKey="id" size="5" value="${solicitationInstance?.pizzaSolicitations*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitationInstance, field: 'updatedOn', 'error')} required">
	<label for="updatedOn">
		<g:message code="solicitation.updatedOn.label" default="Updated On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedOn" precision="day"  value="${solicitationInstance?.updatedOn}"  />
</div>

