<%@ page import="br.com.comerpizza.FlavorIngredient" %>



<div class="fieldcontain ${hasErrors(bean: flavorIngredientInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="flavorIngredient.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${br.com.comerpizza.Ingredient.list()}" optionKey="id" required="" value="${flavorIngredientInstance?.ingredient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorIngredientInstance, field: 'isAdditional', 'error')} ">
	<label for="isAdditional">
		<g:message code="flavorIngredient.isAdditional.label" default="Is Additional" />
		
	</label>
	<g:checkBox name="isAdditional" value="${flavorIngredientInstance?.isAdditional}" />
</div>

<div class="fieldcontain ${hasErrors(bean: flavorIngredientInstance, field: 'pizza', 'error')} required">
	<label for="pizza">
		<g:message code="flavorIngredient.pizza.label" default="Pizza" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pizza" name="pizza.id" from="${br.com.comerpizza.Pizza.list()}" optionKey="id" required="" value="${flavorIngredientInstance?.pizza?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorIngredientInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="flavorIngredient.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: flavorIngredientInstance, field: 'price')}" required=""/>
</div>

