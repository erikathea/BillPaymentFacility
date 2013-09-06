<%@ page import="com.rural.bank.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchName', 'error')} required">
	<label for="branchName">
		<g:message code="branch.branchName.label" default="Branch Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branchName" required="" value="${branchInstance?.branchName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="branch.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${branchInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'contactNumber', 'error')} required">
	<label for="contactNumber">
		<g:message code="branch.contactNumber.label" default="Contact Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" pattern="${branchInstance.constraints.contactNumber.matches}" required="" value="${branchInstance?.contactNumber}"/>
</div>