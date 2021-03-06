
<%@ page import="com.rural.bank.Bank" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bank" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bank" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bank">
			
				<g:if test="${bankInstance?.branchName}">
				<li class="fieldcontain">
					<span id="branchName-label" class="property-label"><g:message code="bank.branchName.label" default="Branch Name" /></span>
					
						<span class="property-value" aria-labelledby="branchName-label"><g:fieldValue bean="${bankInstance}" field="branchName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="bank.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${bankInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bankInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="bank.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${bankInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bankInstance?.id}" />
					<g:link class="edit" action="edit" id="${bankInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
