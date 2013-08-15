package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(SolicitationController)
@Mock(Solicitation)
class SolicitationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/solicitation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.solicitationInstanceList.size() == 0
        assert model.solicitationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.solicitationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.solicitationInstance != null
        assert view == '/solicitation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/solicitation/show/1'
        assert controller.flash.message != null
        assert Solicitation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitation/list'

        populateValidParams(params)
        def solicitation = new Solicitation(params)

        assert solicitation.save() != null

        params.id = solicitation.id

        def model = controller.show()

        assert model.solicitationInstance == solicitation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitation/list'

        populateValidParams(params)
        def solicitation = new Solicitation(params)

        assert solicitation.save() != null

        params.id = solicitation.id

        def model = controller.edit()

        assert model.solicitationInstance == solicitation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/solicitation/list'

        response.reset()

        populateValidParams(params)
        def solicitation = new Solicitation(params)

        assert solicitation.save() != null

        // test invalid parameters in update
        params.id = solicitation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/solicitation/edit"
        assert model.solicitationInstance != null

        solicitation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/solicitation/show/$solicitation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        solicitation.clearErrors()

        populateValidParams(params)
        params.id = solicitation.id
        params.version = -1
        controller.update()

        assert view == "/solicitation/edit"
        assert model.solicitationInstance != null
        assert model.solicitationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/solicitation/list'

        response.reset()

        populateValidParams(params)
        def solicitation = new Solicitation(params)

        assert solicitation.save() != null
        assert Solicitation.count() == 1

        params.id = solicitation.id

        controller.delete()

        assert Solicitation.count() == 0
        assert Solicitation.get(solicitation.id) == null
        assert response.redirectedUrl == '/solicitation/list'
    }
}
