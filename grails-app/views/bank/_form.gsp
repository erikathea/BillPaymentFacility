<%@ page import="com.rural.bank.Bank" %>



<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'branchName', 'error')} required">
	<label for="branchName">
		<g:message code="bank.branchName.label" default="Branch Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branchName" required="" value="${bankInstance?.branchName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="bank.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${bankInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'contactNumber', 'error')} required">
	<label for="contactNumber">
		<g:message code="bank.contactNumber.label" default="Contact Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" pattern="${bankInstance.constraints.contactNumber.matches}" required="" value="${bankInstance?.contactNumber}"/>
</div>

