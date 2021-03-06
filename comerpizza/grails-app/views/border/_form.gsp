<%@ page import="br.com.comerpizza.Border" %>



<div class="fieldcontain ${hasErrors(bean: borderInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="border.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${borderInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: borderInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="border.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${borderInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: borderInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="border.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: borderInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: borderInstance, field: 'thumbnailUrl', 'error')} ">
	<label for="thumbnailUrl">
		<g:message code="border.thumbnailUrl.label" default="Thumbnail Url" />
		
	</label>
	<g:textField name="thumbnailUrl" value="${borderInstance?.thumbnailUrl}"/>
</div>

