<%@ page import="br.com.comerpizza.Flavor" %>



<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="flavor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${flavorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="flavor.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${flavorInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="flavor.ingredients.label" default="Ingredients" />
		
	</label>
	<g:select name="ingredients" from="${br.com.comerpizza.FlavorIngredient.list()}" multiple="multiple" optionKey="id" size="5" value="${flavorInstance?.ingredients*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="flavor.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${flavorInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="flavor.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${flavorInstance?.isHidden}" />
</div>

