package com.rural.bank

import org.apache.commons.lang.StringUtils

import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent

class AuditLogController {
	
    def index() {
        redirect(action: "list", params: params)
    }

    private getAuditTrail(params) {
        def c = AuditLogEvent.createCriteria()
        def pagedAuditLogList = c.list (max: params.max, offset: params.offset) {
			
			if (StringUtils.isNotBlank(params.username)) {
				eq("actor", params.username)
			}
			
            
            order("id", "desc")
		}

        return pagedAuditLogList
    }

    def list(Integer max) {

			flash.message = ''
	        params.max = params.pageCount ?: 100
			params.pageCount = params.max
			
			
			def auditLogEventInstanceList = getAuditTrail(params)
			
			// store parameters in session in case list is paginated
			session['auditTrail_pageCount'] = params.pageCount
			session['auditTrail_username'] = params.username
			session['auditTrail_dateFrom'] = params.dateFrom
			session['auditTrail_dateTo'] = params.dateTo
	
			[auditLogEventInstanceList: auditLogEventInstanceList, auditLogEventInstanceTotal: auditLogEventInstanceList.totalCount, inputParams: params]
		
    }
	



}
