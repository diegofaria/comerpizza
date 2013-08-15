package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(PizzaSolicitationController)
@Mock(PizzaSolicitation)
class PizzaSolicitationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pizzaSolicitation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pizzaSolicitationInstanceList.size() == 0
        assert model.pizzaSolicitationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.pizzaSolicitationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pizzaSolicitationInstance != null
        assert view == '/pizzaSolicitation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pizzaSolicitation/show/1'
        assert controller.flash.message != null
        assert PizzaSolicitation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaSolicitation/list'

        populateValidParams(params)
        def pizzaSolicitation = new PizzaSolicitation(params)

        assert pizzaSolicitation.save() != null

        params.id = pizzaSolicitation.id

        def model = controller.show()

        assert model.pizzaSolicitationInstance == pizzaSolicitation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaSolicitation/list'

        populateValidParams(params)
        def pizzaSolicitation = new PizzaSolicitation(params)

        assert pizzaSolicitation.save() != null

        params.id = pizzaSolicitation.id

        def model = controller.edit()

        assert model.pizzaSolicitationInstance == pizzaSolicitation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pizzaSolicitation/list'

        response.reset()

        populateValidParams(params)
        def pizzaSolicitation = new PizzaSolicitation(params)

        assert pizzaSolicitation.save() != null

        // test invalid parameters in update
        params.id = pizzaSolicitation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pizzaSolicitation/edit"
        assert model.pizzaSolicitationInstance != null

        pizzaSolicitation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pizzaSolicitation/show/$pizzaSolicitation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pizzaSolicitation.clearErrors()

        populateValidParams(params)
        params.id = pizzaSolicitation.id
        params.version = -1
        controller.update()

        assert view == "/pizzaSolicitation/edit"
        assert model.pizzaSolicitationInstance != null
        assert model.pizzaSolicitationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pizzaSolicitation/list'

        response.reset()

        populateValidParams(params)
        def pizzaSolicitation = new PizzaSolicitation(params)

        assert pizzaSolicitation.save() != null
        assert PizzaSolicitation.count() == 1

        params.id = pizzaSolicitation.id

        controller.delete()

        assert PizzaSolicitation.count() == 0
        assert PizzaSolicitation.get(pizzaSolicitation.id) == null
        assert response.redirectedUrl == '/pizzaSolicitation/list'
    }
}
