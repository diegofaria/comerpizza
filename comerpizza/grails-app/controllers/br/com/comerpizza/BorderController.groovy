package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class BorderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [borderInstanceList: Border.list(params), borderInstanceTotal: Border.count()]
    }

    def create() {
        [borderInstance: new Border(params)]
    }

    def save() {
        def borderInstance = new Border(params)
        if (!borderInstance.save(flush: true)) {
            render(view: "create", model: [borderInstance: borderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'border.label', default: 'Border'), borderInstance.id])
        redirect(action: "show", id: borderInstance.id)
    }

    def show(Long id) {
        def borderInstance = Border.get(id)
        if (!borderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "list")
            return
        }

        [borderInstance: borderInstance]
    }

    def edit(Long id) {
        def borderInstance = Border.get(id)
        if (!borderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "list")
            return
        }

        [borderInstance: borderInstance]
    }

    def update(Long id, Long version) {
        def borderInstance = Border.get(id)
        if (!borderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (borderInstance.version > version) {
                borderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'border.label', default: 'Border')] as Object[],
                          "Another user has updated this Border while you were editing")
                render(view: "edit", model: [borderInstance: borderInstance])
                return
            }
        }

        borderInstance.properties = params

        if (!borderInstance.save(flush: true)) {
            render(view: "edit", model: [borderInstance: borderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'border.label', default: 'Border'), borderInstance.id])
        redirect(action: "show", id: borderInstance.id)
    }

    def delete(Long id) {
        def borderInstance = Border.get(id)
        if (!borderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "list")
            return
        }

        try {
            borderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'border.label', default: 'Border'), id])
            redirect(action: "show", id: id)
        }
    }
}
