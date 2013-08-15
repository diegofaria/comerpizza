package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(FlavorIngredientController)
@Mock(FlavorIngredient)
class FlavorIngredientControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/flavorIngredient/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.flavorIngredientInstanceList.size() == 0
        assert model.flavorIngredientInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.flavorIngredientInstance != null
    }

    void testSave() {
        controller.save()

        assert model.flavorIngredientInstance != null
        assert view == '/flavorIngredient/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/flavorIngredient/show/1'
        assert controller.flash.message != null
        assert FlavorIngredient.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/flavorIngredient/list'

        populateValidParams(params)
        def flavorIngredient = new FlavorIngredient(params)

        assert flavorIngredient.save() != null

        params.id = flavorIngredient.id

        def model = controller.show()

        assert model.flavorIngredientInstance == flavorIngredient
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/flavorIngredient/list'

        populateValidParams(params)
        def flavorIngredient = new FlavorIngredient(params)

        assert flavorIngredient.save() != null

        params.id = flavorIngredient.id

        def model = controller.edit()

        assert model.flavorIngredientInstance == flavorIngredient
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/flavorIngredient/list'

        response.reset()

        populateValidParams(params)
        def flavorIngredient = new FlavorIngredient(params)

        assert flavorIngredient.save() != null

        // test invalid parameters in update
        params.id = flavorIngredient.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/flavorIngredient/edit"
        assert model.flavorIngredientInstance != null

        flavorIngredient.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/flavorIngredient/show/$flavorIngredient.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        flavorIngredient.clearErrors()

        populateValidParams(params)
        params.id = flavorIngredient.id
        params.version = -1
        controller.update()

        assert view == "/flavorIngredient/edit"
        assert model.flavorIngredientInstance != null
        assert model.flavorIngredientInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/flavorIngredient/list'

        response.reset()

        populateValidParams(params)
        def flavorIngredient = new FlavorIngredient(params)

        assert flavorIngredient.save() != null
        assert FlavorIngredient.count() == 1

        params.id = flavorIngredient.id

        controller.delete()

        assert FlavorIngredient.count() == 0
        assert FlavorIngredient.get(flavorIngredient.id) == null
        assert response.redirectedUrl == '/flavorIngredient/list'
    }
}
