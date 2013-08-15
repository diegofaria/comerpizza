<%@ page import="br.com.comerpizza.Dessert" %>



<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="dessert.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${dessertInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="dessert.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: dessertInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'createdOn', 'error')} required">
	<label for="createdOn">
		<g:message code="dessert.createdOn.label" default="Created On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdOn" precision="day"  value="${dessertInstance?.createdOn}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="dessert.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${dessertInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="dessert.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${dessertInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="dessert.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${dessertInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="dessert.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${dessertInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'thumbnailUrl', 'error')} ">
	<label for="thumbnailUrl">
		<g:message code="dessert.thumbnailUrl.label" default="Thumbnail Url" />
		
	</label>
	<g:textField name="thumbnailUrl" value="${dessertInstance?.thumbnailUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dessertInstance, field: 'updatedOn', 'error')} required">
	<label for="updatedOn">
		<g:message code="dessert.updatedOn.label" default="Updated On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedOn" precision="day"  value="${dessertInstance?.updatedOn}"  />
</div>

