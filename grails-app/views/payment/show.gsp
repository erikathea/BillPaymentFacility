
<%@ page import="com.rural.bank.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payment">
			
				<g:if test="${paymentInstance?.check}">
				<li class="fieldcontain">
					<span id="check-label" class="property-label"><g:message code="payment.check.label" default="Check" /></span>
					
						<span class="property-value" aria-labelledby="check-label"><g:link controller="cheque" action="show" id="${paymentInstance?.check?.id}">${paymentInstance?.check?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.transactionNumber}">
				<li class="fieldcontain">
					<span id="transactionNumber-label" class="property-label"><g:message code="payment.transactionNumber.label" default="Transaction Number" /></span>
					
						<span class="property-value" aria-labelledby="transactionNumber-label"><g:fieldValue bean="${paymentInstance}" field="transactionNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentMode}">
				<li class="fieldcontain">
					<span id="paymentMode-label" class="property-label"><g:message code="payment.paymentMode.label" default="Payment Mode" /></span>
					
						<span class="property-value" aria-labelledby="paymentMode-label"><g:fieldValue bean="${paymentInstance}" field="paymentMode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="payment.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${paymentInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<%--<g:if test="${paymentInstance?.bill}">
				<li class="fieldcontain">
					<span id="bill-label" class="property-label"><g:message code="payment.bill.label" default="Bill" /></span>
					
						<span class="property-value" aria-labelledby="bill-label"><g:link controller="bill" action="show" id="${paymentInstance?.bill?.id}">${paymentInstance?.bill?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				--%><g:if test="${paymentInstance?.transactionDate}">
				<li class="fieldcontain">
					<span id="transactionDate-label" class="property-label"><g:message code="payment.transactionDate.label" default="Transaction Date" /></span>
					
						<span class="property-value" aria-labelledby="transactionDate-label"><g:formatDate date="${paymentInstance?.transactionDate}" /></span>
				</li>
				</g:if>
			</ol>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${paymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		
		<%--<g:include controller="bill" action="show" id="${paymentInstance?.bill?.id}"/>
		
	--%></body>
</html>