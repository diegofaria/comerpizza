package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(BorderController)
@Mock(Border)
class BorderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/border/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.borderInstanceList.size() == 0
        assert model.borderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.borderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.borderInstance != null
        assert view == '/border/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/border/show/1'
        assert controller.flash.message != null
        assert Border.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/border/list'

        populateValidParams(params)
        def border = new Border(params)

        assert border.save() != null

        params.id = border.id

        def model = controller.show()

        assert model.borderInstance == border
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/border/list'

        populateValidParams(params)
        def border = new Border(params)

        assert border.save() != null

        params.id = border.id

        def model = controller.edit()

        assert model.borderInstance == border
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/border/list'

        response.reset()

        populateValidParams(params)
        def border = new Border(params)

        assert border.save() != null

        // test invalid parameters in update
        params.id = border.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/border/edit"
        assert model.borderInstance != null

        border.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/border/show/$border.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        border.clearErrors()

        populateValidParams(params)
        params.id = border.id
        params.version = -1
        controller.update()

        assert view == "/border/edit"
        assert model.borderInstance != null
        assert model.borderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/border/list'

        response.reset()

        populateValidParams(params)
        def border = new Border(params)

        assert border.save() != null
        assert Border.count() == 1

        params.id = border.id

        controller.delete()

        assert Border.count() == 0
        assert Border.get(border.id) == null
        assert response.redirectedUrl == '/border/list'
    }
}
