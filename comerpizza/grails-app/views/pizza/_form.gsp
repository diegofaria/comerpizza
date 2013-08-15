<%@ page import="br.com.comerpizza.Pizza" %>



<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="pizza.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${pizzaInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'flavor', 'error')} required">
	<label for="flavor">
		<g:message code="pizza.flavor.label" default="Flavor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="flavor" name="flavor.id" from="${br.com.comerpizza.Flavor.list()}" optionKey="id" required="" value="${pizzaInstance?.flavor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="pizza.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="size" name="size.id" from="${br.com.comerpizza.Size.list()}" optionKey="id" required="" value="${pizzaInstance?.size?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="pizza.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: pizzaInstance, field: 'price')}" required=""/>
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

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="pizza.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${pizzaInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'thumbnailUrl', 'error')} ">
	<label for="thumbnailUrl">
		<g:message code="pizza.thumbnailUrl.label" default="Thumbnail Url" />
		
	</label>
	<g:textField name="thumbnailUrl" value="${pizzaInstance?.thumbnailUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaInstance, field: 'updatedOn', 'error')} required">
	<label for="updatedOn">
		<g:message code="pizza.updatedOn.label" default="Updated On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedOn" precision="day"  value="${pizzaInstance?.updatedOn}"  />
</div>

