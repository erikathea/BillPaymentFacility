<%@ page import="com.rural.bank.Cheque" %>



<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="cheque.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	${chequeInstance?.number}
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="cheque.type.label" default="Type" />

	</label>
	${chequeInstance?.type}
</div>

<div class="fieldcontain ${hasErrors(bean: chequeInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="cheque.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	${chequeInstance?.date}
</div>

