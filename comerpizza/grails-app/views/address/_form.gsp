<%@ page import="br.com.comerpizza.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${br.com.comerpizza.City.list()}" optionKey="id" required="" value="${addressInstance?.city?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'complement', 'error')} ">
	<label for="complement">
		<g:message code="address.complement.label" default="Complement" />
		
	</label>
	<g:textField name="complement" value="${addressInstance?.complement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'neighborhood', 'error')} ">
	<label for="neighborhood">
		<g:message code="address.neighborhood.label" default="Neighborhood" />
		
	</label>
	<g:textField name="neighborhood" value="${addressInstance?.neighborhood}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'number', 'error')} ">
	<label for="number">
		<g:message code="address.number.label" default="Number" />
		
	</label>
	<g:textField name="number" value="${addressInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="address.street.label" default="Street" />
		
	</label>
	<g:textField name="street" value="${addressInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zipCode', 'error')} ">
	<label for="zipCode">
		<g:message code="address.zipCode.label" default="Zip Code" />
		
	</label>
	<g:textField name="zipCode" value="${addressInstance?.zipCode}"/>
</div>

