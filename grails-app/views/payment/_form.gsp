<%@ page import="com.rural.bank.Payment" %>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'transactionDate', 'error')} required">
	<label for="transactionDate">
		<g:message code="payment.transactionDate.label" default="Transaction Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="transactionDate" precision="day"  value="${paymentInstance?.transactionDate?:new Date()}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'transactionNumber', 'error')} required">
	<label for="transactionNumber">
		<g:message code="payment.transactionNumber.label" default="Transaction Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="transactionNumber" required="" value="${paymentInstance?.transactionNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="payment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: paymentInstance, field: 'amount')}" required=""/>
</div>

<%--<div>
    <h1>Bill Details</h1>
    <g:set var="billInstance" value="${paymentInstance.bill}"/>
    <g:render template="billForm"/>
    <g:hiddenField name="bill" value="${paymentInstance.bill}"/>
</div>




--%><div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentMode', 'error')} ">
	<label for="paymentMode">
		<g:message code="payment.paymentMode.label" default="Payment Mode" />

	</label>
	<g:if test="${paymentInstance?.paymentMode!='Check'}">
	    <g:select name="paymentMode" from="${paymentInstance.constraints.paymentMode.inList}" value="${paymentInstance?.paymentMode}" valueMessagePrefix="payment.paymentMode" noSelection="['': '']"/>
	</g:if>
	<g:else>
	    ${paymentInstance.paymentMode}
	    <g:hiddenField name="paymentMode" value="Check"/>
	</g:else>
</div>


<g:if test="paymentInstance?.check">
    <h1>Check Details</h1>
    <g:set var="chequeInstance" value="${paymentInstance.check}"/>
    <g:hiddenField name="cheque" value="${paymentInstance.check?.id}"/>
    <g:render template="cheque"/>
</g:if>