<%@ page import="com.rural.bank.Teller" %>
<%@ page import="com.rural.bank.UserRole" %>

<%--<sub>Notes: *Use javascript to hide password.
	** You may also install spring-security-ui plugin.</sub>

--%><div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="teller.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${tellerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="teller.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<input id="pw" onclick="document.getElementById('pw').type='password';
document.getElementById('pw').value='';" type="text" name="password" value="${tellerInstance?.password}" required="">
	<%--<g:textField name="password" required="" value="${tellerInstance?.password}"/>--%>
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="teller.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.rural.bank.Branch.list()}" optionKey="id" required="" value="${tellerInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="teller.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tellerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'employeeNumber', 'error')} required">
	<label for="employeeNumber">
		<g:message code="teller.employeeNumber.label" default="Employee Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="employeeNumber" required="" value="${tellerInstance?.employeeNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="userRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${com.rural.bank.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
	<g:hiddenField name="userRoleId" value="${userRoleInstance?.role?.id}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="teller.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${tellerInstance?.enabled?:true}" />
</div>

<%--<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="teller.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${tellerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="teller.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${tellerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tellerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="teller.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${tellerInstance?.passwordExpired}" />
</div>

--%>