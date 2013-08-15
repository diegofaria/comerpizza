<%@ page import="br.com.comerpizza.PizzaSolicitation" %>



<div class="fieldcontain ${hasErrors(bean: pizzaSolicitationInstance, field: 'pizza', 'error')} required">
	<label for="pizza">
		<g:message code="pizzaSolicitation.pizza.label" default="Pizza" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pizza" name="pizza.id" from="${br.com.comerpizza.Pizza.list()}" optionKey="id" required="" value="${pizzaSolicitationInstance?.pizza?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaSolicitationInstance, field: 'specialBorder', 'error')} ">
	<label for="specialBorder">
		<g:message code="pizzaSolicitation.specialBorder.label" default="Special Border" />
		
	</label>
	<g:select id="specialBorder" name="specialBorder.id" from="${br.com.comerpizza.Border.list()}" optionKey="id" value="${pizzaSolicitationInstance?.specialBorder?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaSolicitationInstance, field: 'dough', 'error')} ">
	<label for="dough">
		<g:message code="pizzaSolicitation.dough.label" default="Dough" />
		
	</label>
	<g:select id="dough" name="dough.id" from="${br.com.comerpizza.Dough.list()}" optionKey="id" value="${pizzaSolicitationInstance?.dough?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaSolicitationInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="pizzaSolicitation.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: pizzaSolicitationInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaSolicitationInstance, field: 'flavors', 'error')} ">
	<label for="flavors">
		<g:message code="pizzaSolicitation.flavors.label" default="Flavors" />
		
	</label>
	<g:select name="flavors" from="${br.com.comerpizza.Flavor.list()}" multiple="multiple" optionKey="id" size="5" value="${pizzaSolicitationInstance?.flavors*.id}" class="many-to-many"/>
</div>

