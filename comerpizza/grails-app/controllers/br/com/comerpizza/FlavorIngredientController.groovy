package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class FlavorIngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [flavorIngredientInstanceList: FlavorIngredient.list(params), flavorIngredientInstanceTotal: FlavorIngredient.count()]
    }

    def create() {
        [flavorIngredientInstance: new FlavorIngredient(params)]
    }

    def save() {
        def flavorIngredientInstance = new FlavorIngredient(params)
        if (!flavorIngredientInstance.save(flush: true)) {
            render(view: "create", model: [flavorIngredientInstance: flavorIngredientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), flavorIngredientInstance.id])
        redirect(action: "show", id: flavorIngredientInstance.id)
    }

    def show(Long id) {
        def flavorIngredientInstance = FlavorIngredient.get(id)
        if (!flavorIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "list")
            return
        }

        [flavorIngredientInstance: flavorIngredientInstance]
    }

    def edit(Long id) {
        def flavorIngredientInstance = FlavorIngredient.get(id)
        if (!flavorIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "list")
            return
        }

        [flavorIngredientInstance: flavorIngredientInstance]
    }

    def update(Long id, Long version) {
        def flavorIngredientInstance = FlavorIngredient.get(id)
        if (!flavorIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (flavorIngredientInstance.version > version) {
                flavorIngredientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flavorIngredient.label', default: 'FlavorIngredient')] as Object[],
                          "Another user has updated this FlavorIngredient while you were editing")
                render(view: "edit", model: [flavorIngredientInstance: flavorIngredientInstance])
                return
            }
        }

        flavorIngredientInstance.properties = params

        if (!flavorIngredientInstance.save(flush: true)) {
            render(view: "edit", model: [flavorIngredientInstance: flavorIngredientInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), flavorIngredientInstance.id])
        redirect(action: "show", id: flavorIngredientInstance.id)
    }

    def delete(Long id) {
        def flavorIngredientInstance = FlavorIngredient.get(id)
        if (!flavorIngredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "list")
            return
        }

        try {
            flavorIngredientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flavorIngredient.label', default: 'FlavorIngredient'), id])
            redirect(action: "show", id: id)
        }
    }
}
