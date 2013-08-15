<%@ page import="br.com.comerpizza.Dough" %>



<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="dough.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${doughInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="dough.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${doughInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="dough.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${doughInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'isHidden', 'error')} ">
	<label for="isHidden">
		<g:message code="dough.isHidden.label" default="Is Hidden" />
		
	</label>
	<g:checkBox name="isHidden" value="${doughInstance?.isHidden}" />
</div>

<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'photoUrl', 'error')} ">
	<label for="photoUrl">
		<g:message code="dough.photoUrl.label" default="Photo Url" />
		
	</label>
	<g:textField name="photoUrl" value="${doughInstance?.photoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: doughInstance, field: 'thumbnailUrl', 'error')} ">
	<label for="thumbnailUrl">
		<g:message code="dough.thumbnailUrl.label" default="Thumbnail Url" />
		
	</label>
	<g:textField name="thumbnailUrl" value="${doughInstance?.thumbnailUrl}"/>
</div>

