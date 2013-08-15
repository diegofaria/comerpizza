<%@ page import="br.com.comerpizza.Size" %>



<div class="fieldcontain ${hasErrors(bean: sizeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="size.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${sizeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sizeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="size.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${sizeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sizeInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="size.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${sizeInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sizeInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="size.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${sizeInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sizeInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="size.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${sizeInstance?.photoUrl}"/>
</div>

