
<%@ page import="com.rural.bank.Bill" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bill.label', default: 'Bill')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bill" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bill" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bill">
			
				<g:if test="${billInstance?.billNumber}">
				<li class="fieldcontain">
					<span id="billNumber-label" class="property-label"><g:message code="bill.billNumber.label" default="Bill Number" /></span>
					
						<span class="property-value" aria-labelledby="billNumber-label"><g:fieldValue bean="${billInstance}" field="billNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.customer}">
				<li class="fieldcontain">
					<span id="customer-label" class="property-label"><g:message code="bill.customer.label" default="Customer" /></span>
					
						<span class="property-value" aria-labelledby="customer-label"><g:link controller="customer" action="show" id="${billInstance?.customer?.id}">${billInstance?.customer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.balanceDue}">
				<li class="fieldcontain">
					<span id="balanceDue-label" class="property-label"><g:message code="bill.balanceDue.label" default="Balance Due" /></span>
					
						<span class="property-value" aria-labelledby="balanceDue-label"><g:fieldValue bean="${billInstance}" field="balanceDue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="bill.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${billInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${billInstance?.institution}">
				<li class="fieldcontain">
					<span id="institution-label" class="property-label"><g:message code="bill.institution.label" default="Institution" /></span>
					
						<span class="property-value" aria-labelledby="institution-label"><g:link controller="institution" action="show" id="${billInstance?.institution?.id}">${billInstance?.institution?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${billInstance?.id}" />
					<g:link class="edit" action="edit" id="${billInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
