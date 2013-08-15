package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class PizzaTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pizzaTypeInstanceList: PizzaType.list(params), pizzaTypeInstanceTotal: PizzaType.count()]
    }

    def create() {
        [pizzaTypeInstance: new PizzaType(params)]
    }

    def save() {
        def pizzaTypeInstance = new PizzaType(params)
        if (!pizzaTypeInstance.save(flush: true)) {
            render(view: "create", model: [pizzaTypeInstance: pizzaTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), pizzaTypeInstance.id])
        redirect(action: "show", id: pizzaTypeInstance.id)
    }

    def show(Long id) {
        def pizzaTypeInstance = PizzaType.get(id)
        if (!pizzaTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "list")
            return
        }

        [pizzaTypeInstance: pizzaTypeInstance]
    }

    def edit(Long id) {
        def pizzaTypeInstance = PizzaType.get(id)
        if (!pizzaTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "list")
            return
        }

        [pizzaTypeInstance: pizzaTypeInstance]
    }

    def update(Long id, Long version) {
        def pizzaTypeInstance = PizzaType.get(id)
        if (!pizzaTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pizzaTypeInstance.version > version) {
                pizzaTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pizzaType.label', default: 'PizzaType')] as Object[],
                          "Another user has updated this PizzaType while you were editing")
                render(view: "edit", model: [pizzaTypeInstance: pizzaTypeInstance])
                return
            }
        }

        pizzaTypeInstance.properties = params

        if (!pizzaTypeInstance.save(flush: true)) {
            render(view: "edit", model: [pizzaTypeInstance: pizzaTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), pizzaTypeInstance.id])
        redirect(action: "show", id: pizzaTypeInstance.id)
    }

    def delete(Long id) {
        def pizzaTypeInstance = PizzaType.get(id)
        if (!pizzaTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "list")
            return
        }

        try {
            pizzaTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pizzaType.label', default: 'PizzaType'), id])
            redirect(action: "show", id: id)
        }
    }
}
