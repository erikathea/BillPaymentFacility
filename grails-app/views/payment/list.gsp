
<%@ page import="com.rural.bank.Payment" %>
<%@ page import="com.rural.bank.Cheque" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
	</head>
	<body>
	
		<a href="#list-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <br/>
		<div id="list-payment" class="content scaffold-list" role="main">

		    <g:if test="${flash.message}">
               <div class="message" role="status">${flash.message}</div>
            </g:if>

	 <div>
            	<g:form action="generateReport">
            			<h2> Report </h2>
            			
            			<table>
            				<tr>
            					<td>Filter: </td>
            					<td><g:select id="filter" name="filter.id" onchange="
							if(this.value==' Date '){
								document.getElementById('dateField').style.display='block';
								document.getElementById('inputField').style.display='none';
								document.getElementById('institution').style.display='none';
							}
							else if(this.value==' Payment Mode '){
								document.getElementById('dateField').style.display='none';
								document.getElementById('inputField').style.display='block';
								document.getElementById('institution').style.display='none';
							}
							else if(this.value==' Institution '){
								document.getElementById('dateField').style.display='none';
								document.getElementById('inputField').style.display='none';
								document.getElementById('institution').style.display='block';
							}
						"
            					from="${[ ' Institution ',' Date ',' Payment Mode ']}" value="${params.filter}"/> </td>
            				</tr>

            				<tr>
            					<td>Value: </td>
            					<td>

						<g:select id="inputField" name="value" value="${params.value}" from="${['Cash', 'Check']}" style="display:none"/>


						<g:select id="institution" name="institution.id" from="${com.rural.bank.Institution.list()}" 								optionKey="id" required="" value="${params.value}" style="display:block"/>

            					<span id="dateField" style="display:none"> <g:datePicker name="date" precision="day" />  </span></td>

            				</tr>

            			</table>

                        <g:submitButton name="Generate"/>
                        <g:submitButton name="Download as PDF" />


            	</g:form>
	</div>
 	
	<br/>


<g:if test="${params.filter && params.value}">
	<h1> Result for ${params.filter}: ${params.value}</h1>

	<div class="nav button" role="navigation">
		<ul>
			<li><g:link class="list" action="list">Clear</g:link></li>

		</ul>

	</div>	
</g:if>
<g:else>
	<h1> <g:message code="default.list.label" args="[entityName]" /> </h1>
	<div class="nav button" role="navigation">
		<ul>
			<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

		</ul>

	</div>
</g:else>


			<table>
				<thead>
					<tr>

						<g:sortableColumn property="transactionNumber" title="${message(code: 'payment.transactionNumber.label', default: 'Transaction Number')}" />

						<g:sortableColumn property="paymentMode" title="${message(code: 'payment.paymentMode.label', default: 'Payment Mode')}" />

					    <th><g:message code="payment.check.label" default="Check" /></th>

						<g:sortableColumn property="amount" title="${message(code: 'payment.amount.label', default: 'Amount')}" />
					
						<%--<th><g:message code="payment.bill.label" default="Bill" /></th>
					
						--%><g:sortableColumn property="transactionDate" title="${message(code: 'payment.transactionDate.label', default: 'Transaction Date')}" />
						
						<th> </th>
					</tr>
				</thead>
				
				<tbody>
				<g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					    <td>${fieldValue(bean: paymentInstance, field: "transactionNumber")}</td>
					
						<td>${fieldValue(bean: paymentInstance, field: "paymentMode")}</td>

						<td>${fieldValue(bean: paymentInstance?.check, field: "number")} <br/>
					    	${paymentInstance?.check?.type}</td>
					
						<td>${fieldValue(bean: paymentInstance, field: "amount")}</td>
					
						<%--<td>
						<g:link action="show" controller="bill" id="${paymentInstance?.bill?.id}">
						   Bill No. ${paymentInstance?.bill?.billNumber}
						</g:link>
						<br/>
						<g:link action="show" controller="institution" id="${paymentInstance?.bill?.institution}">
						   Institution:  ${paymentInstance?.bill?.institution}
						 </g:link>
                         <br/>Customer: ${paymentInstance?.bill?.customer}
                         </td>
					
						--%><td><g:formatDate date="${paymentInstance?.transactionDate}" format="yyyy-MM-dd"/></td>
					
						<td><g:link action="show" id="${paymentInstance?.id}">Show</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>	
			<div class="pagination">
				<g:paginate total="${paymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
