package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(PizzaTypeController)
@Mock(PizzaType)
class PizzaTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pizzaType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pizzaTypeInstanceList.size() == 0
        assert model.pizzaTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pizzaTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pizzaTypeInstance != null
        assert view == '/pizzaType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pizzaType/show/1'
        assert controller.flash.message != null
        assert PizzaType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaType/list'

        populateValidParams(params)
        def pizzaType = new PizzaType(params)

        assert pizzaType.save() != null

        params.id = pizzaType.id

        def model = controller.show()

        assert model.pizzaTypeInstance == pizzaType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaType/list'

        populateValidParams(params)
        def pizzaType = new PizzaType(params)

        assert pizzaType.save() != null

        params.id = pizzaType.id

        def model = controller.edit()

        assert model.pizzaTypeInstance == pizzaType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaType/list'

        response.reset()

        populateValidParams(params)
        def pizzaType = new PizzaType(params)

        assert pizzaType.save() != null

        // test invalid parameters in update
        params.id = pizzaType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pizzaType/edit"
        assert model.pizzaTypeInstance != null

        pizzaType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pizzaType/show/$pizzaType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pizzaType.clearErrors()

        populateValidParams(params)
        params.id = pizzaType.id
        params.version = -1
        controller.update()

        assert view == "/pizzaType/edit"
        assert model.pizzaTypeInstance != null
        assert model.pizzaTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pizzaType/list'

        response.reset()

        populateValidParams(params)
        def pizzaType = new PizzaType(params)

        assert pizzaType.save() != null
        assert PizzaType.count() == 1

        params.id = pizzaType.id

        controller.delete()

        assert PizzaType.count() == 0
        assert PizzaType.get(pizzaType.id) == null
        assert response.redirectedUrl == '/pizzaType/list'
    }
}
