package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class IngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ingredientInstanceList: Ingredient.list(params), ingredientInstanceTotal: Ingredient.count()]
    }

    def create() {
        [ingredientInstance: new Ingredient(params)]
    }

    def save() {
        def ingredientInstance = new Ingredient(params)
        if (!ingredientInstance.save(flush: true)) {
            render(view: "create", model: [ingredientInstance: ingredientInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), ingredientInstance.id])
        redirect(action: "show", id: ingredientInstance.id)
    }

    def show(Long id) {
        def ingredientInstance = Ingredient.get(id)
        if (!ingredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "list")
            return
        }

        [ingredientInstance: ingredientInstance]
    }

    def edit(Long id) {
        def ingredientInstance = Ingredient.get(id)
        if (!ingredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "list")
            return
        }

        [ingredientInstance: ingredientInstance]
    }

    def update(Long id, Long version) {
        def ingredientInstance = Ingredient.get(id)
        if (!ingredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ingredientInstance.version > version) {
                ingredientInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ingredient.label', default: 'Ingredient')] as Object[],
                          "Another user has updated this Ingredient while you were editing")
                render(view: "edit", model: [ingredientInstance: ingredientInstance])
                return
            }
        }

        ingredientInstance.properties = params

        if (!ingredientInstance.save(flush: true)) {
            render(view: "edit", model: [ingredientInstance: ingredientInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), ingredientInstance.id])
        redirect(action: "show", id: ingredientInstance.id)
    }

    def delete(Long id) {
        def ingredientInstance = Ingredient.get(id)
        if (!ingredientInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "list")
            return
        }

        try {
            ingredientInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), id])
            redirect(action: "show", id: id)
        }
    }
}
