package br.com.comerpizza



import org.junit.*
import grails.test.mixin.*

@TestFor(DessertController)
@Mock(Dessert)
class DessertControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dessert/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dessertInstanceList.size() == 0
        assert model.dessertInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dessertInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dessertInstance != null
        assert view == '/dessert/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dessert/show/1'
        assert controller.flash.message != null
        assert Dessert.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dessert/list'

        populateValidParams(params)
        def dessert = new Dessert(params)

        assert dessert.save() != null

        params.id = dessert.id

        def model = controller.show()

        assert model.dessertInstance == dessert
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dessert/list'

        populateValidParams(params)
        def dessert = new Dessert(params)

        assert dessert.save() != null

        params.id = dessert.id

        def model = controller.edit()

        assert model.dessertInstance == dessert
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dessert/list'

        response.reset()

        populateValidParams(params)
        def dessert = new Dessert(params)

        assert dessert.save() != null

        // test invalid parameters in update
        params.id = dessert.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dessert/edit"
        assert model.dessertInstance != null

        dessert.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dessert/show/$dessert.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dessert.clearErrors()

        populateValidParams(params)
        params.id = dessert.id
        params.version = -1
        controller.update()

        assert view == "/dessert/edit"
        assert model.dessertInstance != null
        assert model.dessertInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dessert/list'

        response.reset()

        populateValidParams(params)
        def dessert = new Dessert(params)

        assert dessert.save() != null
        assert Dessert.count() == 1

        params.id = dessert.id

        controller.delete()

        assert Dessert.count() == 0
        assert Dessert.get(dessert.id) == null
        assert response.redirectedUrl == '/dessert/list'
    }
}
