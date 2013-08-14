package br.com.comerpizza

import org.springframework.dao.DataIntegrityViolationException

class FlavorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [flavorInstanceList: Flavor.list(params), flavorInstanceTotal: Flavor.count()]
    }

    def create() {
        [flavorInstance: new Flavor(params)]
    }

    def save() {
        def flavorInstance = new Flavor(params)
        if (!flavorInstance.save(flush: true)) {
            render(view: "create", model: [flavorInstance: flavorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'flavor.label', default: 'Flavor'), flavorInstance.id])
        redirect(action: "show", id: flavorInstance.id)
    }

    def show(Long id) {
        def flavorInstance = Flavor.get(id)
        if (!flavorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "list")
            return
        }

        [flavorInstance: flavorInstance]
    }

    def edit(Long id) {
        def flavorInstance = Flavor.get(id)
        if (!flavorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "list")
            return
        }

        [flavorInstance: flavorInstance]
    }

    def update(Long id, Long version) {
        def flavorInstance = Flavor.get(id)
        if (!flavorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (flavorInstance.version > version) {
                flavorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'flavor.label', default: 'Flavor')] as Object[],
                          "Another user has updated this Flavor while you were editing")
                render(view: "edit", model: [flavorInstance: flavorInstance])
                return
            }
        }

        flavorInstance.properties = params

        if (!flavorInstance.save(flush: true)) {
            render(view: "edit", model: [flavorInstance: flavorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'flavor.label', default: 'Flavor'), flavorInstance.id])
        redirect(action: "show", id: flavorInstance.id)
    }

    def delete(Long id) {
        def flavorInstance = Flavor.get(id)
        if (!flavorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "list")
            return
        }

        try {
            flavorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'flavor.label', default: 'Flavor'), id])
            redirect(action: "show", id: id)
        }
    }
}
