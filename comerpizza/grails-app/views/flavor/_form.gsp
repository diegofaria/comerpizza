<%@ page import="br.com.comerpizza.Flavor" %>



<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="flavor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${flavorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'imageUrl', 'error')} required">
	<label for="imageUrl">
		<g:message code="flavor.imageUrl.label" default="Image Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="imageUrl" required="" value="${flavorInstance?.imageUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'thumbnailUrl', 'error')} required">
	<label for="thumbnailUrl">
		<g:message code="flavor.thumbnailUrl.label" default="Thumbnail Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="thumbnailUrl" required="" value="${flavorInstance?.thumbnailUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: flavorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="flavor.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${flavorInstance?.description}"/>
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

