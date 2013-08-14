package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(FlavorController)
@Mock(Flavor)
class FlavorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/flavor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.flavorInstanceList.size() == 0
        assert model.flavorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.flavorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.flavorInstance != null
        assert view == '/flavor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/flavor/show/1'
        assert controller.flash.message != null
        assert Flavor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/flavor/list'

        populateValidParams(params)
        def flavor = new Flavor(params)

        assert flavor.save() != null

        params.id = flavor.id

        def model = controller.show()

        assert model.flavorInstance == flavor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/flavor/list'

        populateValidParams(params)
        def flavor = new Flavor(params)

        assert flavor.save() != null

        params.id = flavor.id

        def model = controller.edit()

        assert model.flavorInstance == flavor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/flavor/list'

        response.reset()

        populateValidParams(params)
        def flavor = new Flavor(params)

        assert flavor.save() != null

        // test invalid parameters in update
        params.id = flavor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/flavor/edit"
        assert model.flavorInstance != null

        flavor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/flavor/show/$flavor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        flavor.clearErrors()

        populateValidParams(params)
        params.id = flavor.id
        params.version = -1
        controller.update()

        assert view == "/flavor/edit"
        assert model.flavorInstance != null
        assert model.flavorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/flavor/list'

        response.reset()

        populateValidParams(params)
        def flavor = new Flavor(params)

        assert flavor.save() != null
        assert Flavor.count() == 1

        params.id = flavor.id

        controller.delete()

        assert Flavor.count() == 0
        assert Flavor.get(flavor.id) == null
        assert response.redirectedUrl == '/flavor/list'
    }
}
