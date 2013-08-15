package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class DrinkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [drinkInstanceList: Drink.list(params), drinkInstanceTotal: Drink.count()]
    }

    def create() {
        [drinkInstance: new Drink(params)]
    }

    def save() {
        def drinkInstance = new Drink(params)
        if (!drinkInstance.save(flush: true)) {
            render(view: "create", model: [drinkInstance: drinkInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'drink.label', default: 'Drink'), drinkInstance.id])
        redirect(action: "show", id: drinkInstance.id)
    }

    def show(Long id) {
        def drinkInstance = Drink.get(id)
        if (!drinkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "list")
            return
        }

        [drinkInstance: drinkInstance]
    }

    def edit(Long id) {
        def drinkInstance = Drink.get(id)
        if (!drinkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "list")
            return
        }

        [drinkInstance: drinkInstance]
    }

    def update(Long id, Long version) {
        def drinkInstance = Drink.get(id)
        if (!drinkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (drinkInstance.version > version) {
                drinkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'drink.label', default: 'Drink')] as Object[],
                          "Another user has updated this Drink while you were editing")
                render(view: "edit", model: [drinkInstance: drinkInstance])
                return
            }
        }

        drinkInstance.properties = params

        if (!drinkInstance.save(flush: true)) {
            render(view: "edit", model: [drinkInstance: drinkInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'drink.label', default: 'Drink'), drinkInstance.id])
        redirect(action: "show", id: drinkInstance.id)
    }

    def delete(Long id) {
        def drinkInstance = Drink.get(id)
        if (!drinkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "list")
            return
        }

        try {
            drinkInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'drink.label', default: 'Drink'), id])
            redirect(action: "show", id: id)
        }
    }
}
