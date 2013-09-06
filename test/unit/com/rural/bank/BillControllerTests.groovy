package com.rural.bank



import org.junit.*
import grails.test.mixin.*

@TestFor(BillController)
@Mock(Bill)
class BillControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bill/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.billInstanceList.size() == 0
        assert model.billInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.billInstance != null
    }

    void testSave() {
        controller.save()

        assert model.billInstance != null
        assert view == '/bill/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bill/show/1'
        assert controller.flash.message != null
        assert Bill.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bill/list'

        populateValidParams(params)
        def bill = new Bill(params)

        assert bill.save() != null

        params.id = bill.id

        def model = controller.show()

        assert model.billInstance == bill
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bill/list'

        populateValidParams(params)
        def bill = new Bill(params)

        assert bill.save() != null

        params.id = bill.id

        def model = controller.edit()

        assert model.billInstance == bill
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bill/list'

        response.reset()

        populateValidParams(params)
        def bill = new Bill(params)

        assert bill.save() != null

        // test invalid parameters in update
        params.id = bill.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bill/edit"
        assert model.billInstance != null

        bill.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bill/show/$bill.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bill.clearErrors()

        populateValidParams(params)
        params.id = bill.id
        params.version = -1
        controller.update()

        assert view == "/bill/edit"
        assert model.billInstance != null
        assert model.billInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bill/list'

        response.reset()

        populateValidParams(params)
        def bill = new Bill(params)

        assert bill.save() != null
        assert Bill.count() == 1

        params.id = bill.id

        controller.delete()

        assert Bill.count() == 0
        assert Bill.get(bill.id) == null
        assert response.redirectedUrl == '/bill/list'
    }
}
