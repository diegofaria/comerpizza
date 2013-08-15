package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class PizzaSolicitationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pizzaSolicitationInstanceList: PizzaSolicitation.list(params), pizzaSolicitationInstanceTotal: PizzaSolicitation.count()]
    }

    def create() {
        [pizzaSolicitationInstance: new PizzaSolicitation(params)]
    }

    def save() {
        def pizzaSolicitationInstance = new PizzaSolicitation(params)
        if (!pizzaSolicitationInstance.save(flush: true)) {
            render(view: "create", model: [pizzaSolicitationInstance: pizzaSolicitationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), pizzaSolicitationInstance.id])
        redirect(action: "show", id: pizzaSolicitationInstance.id)
    }

    def show(Long id) {
        def pizzaSolicitationInstance = PizzaSolicitation.get(id)
        if (!pizzaSolicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "list")
            return
        }

        [pizzaSolicitationInstance: pizzaSolicitationInstance]
    }

    def edit(Long id) {
        def pizzaSolicitationInstance = PizzaSolicitation.get(id)
        if (!pizzaSolicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "list")
            return
        }

        [pizzaSolicitationInstance: pizzaSolicitationInstance]
    }

    def update(Long id, Long version) {
        def pizzaSolicitationInstance = PizzaSolicitation.get(id)
        if (!pizzaSolicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pizzaSolicitationInstance.version > version) {
                pizzaSolicitationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation')] as Object[],
                          "Another user has updated this PizzaSolicitation while you were editing")
                render(view: "edit", model: [pizzaSolicitationInstance: pizzaSolicitationInstance])
                return
            }
        }

        pizzaSolicitationInstance.properties = params

        if (!pizzaSolicitationInstance.save(flush: true)) {
            render(view: "edit", model: [pizzaSolicitationInstance: pizzaSolicitationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), pizzaSolicitationInstance.id])
        redirect(action: "show", id: pizzaSolicitationInstance.id)
    }

    def delete(Long id) {
        def pizzaSolicitationInstance = PizzaSolicitation.get(id)
        if (!pizzaSolicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "list")
            return
        }

        try {
            pizzaSolicitationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pizzaSolicitation.label', default: 'PizzaSolicitation'), id])
            redirect(action: "show", id: id)
        }
    }
}
