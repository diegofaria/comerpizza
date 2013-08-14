<%@ page import="br.com.comerpizza.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="ingredient.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${ingredientInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="ingredient.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${ingredientInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="ingredient.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${ingredientInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="ingredient.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: ingredientInstance, field: 'price')}" required=""/>
</div>

