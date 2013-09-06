package com.rural.bank

import org.springframework.dao.DataIntegrityViolationException

class BillController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [billInstanceList: Bill.list(params), billInstanceTotal: Bill.count()]
    }

    def create() {
        [billInstance: new Bill(params)]
    }

    def save() {
        def billInstance = new Bill(params)
        if (!billInstance.save(flush: true)) {
            render(view: "create", model: [billInstance: billInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bill.label', default: 'Bill'), billInstance.id])
        redirect(action: "show", id: billInstance.id)
    }

    def show(Long id) {
        def billInstance = Bill.get(id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "list")
            return
        }

        [billInstance: billInstance]
    }

    def edit(Long id) {
        def billInstance = Bill.get(id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "list")
            return
        }

        [billInstance: billInstance]
    }

    def update(Long id, Long version) {
        def billInstance = Bill.get(id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (billInstance.version > version) {
                billInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bill.label', default: 'Bill')] as Object[],
                          "Another user has updated this Bill while you were editing")
                render(view: "edit", model: [billInstance: billInstance])
                return
            }
        }

        billInstance.properties = params

        if (!billInstance.save(flush: true)) {
            render(view: "edit", model: [billInstance: billInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bill.label', default: 'Bill'), billInstance.id])
        redirect(action: "show", id: billInstance.id)
    }

    def delete(Long id) {
        def billInstance = Bill.get(id)
        if (!billInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "list")
            return
        }

        try {
            billInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bill.label', default: 'Bill'), id])
            redirect(action: "show", id: id)
        }
    }
}
