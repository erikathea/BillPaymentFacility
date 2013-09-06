package com.rural.bank

import org.springframework.dao.DataIntegrityViolationException

class TellerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tellerInstanceList: Teller.list(params), tellerInstanceTotal: Teller.count()]
    }

    def create() {
        def user = new Teller(params)
        [tellerInstance: user, userRoleInstance: new UserRole(user:user,role: Role.findByAuthority("TELLER"))]
    }

    def save() {
        def tellerInstance = new Teller(params)
        def role = params.role.id
        if (!tellerInstance.save(flush: true)) {
            render(view: "create", model: [tellerInstance: tellerInstance], params:[role:role])
            return
        }

        def userRoleInstance = new UserRole()
        userRoleInstance.user = tellerInstance
        userRoleInstance.role = Role.get(role)
        if (!userRoleInstance.save(flush: true)) {
            render(view: "create", model: [tellerInstance: tellerInstance], params:[role:role])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'teller.label', default: 'Teller'), tellerInstance])
        redirect(action: "show", id: tellerInstance.id)
    }

    def show(Long id) {
        def tellerInstance = Teller.get(id)
        if (!tellerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), id])
            redirect(action: "list")
            return
        }
        def userRoleInstance = UserRole.findByUser(tellerInstance)

        [tellerInstance: tellerInstance, userRoleInstance:userRoleInstance]
    }

    def edit(Long id) {
        def tellerInstance = Teller.get(id)
        if (!tellerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), id])
            redirect(action: "list")
            return
        }
        def userRoleInstance = UserRole.findByUser(tellerInstance)

        [tellerInstance: tellerInstance, userRoleInstance:userRoleInstance]
    }

    def update(Long id, Long version) {
        def tellerInstance = Teller.get(id)

        def userRoleInstance = UserRole.get(tellerInstance.id,Long.parseLong(params.userRoleId))
        userRoleInstance.delete(flush: true)

        if (!tellerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tellerInstance.version > version) {
                tellerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'teller.label', default: 'Teller')] as Object[],
                          "Another user has updated this Teller while you were editing")
                render(view: "edit", model: [tellerInstance: tellerInstance])
                return
            }
        }

        tellerInstance.properties = params

        if (!tellerInstance.save(flush: true)) {
            render(view: "edit", model: [tellerInstance: tellerInstance])
            return
        }

        userRoleInstance = new UserRole()
        userRoleInstance.user = tellerInstance
        userRoleInstance.role = Role.get(params.role.id)

        if (!userRoleInstance.save(flush: true)) {
            render(view: "edit", model: [tellerInstance: tellerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'teller.label', default: 'Teller'), tellerInstance])
        redirect(action: "show", id: tellerInstance.id)
    }

    def delete(Long id) {
        def tellerInstance = Teller.get(id)
        def employeeNumber = tellerInstance.employeeNumber

        def userRoleInstance = UserRole.get(tellerInstance.id,Long.parseLong(params.userRoleId))
        userRoleInstance.delete(flush: true)

        if (!tellerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teller.label', default: 'Teller'), id])
            redirect(action: "list")
            return
        }

        try {
            tellerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'teller.label', default: 'Teller'), employeeNumber])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teller.label', default: 'Teller'), id])
            redirect(action: "show", id: id)
        }
    }
}
