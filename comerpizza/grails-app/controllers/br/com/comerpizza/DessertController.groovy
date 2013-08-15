package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class DessertController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dessertInstanceList: Dessert.list(params), dessertInstanceTotal: Dessert.count()]
    }

    def create() {
        [dessertInstance: new Dessert(params)]
    }

    def save() {
        def dessertInstance = new Dessert(params)
        if (!dessertInstance.save(flush: true)) {
            render(view: "create", model: [dessertInstance: dessertInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dessert.label', default: 'Dessert'), dessertInstance.id])
        redirect(action: "show", id: dessertInstance.id)
    }

    def show(Long id) {
        def dessertInstance = Dessert.get(id)
        if (!dessertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "list")
            return
        }

        [dessertInstance: dessertInstance]
    }

    def edit(Long id) {
        def dessertInstance = Dessert.get(id)
        if (!dessertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "list")
            return
        }

        [dessertInstance: dessertInstance]
    }

    def update(Long id, Long version) {
        def dessertInstance = Dessert.get(id)
        if (!dessertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dessertInstance.version > version) {
                dessertInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dessert.label', default: 'Dessert')] as Object[],
                          "Another user has updated this Dessert while you were editing")
                render(view: "edit", model: [dessertInstance: dessertInstance])
                return
            }
        }

        dessertInstance.properties = params

        if (!dessertInstance.save(flush: true)) {
            render(view: "edit", model: [dessertInstance: dessertInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dessert.label', default: 'Dessert'), dessertInstance.id])
        redirect(action: "show", id: dessertInstance.id)
    }

    def delete(Long id) {
        def dessertInstance = Dessert.get(id)
        if (!dessertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "list")
            return
        }

        try {
            dessertInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dessert.label', default: 'Dessert'), id])
            redirect(action: "show", id: id)
        }
    }
}
