package com.rural.bank



import org.junit.*
import grails.test.mixin.*

@TestFor(TellerController)
@Mock(Teller)
class TellerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/teller/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tellerInstanceList.size() == 0
        assert model.tellerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tellerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tellerInstance != null
        assert view == '/teller/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/teller/show/1'
        assert controller.flash.message != null
        assert Teller.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/teller/list'

        populateValidParams(params)
        def teller = new Teller(params)

        assert teller.save() != null

        params.id = teller.id

        def model = controller.show()

        assert model.tellerInstance == teller
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/teller/list'

        populateValidParams(params)
        def teller = new Teller(params)

        assert teller.save() != null

        params.id = teller.id

        def model = controller.edit()

        assert model.tellerInstance == teller
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/teller/list'

        response.reset()

        populateValidParams(params)
        def teller = new Teller(params)

        assert teller.save() != null

        // test invalid parameters in update
        params.id = teller.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/teller/edit"
        assert model.tellerInstance != null

        teller.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/teller/show/$teller.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        teller.clearErrors()

        populateValidParams(params)
        params.id = teller.id
        params.version = -1
        controller.update()

        assert view == "/teller/edit"
        assert model.tellerInstance != null
        assert model.tellerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/teller/list'

        response.reset()

        populateValidParams(params)
        def teller = new Teller(params)

        assert teller.save() != null
        assert Teller.count() == 1

        params.id = teller.id

        controller.delete()

        assert Teller.count() == 0
        assert Teller.get(teller.id) == null
        assert response.redirectedUrl == '/teller/list'
    }
}
