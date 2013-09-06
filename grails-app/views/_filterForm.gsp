<%@ page import="net.utbox.model.FaxMessageAttempt" %>
<%@ page import="net.utbox.model.FaxStatus" %>

<div class="fieldcontain  ">
	<label for="pageCount">
		<g:message code="label.auditLog.pageCount" default="Items per Page" />
	</label>
	<g:field name="pageCount" type="number" size="5" value="${inputParams?.pageCount}"/>
</div>
<div class="fieldcontain  ">
    <label for="username">
        <g:message code="label.auditLog.username" default="Username" />
    </label>
    <g:textField name="username" value="${inputParams?.username}" />
</div>
<div class="fieldcontain  ">
    <label for="dateFrom">
        <g:message code="label.auditLog.dateFrom" default="From" />
    </label>
    <g:datePicker name="dateFrom" value="${inputParams?.dateFrom}" precision="day" 
    	noSelection="['':'- Choose -']" default="${new Date().minus(3)}" />
</div>
<div class="fieldcontain  ">
    <label for="dateTo">
        <g:message code="label.auditLog.dateTo" default="To" />
    </label>
    <g:datePicker name="dateTo" value="${inputParams?.dateTo}" precision="day" 
    	noSelection="['':'- Choose -']" />
</div>
