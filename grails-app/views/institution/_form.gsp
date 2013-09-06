<%@ page import="com.rural.bank.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="institution.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${institutionInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${institutionInstance?.name}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'customers', 'error')} ">
	<label for="customers">
		<g:message code="institution.customers.label" default="Customers" />
		
	</label>
	<g:select name="customers" from="${com.rural.bank.Customer.list()}" multiple="multiple" optionKey="id" size="5" value="${institutionInstance?.customers*.id}" class="many-to-many"/>
--%>
</div>

