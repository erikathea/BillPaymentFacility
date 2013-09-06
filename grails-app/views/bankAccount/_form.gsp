<%@ page import="com.rural.bank.BankAccount" %>



<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="bankAccount.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${com.rural.bank.Branch.list()}" optionKey="id" required="" value="${bankAccountInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'accountNumber', 'error')} required">
	<label for="accountNumber">
		<g:message code="bankAccount.accountNumber.label" default="Account Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="accountNumber" required="" value="${bankAccountInstance?.accountNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'accountBalance', 'error')} required">
	<label for="accountBalance">
		<g:message code="bankAccount.accountBalance.label" default="Account Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="accountBalance" value="${fieldValue(bean: bankAccountInstance, field: 'accountBalance')}" required=""/>
</div>

