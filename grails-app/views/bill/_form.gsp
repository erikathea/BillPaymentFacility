<%@ page import="com.rural.bank.Bill" %>



<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'billNumber', 'error')} required">
	<label for="billNumber">
		<g:message code="bill.billNumber.label" default="Bill Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="billNumber" required="" value="${billInstance?.billNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="bill.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="customer" name="customer.id" from="${com.rural.bank.Customer.list()}" optionKey="id" required="" value="${billInstance?.customer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'balanceDue', 'error')} required">
	<label for="balanceDue">
		<g:message code="bill.balanceDue.label" default="Balance Due" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balanceDue" value="${fieldValue(bean: billInstance, field: 'balanceDue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'dueDate', 'error')} ">
	<label for="dueDate">
		<g:message code="bill.dueDate.label" default="Due Date" />
		
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${billInstance?.dueDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: billInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="bill.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${com.rural.bank.Institution.list()}" optionKey="id" required="" value="${billInstance?.institution?.id}" class="many-to-one"/>
</div>

