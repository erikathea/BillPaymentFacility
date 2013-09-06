
<%@ page import="com.rural.bank.Teller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teller.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-teller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="show-teller" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teller">

				<g:if test="${tellerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="teller.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${tellerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="teller.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><%--<g:fieldValue bean="${tellerInstance}" field="password"/>
						--%>*******</span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="teller.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${tellerInstance?.branch?.id}">${tellerInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="teller.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${tellerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.employeeNumber}">
				<li class="fieldcontain">
					<span id="employeeNumber-label" class="property-label"><g:message code="teller.employeeNumber.label" default="Employee Number" /></span>
					
						<span class="property-value" aria-labelledby="employeeNumber-label"><g:fieldValue bean="${tellerInstance}" field="employeeNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="teller.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${tellerInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="teller.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${tellerInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="teller.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${tellerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tellerInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="teller.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${tellerInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tellerInstance?.id}" />
					<g:hiddenField name="userRoleId" value="${userRoleInstance?.role?.id}"/>
					<g:link class="edit" action="edit" id="${tellerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
