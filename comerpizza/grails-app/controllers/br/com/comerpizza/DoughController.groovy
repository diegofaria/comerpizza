package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class DoughController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [doughInstanceList: Dough.list(params), doughInstanceTotal: Dough.count()]
    }

    def create() {
        [doughInstance: new Dough(params)]
    }

    def save() {
        def doughInstance = new Dough(params)
        if (!doughInstance.save(flush: true)) {
            render(view: "create", model: [doughInstance: doughInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dough.label', default: 'Dough'), doughInstance.id])
        redirect(action: "show", id: doughInstance.id)
    }

    def show(Long id) {
        def doughInstance = Dough.get(id)
        if (!doughInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "list")
            return
        }

        [doughInstance: doughInstance]
    }

    def edit(Long id) {
        def doughInstance = Dough.get(id)
        if (!doughInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "list")
            return
        }

        [doughInstance: doughInstance]
    }

    def update(Long id, Long version) {
        def doughInstance = Dough.get(id)
        if (!doughInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (doughInstance.version > version) {
                doughInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dough.label', default: 'Dough')] as Object[],
                          "Another user has updated this Dough while you were editing")
                render(view: "edit", model: [doughInstance: doughInstance])
                return
            }
        }

        doughInstance.properties = params

        if (!doughInstance.save(flush: true)) {
            render(view: "edit", model: [doughInstance: doughInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dough.label', default: 'Dough'), doughInstance.id])
        redirect(action: "show", id: doughInstance.id)
    }

    def delete(Long id) {
        def doughInstance = Dough.get(id)
        if (!doughInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "list")
            return
        }

        try {
            doughInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dough.label', default: 'Dough'), id])
            redirect(action: "show", id: id)
        }
    }
}
