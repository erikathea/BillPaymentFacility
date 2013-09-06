<%@ page import="com.rural.bank.Cheque" %>



<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="cheque.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" required="" value="${chequeInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="cheque.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${chequeInstance.constraints.type.inList}" value="${chequeInstance?.type}" valueMessagePrefix="cheque.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="cheque.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${chequeInstance?.date}"  />
</div>

