<%@ page import="com.rural.bank.Payment" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="create-payment" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${paymentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${paymentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<%--<g:set var="chequeInstance" value="new Cheque(number:123456)"/>
			<g:render template="chequeForm"/>--%>
			<g:if test="${chequeInstance}">
				<g:form action="saveCheque">
					<fieldset class="form">
						<g:render template="chequeForm"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
					</fieldset>
				</g:form>
			</g:if>
			<g:elseif test="${paymentInstance}">
				<g:form action="save">
					<fieldset class="form">
						<g:render template="form"/> 
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</g:elseif>
					
			<g:else>
			    <g:form action="create">
                    <fieldset class="form">
                        <g:render template="paymentModeForm"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.next.label', default: 'Next')}" />
                    </fieldset>
                </g:form>
			</g:else>						
		</div>
	</body>
</html>