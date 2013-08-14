<%@ page import="br.com.comerpizza.Pizza" %>



<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="pizza.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${pizzaInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="pizza.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="size" name="size.id" from="${br.com.comerpizza.Size.list()}" optionKey="id" required="" value="${pizzaInstance?.size?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'specialBorder', 'error')} ">
	<label for="specialBorder">
		<g:message code="pizza.specialBorder.label" default="Special Border" />
		
	</label>
	<g:select id="specialBorder" name="specialBorder.id" from="${br.com.comerpizza.Border.list()}" optionKey="id" value="${pizzaInstance?.specialBorder?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'dough', 'error')} ">
	<label for="dough">
		<g:message code="pizza.dough.label" default="Dough" />
		
	</label>
	<g:select id="dough" name="dough.id" from="${br.com.comerpizza.Dough.list()}" optionKey="id" value="${pizzaInstance?.dough?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'createdOn', 'error')} required">
	<label for="createdOn">
		<g:message code="pizza.createdOn.label" default="Created On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdOn" precision="day"  value="${pizzaInstance?.createdOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pizza.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${pizzaInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'flavors', 'error')} ">
	<label for="flavors">
		<g:message code="pizza.flavors.label" default="Flavors" />
		
	</label>
	<g:select name="flavors" from="${br.com.comerpizza.Flavor.list()}" multiple="multiple" optionKey="id" size="5" value="${pizzaInstance?.flavors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="pizza.ingredients.label" default="Ingredients" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pizzaInstance?.ingredients?}" var="i">
    <li><g:link controller="pizzaIngredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pizzaIngredient" action="create" params="['pizza.id': pizzaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="pizza.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${pizzaInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="pizza.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${pizzaInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="pizza.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: pizzaInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'updatedOn', 'error')} required">
	<label for="updatedOn">
		<g:message code="pizza.updatedOn.label" default="Updated On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedOn" precision="day"  value="${pizzaInstance?.updatedOn}"  />
</div>

