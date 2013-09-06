
<%@ page import="org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auditLogEvent.label', default: 'AuditLogEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style type="text/css">
            #auditLogTable{
                font-size: 0.8em;
                width: 100%;
                height: 500px;
                overflow: auto;
            }
        </style>
	</head>
	<body>
		<a href="#list-auditLogEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="filter-faxMessageAttempt" class="content scaffold-create" role="main">
			<h1>Logs</h1>
            <g:if test="${flash.message}">
                <div class="errors" role="alert">${flash.message}</div>
            </g:if>
            
        </div>
		<div id="list-auditLogEvent" class="content scaffold-list" role="main">
			<div id="auditLogTable">
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'auditLogEvent.dateCreated.label', default: 'Date')}" />
						
						<g:sortableColumn property="actor" title="${message(code: 'auditLogEvent.actor.label', default: 'Actor')}" />
					
						<g:sortableColumn property="eventName" title="${message(code: 'auditLogEvent.eventName.label', default: 'Event')}" />
					
						<g:sortableColumn property="className" title="${message(code: 'auditLogEvent.className.label', default: 'Object')}" />
						
						<g:sortableColumn property="persistedObjectId" title="${message(code: 'auditLogEvent.persistedObjectId.label', default: 'Object Id')}" />
						
						<g:sortableColumn property="propertyName" title="${message(code: 'auditLogEvent.property.label', default: 'Field')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:if test="${auditLogEventInstanceList}">
				<g:each in="${auditLogEventInstanceList}" status="i" var="auditLogEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><%--<g:link action="show" id="${auditLogEventInstance.id}">--%><g:formatDate date="${auditLogEventInstance.dateCreated}" type="datetime" style="MEDIUM"/><%--</g:link>--%></td>
					
						<td>${fieldValue(bean: auditLogEventInstance, field: "actor")}</td>
					
						<td>${fieldValue(bean: auditLogEventInstance, field: "eventName")}</td>
					
						<td>${fieldValue(bean: auditLogEventInstance, field: "className")}</td>
						
						<td>${fieldValue(bean: auditLogEventInstance, field: "persistedObjectId")}</td>
						
						<td>${fieldValue(bean: auditLogEventInstance, field: "propertyName")}</td>
					
					</tr>
				</g:each>
				</g:if>
				<g:else>
		        	<tr><td colspan="6" style="text-align: center; font-style: italic;">No logs found</td></tr>
		        </g:else>
				</tbody>
			</table>
			</div>
			<div class="pagination">
				<g:paginate total="${auditLogEventInstanceTotal}" action="refreshList" />
			</div>
		</div>
	</body>
</html>
