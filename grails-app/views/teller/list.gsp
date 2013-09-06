
<%@ page import="com.rural.bank.Teller" %>
<%@ page import="com.rural.bank.UserRole" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teller.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-teller" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-teller" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="nav" role="navigation">
            			<ul>
            				<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--%>
            				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            			</ul>
            		</div>
			<table>
				<thead>
					<tr>
					

						
						<g:sortableColumn property="username" title="${message(code: 'teller.username.label', default: 'Username')}" />
					    <g:sortableColumn property="name" title="${message(code: 'teller.name.label', default: 'Name')}" />
						<%--<g:sortableColumn property="password" title="${message(code: 'teller.password.label', default: 'Password')}" />	--%>
					
						<th><g:message code="userRole.role.label" default="Role" /></th>
						
						<th><g:message code="teller.branch.label" default="Branch" /></th>

						<g:sortableColumn property="employeeNumber" title="${message(code: 'teller.employeeNumber.label', default: 'Employee Number')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'teller.accountEnabled.label', default: 'Account Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tellerInstanceList}" status="i" var="tellerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


											
						<td><g:link action="show" id="${tellerInstance.id}">${fieldValue(bean: tellerInstance, field: "username")}</g:link></td>
					    <td>${fieldValue(bean: tellerInstance, field: "name")}</td>
						<%--<td>${fieldValue(bean: tellerInstance, field: "password")}</td>--%>
						
						<td>${(UserRole.findByUser(tellerInstance))?.role}</td>
						

						<td>${fieldValue(bean: tellerInstance, field: "branch")}</td>
						
						<td>${fieldValue(bean: tellerInstance, field: "employeeNumber")}</td>
					
						<td><g:formatBoolean boolean="${tellerInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tellerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
