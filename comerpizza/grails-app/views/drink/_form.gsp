<%@ page import="br.com.comerpizza.Drink" %>



<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="drink.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${drinkInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="drink.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: drinkInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'createdOn', 'error')} required">
	<label for="createdOn">
		<g:message code="drink.createdOn.label" default="Created On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdOn" precision="day"  value="${drinkInstance?.createdOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="drink.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${drinkInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="drink.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${drinkInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="drink.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${drinkInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="drink.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${drinkInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'thumbnailUrl', 'error')} ">
	<label for="thumbnailUrl">
		<g:message code="drink.thumbnailUrl.label" default="Thumbnail Url" />
		
	</label>
	<g:textField name="thumbnailUrl" value="${drinkInstance?.thumbnailUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'updatedOn', 'error')} required">
	<label for="updatedOn">
		<g:message code="drink.updatedOn.label" default="Updated On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedOn" precision="day"  value="${drinkInstance?.updatedOn}"  />
</div>

