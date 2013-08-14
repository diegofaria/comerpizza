package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(SizeController)
@Mock(Size)
class SizeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/size/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sizeInstanceList.size() == 0
        assert model.sizeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sizeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sizeInstance != null
        assert view == '/size/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/size/show/1'
        assert controller.flash.message != null
        assert Size.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/size/list'

        populateValidParams(params)
        def size = new Size(params)

        assert size.save() != null

        params.id = size.id

        def model = controller.show()

        assert model.sizeInstance == size
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/size/list'

        populateValidParams(params)
        def size = new Size(params)

        assert size.save() != null

        params.id = size.id

        def model = controller.edit()

        assert model.sizeInstance == size
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/size/list'

        response.reset()

        populateValidParams(params)
        def size = new Size(params)

        assert size.save() != null

        // test invalid parameters in update
        params.id = size.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/size/edit"
        assert model.sizeInstance != null

        size.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/size/show/$size.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        size.clearErrors()

        populateValidParams(params)
        params.id = size.id
        params.version = -1
        controller.update()

        assert view == "/size/edit"
        assert model.sizeInstance != null
        assert model.sizeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/size/list'

        response.reset()

        populateValidParams(params)
        def size = new Size(params)

        assert size.save() != null
        assert Size.count() == 1

        params.id = size.id

        controller.delete()

        assert Size.count() == 0
        assert Size.get(size.id) == null
        assert response.redirectedUrl == '/size/list'
    }
}
