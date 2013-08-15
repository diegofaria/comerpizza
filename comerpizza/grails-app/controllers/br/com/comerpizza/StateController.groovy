package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class StateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [stateInstanceList: State.list(params), stateInstanceTotal: State.count()]
    }

    def create() {
        [stateInstance: new State(params)]
    }

    def save() {
        def stateInstance = new State(params)
        if (!stateInstance.save(flush: true)) {
            render(view: "create", model: [stateInstance: stateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'state.label', default: 'State'), stateInstance.id])
        redirect(action: "show", id: stateInstance.id)
    }

    def show(Long id) {
        def stateInstance = State.get(id)
        if (!stateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "list")
            return
        }

        [stateInstance: stateInstance]
    }

    def edit(Long id) {
        def stateInstance = State.get(id)
        if (!stateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "list")
            return
        }

        [stateInstance: stateInstance]
    }

    def update(Long id, Long version) {
        def stateInstance = State.get(id)
        if (!stateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stateInstance.version > version) {
                stateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'state.label', default: 'State')] as Object[],
                          "Another user has updated this State while you were editing")
                render(view: "edit", model: [stateInstance: stateInstance])
                return
            }
        }

        stateInstance.properties = params

        if (!stateInstance.save(flush: true)) {
            render(view: "edit", model: [stateInstance: stateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'state.label', default: 'State'), stateInstance.id])
        redirect(action: "show", id: stateInstance.id)
    }

    def delete(Long id) {
        def stateInstance = State.get(id)
        if (!stateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "list")
            return
        }

        try {
            stateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'state.label', default: 'State'), id])
            redirect(action: "show", id: id)
        }
    }
}
