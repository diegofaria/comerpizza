package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(DrinkController)
@Mock(Drink)
class DrinkControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/drink/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.drinkInstanceList.size() == 0
        assert model.drinkInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.drinkInstance != null
    }

    void testSave() {
        controller.save()

        assert model.drinkInstance != null
        assert view == '/drink/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/drink/show/1'
        assert controller.flash.message != null
        assert Drink.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/drink/list'

        populateValidParams(params)
        def drink = new Drink(params)

        assert drink.save() != null

        params.id = drink.id

        def model = controller.show()

        assert model.drinkInstance == drink
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/drink/list'

        populateValidParams(params)
        def drink = new Drink(params)

        assert drink.save() != null

        params.id = drink.id

        def model = controller.edit()

        assert model.drinkInstance == drink
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/drink/list'

        response.reset()

        populateValidParams(params)
        def drink = new Drink(params)

        assert drink.save() != null

        // test invalid parameters in update
        params.id = drink.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/drink/edit"
        assert model.drinkInstance != null

        drink.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/drink/show/$drink.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        drink.clearErrors()

        populateValidParams(params)
        params.id = drink.id
        params.version = -1
        controller.update()

        assert view == "/drink/edit"
        assert model.drinkInstance != null
        assert model.drinkInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/drink/list'

        response.reset()

        populateValidParams(params)
        def drink = new Drink(params)

        assert drink.save() != null
        assert Drink.count() == 1

        params.id = drink.id

        controller.delete()

        assert Drink.count() == 0
        assert Drink.get(drink.id) == null
        assert response.redirectedUrl == '/drink/list'
    }
}
