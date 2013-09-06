package com.rural.bank

import org.springframework.dao.DataIntegrityViolationException

class BankController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bankInstanceList: Bank.list(params), bankInstanceTotal: Bank.count()]
    }

    def create() {
        [bankInstance: new Bank(params)]
    }

    def save() {
        def bankInstance = new Bank(params)
        if (!bankInstance.save(flush: true)) {
            render(view: "create", model: [bankInstance: bankInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bank.label', default: 'Bank'), bankInstance.id])
        redirect(action: "show", id: bankInstance.id)
    }

    def show(Long id) {
        def bankInstance = Bank.get(id)
        if (!bankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "list")
            return
        }

        [bankInstance: bankInstance]
    }

    def edit(Long id) {
        def bankInstance = Bank.get(id)
        if (!bankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "list")
            return
        }

        [bankInstance: bankInstance]
    }

    def update(Long id, Long version) {
        def bankInstance = Bank.get(id)
        if (!bankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bankInstance.version > version) {
                bankInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bank.label', default: 'Bank')] as Object[],
                          "Another user has updated this Bank while you were editing")
                render(view: "edit", model: [bankInstance: bankInstance])
                return
            }
        }

        bankInstance.properties = params

        if (!bankInstance.save(flush: true)) {
            render(view: "edit", model: [bankInstance: bankInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bank.label', default: 'Bank'), bankInstance.id])
        redirect(action: "show", id: bankInstance.id)
    }

    def delete(Long id) {
        def bankInstance = Bank.get(id)
        if (!bankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "list")
            return
        }

        try {
            bankInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bank.label', default: 'Bank'), id])
            redirect(action: "show", id: id)
        }
    }
}
