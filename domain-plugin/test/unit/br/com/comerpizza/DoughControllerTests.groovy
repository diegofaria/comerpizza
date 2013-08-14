package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(DoughController)
@Mock(Dough)
class DoughControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dough/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.doughInstanceList.size() == 0
        assert model.doughInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.doughInstance != null
    }

    void testSave() {
        controller.save()

        assert model.doughInstance != null
        assert view == '/dough/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dough/show/1'
        assert controller.flash.message != null
        assert Dough.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dough/list'

        populateValidParams(params)
        def dough = new Dough(params)

        assert dough.save() != null

        params.id = dough.id

        def model = controller.show()

        assert model.doughInstance == dough
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dough/list'

        populateValidParams(params)
        def dough = new Dough(params)

        assert dough.save() != null

        params.id = dough.id

        def model = controller.edit()

        assert model.doughInstance == dough
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dough/list'

        response.reset()

        populateValidParams(params)
        def dough = new Dough(params)

        assert dough.save() != null

        // test invalid parameters in update
        params.id = dough.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dough/edit"
        assert model.doughInstance != null

        dough.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dough/show/$dough.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dough.clearErrors()

        populateValidParams(params)
        params.id = dough.id
        params.version = -1
        controller.update()

        assert view == "/dough/edit"
        assert model.doughInstance != null
        assert model.doughInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dough/list'

        response.reset()

        populateValidParams(params)
        def dough = new Dough(params)

        assert dough.save() != null
        assert Dough.count() == 1

        params.id = dough.id

        controller.delete()

        assert Dough.count() == 0
        assert Dough.get(dough.id) == null
        assert response.redirectedUrl == '/dough/list'
    }
}
