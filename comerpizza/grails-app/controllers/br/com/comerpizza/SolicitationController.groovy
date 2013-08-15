package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class SolicitationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [solicitationInstanceList: Solicitation.list(params), solicitationInstanceTotal: Solicitation.count()]
    }

    def create() {
        [solicitationInstance: new Solicitation(params)]
    }

    def save() {
        def solicitationInstance = new Solicitation(params)
        if (!solicitationInstance.save(flush: true)) {
            render(view: "create", model: [solicitationInstance: solicitationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), solicitationInstance.id])
        redirect(action: "show", id: solicitationInstance.id)
    }

    def show(Long id) {
        def solicitationInstance = Solicitation.get(id)
        if (!solicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "list")
            return
        }

        [solicitationInstance: solicitationInstance]
    }

    def edit(Long id) {
        def solicitationInstance = Solicitation.get(id)
        if (!solicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "list")
            return
        }

        [solicitationInstance: solicitationInstance]
    }

    def update(Long id, Long version) {
        def solicitationInstance = Solicitation.get(id)
        if (!solicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (solicitationInstance.version > version) {
                solicitationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'solicitation.label', default: 'Solicitation')] as Object[],
                          "Another user has updated this Solicitation while you were editing")
                render(view: "edit", model: [solicitationInstance: solicitationInstance])
                return
            }
        }

        solicitationInstance.properties = params

        if (!solicitationInstance.save(flush: true)) {
            render(view: "edit", model: [solicitationInstance: solicitationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), solicitationInstance.id])
        redirect(action: "show", id: solicitationInstance.id)
    }

    def delete(Long id) {
        def solicitationInstance = Solicitation.get(id)
        if (!solicitationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "list")
            return
        }

        try {
            solicitationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'solicitation.label', default: 'Solicitation'), id])
            redirect(action: "show", id: id)
        }
    }
}
