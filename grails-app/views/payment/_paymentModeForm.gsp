<%@ page import="com.rural.bank.Payment" %>

<div class="fieldcontain ${hasErrors(bean: payment, field: 'paymentMode', 'error')} ">
	<label for="paymentMode">
		<g:message code="payment.paymentMode.label" default="Payment Mode" />
		
	</label>
	<g:select name="paymentMode" from="${payment.constraints.paymentMode.inList}" value="${payment?.paymentMode}" valueMessagePrefix="payment.paymentMode" noSelection="['': '']"/>
</div>

<input type="hidden" id="next" value="true"/>