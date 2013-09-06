<%@ page import="com.rural.bank.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="customer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${customerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="customer.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${customerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="customer.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${customerInstance?.birthDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'contactNumber', 'error')} required">
	<label for="contactNumber">
		<g:message code="customer.contactNumber.label" default="Contact Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" pattern="${customerInstance.constraints.contactNumber.matches}" required="" value="${customerInstance?.contactNumber}"/>
</div>

