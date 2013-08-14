package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(PizzaIngredientController)
@Mock(PizzaIngredient)
class PizzaIngredientControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pizzaIngredient/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pizzaIngredientInstanceList.size() == 0
        assert model.pizzaIngredientInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pizzaIngredientInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pizzaIngredientInstance != null
        assert view == '/pizzaIngredient/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pizzaIngredient/show/1'
        assert controller.flash.message != null
        assert PizzaIngredient.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaIngredient/list'

        populateValidParams(params)
        def pizzaIngredient = new PizzaIngredient(params)

        assert pizzaIngredient.save() != null

        params.id = pizzaIngredient.id

        def model = controller.show()

        assert model.pizzaIngredientInstance == pizzaIngredient
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaIngredient/list'

        populateValidParams(params)
        def pizzaIngredient = new PizzaIngredient(params)

        assert pizzaIngredient.save() != null

        params.id = pizzaIngredient.id

        def model = controller.edit()

        assert model.pizzaIngredientInstance == pizzaIngredient
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaIngredient/list'

        response.reset()

        populateValidParams(params)
        def pizzaIngredient = new PizzaIngredient(params)

        assert pizzaIngredient.save() != null

        // test invalid parameters in update
        params.id = pizzaIngredient.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pizzaIngredient/edit"
        assert model.pizzaIngredientInstance != null

        pizzaIngredient.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pizzaIngredient/show/$pizzaIngredient.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pizzaIngredient.clearErrors()

        populateValidParams(params)
        params.id = pizzaIngredient.id
        params.version = -1
        controller.update()

        assert view == "/pizzaIngredient/edit"
        assert model.pizzaIngredientInstance != null
        assert model.pizzaIngredientInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pizzaIngredient/list'

        response.reset()

        populateValidParams(params)
        def pizzaIngredient = new PizzaIngredient(params)

        assert pizzaIngredient.save() != null
        assert PizzaIngredient.count() == 1

        params.id = pizzaIngredient.id

        controller.delete()

        assert PizzaIngredient.count() == 0
        assert PizzaIngredient.get(pizzaIngredient.id) == null
        assert response.redirectedUrl == '/pizzaIngredient/list'
    }
}
