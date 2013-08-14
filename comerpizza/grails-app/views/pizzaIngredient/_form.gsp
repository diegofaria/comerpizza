<%@ page import="br.com.comerpizza.PizzaIngredient" %>



<div class="fieldcontain ${hasErrors(bean: pizzaIngredientInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="pizzaIngredient.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${br.com.comerpizza.Ingredient.list()}" optionKey="id" required="" value="${pizzaIngredientInstance?.ingredient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaIngredientInstance, field: 'isExtra', 'error')} ">
	<label for="isExtra">
		<g:message code="pizzaIngredient.isExtra.label" default="Is Extra" />
		
	</label>
	<g:checkBox name="isExtra" value="${pizzaIngredientInstance?.isExtra}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pizzaIngredientInstance, field: 'pizza', 'error')} required">
	<label for="pizza">
		<g:message code="pizzaIngredient.pizza.label" default="Pizza" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pizza" name="pizza.id" from="${br.com.comerpizza.Pizza.list()}" optionKey="id" required="" value="${pizzaIngredientInstance?.pizza?.id}" class="many-to-one"/>
</div>

