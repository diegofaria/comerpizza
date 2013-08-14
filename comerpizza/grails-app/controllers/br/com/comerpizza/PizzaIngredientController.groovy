package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class PizzaIngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pizzaIngredientInstanceList: PizzaIngredient.list(params), pizzaIngredientInstanceTotal: PizzaIngredient.count()]
    }

    def create() {
        [pizzaIngredientInstance: new PizzaIngredient(params)]
    }

    def save() {
        def pizzaIngredientInstance = new PizzaIngredient(params)
        if (!pizzaIngredientInstance.save(flush: true)) {
            render(view: "create", model: [pizzaIngredientInstance: pizzaIngredientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), pizzaIngredientInstance.id])
        redirect(action: "show", id: pizzaIngredientInstance.id)
    }

    def show(Long id) {
        def pizzaIngredientInstance = PizzaIngredient.get(id)
        if (!pizzaIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "list")
            return
        }

        [pizzaIngredientInstance: pizzaIngredientInstance]
    }

    def edit(Long id) {
        def pizzaIngredientInstance = PizzaIngredient.get(id)
        if (!pizzaIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "list")
            return
        }

        [pizzaIngredientInstance: pizzaIngredientInstance]
    }

    def update(Long id, Long version) {
        def pizzaIngredientInstance = PizzaIngredient.get(id)
        if (!pizzaIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pizzaIngredientInstance.version > version) {
                pizzaIngredientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient')] as Object[],
                          "Another user has updated this PizzaIngredient while you were editing")
                render(view: "edit", model: [pizzaIngredientInstance: pizzaIngredientInstance])
                return
            }
        }

        pizzaIngredientInstance.properties = params

        if (!pizzaIngredientInstance.save(flush: true)) {
            render(view: "edit", model: [pizzaIngredientInstance: pizzaIngredientInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), pizzaIngredientInstance.id])
        redirect(action: "show", id: pizzaIngredientInstance.id)
    }

    def delete(Long id) {
        def pizzaIngredientInstance = PizzaIngredient.get(id)
        if (!pizzaIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "list")
            return
        }

        try {
            pizzaIngredientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pizzaIngredient.label', default: 'PizzaIngredient'), id])
            redirect(action: "show", id: id)
        }
    }
}
