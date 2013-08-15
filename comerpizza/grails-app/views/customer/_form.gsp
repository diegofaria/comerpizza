<%@ page import="br.com.comerpizza.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="customer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${customerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="customer.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${customerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="customer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${customerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'addresses', 'error')} ">
	<label for="addresses">
		<g:message code="customer.addresses.label" default="Addresses" />
		
	</label>
	<g:select name="addresses" from="${br.com.comerpizza.Address.list()}" multiple="multiple" optionKey="id" size="5" value="${customerInstance?.addresses*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="customer.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${customerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone">
		<g:message code="customer.mobilePhone.label" default="Mobile Phone" />
		
	</label>
	<g:textField name="mobilePhone" value="${customerInstance?.mobilePhone}"/>
</div>

