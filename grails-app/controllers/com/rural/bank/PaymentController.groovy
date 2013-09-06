package com.rural.bank

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Random
import java.math.BigDecimal

import org.springframework.dao.DataIntegrityViolationException


class PaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def pdfRenderingService

    def renderFormPDF(){
        println params
        def list = searchPayment(params)
        def args = [template:"report", model:[paymentInstanceList: list]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    private searchPayment(params){
        def searchValue = params.searchValue
        def filter = params.filter
        def list = Payment.list(params)

        if(searchValue){
            list = []
            if(filter.trim() == "Institution"){
                Institution institution = Institution.get(Long.parseLong(searchValue))
                if(institution){
                    println institution.name
                    /*	def bills = Bill.findAllByInstitution(institution)

                        bills.each{
                            list.add( Payment.findByBill(it) )
                        }*/
                }
            }
            else if(filter.trim() == "Date"){
                searchValue = params.date_year+"/"+params.date_month+"/"+params.date_day
                SimpleDateFormat sdf  = new SimpleDateFormat("yyyy/MM/d")
                list = Payment.findAllByTransactionDate(sdf.parse(searchValue), [order:"asc", sort:"transactionNumber"])
            }
            else if(filter.trim() == 'Payment Mode'){
                list = Payment.findAllByPaymentModeIlike(searchValue, [order:"asc", sort:"transactionNumber"])    //search payment case insensitive
            }

        }
        return list
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def list = searchPayment(params)
        Integer paymentInstanceTotal = params.searchValue?list.size():Payment.count()

        [paymentInstanceList: list, params: params, paymentInstanceTotal:paymentInstanceTotal]
    }

    private Payment createDefaultPayment(){
        Payment payment = new Payment()
        Random randomizer = new Random()
        Long random = randomizer.nextLong()
        while(random<0){
            random = randomizer.nextLong()
        }
        if(payment instanceof Payment){
            payment.transactionNumber =  random.toString()
        }
        return payment;
    }

    def create() {
        def payment = createDefaultPayment()

        if(params.paymentMode){ //user submitted paymentModeForm
            if(params.cheque || params.paymentMode != 'Check'){
                payment.paymentMode = params.paymentMode
                if(params.cheque){
                    payment.check = Cheque.get(params.cheque)
                }
                return [paymentInstance: payment]
            }

            else{   // user selected Cheque as payment mode
                return [chequeInstance: new Cheque(params)]
            }
        }
        else{
            [payment: payment]
        }
    }

    def save() {
        println params
        def customer = new Customer(params)
/*		Bill billInstance = Bill.findByBillNumber(params.billNumber)?:new Bill(params)

		bindData(paymentInstance, params, [exclude:'bill'])*/
        //changed def to Payment
        Payment paymentInstance = new Payment()

        Cheque check = params.cheque? Cheque.get(Long.parseLong(params.cheque)): null
        paymentInstance.check = check

        paymentInstance.paymentMode = params.paymentMode

        def model = [paymentInstance: paymentInstance, customerInstance:customer]
        if(!customer.save( insert: true)){
            render(view: "create", model: model,
                    params:params)
            return
        }
        else{
            println "saved customer "+ customer

            def institution = Institution.get(params.institution.id)
            institution.addToCustomers(customer)
            if(!institution.save()){
                //remove customer to institution if update is unsuccessful
                institution.removeFromCustomers(customer)
                render(view: "create", model: model,
                        params:params)
                return
            }
            else{
                println "add custom to institution "+ institution

                if (!paymentInstance.save(flush:true)) {
                    model = [paymentInstance: paymentInstance, customerInstance:customer]
                    institution.removeFromCustomers(customer)
                    //println paymentInstance.errors
                    render(view: "create", model: model,
                            params:[paymentMode: paymentInstance.paymentMode])
                    return
                }
                else{
                    flash.message = message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance])
                    redirect(action: "show", id: paymentInstance.id)
                }

            }
        }
    }

    /*def savePayment(Payment payment, Cheque check) {
        payment.check = check
        if(!payment.save()){
            return false
        }
        return true

    }*/

    def saveCheque() {
        def chequeInstance = new Cheque(params)
        if (!chequeInstance.save(flush: true)) {
            render(view: "create", model: [chequeInstance: chequeInstance], params:[paymentMode:'Check'])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])
        redirect(action: "create", params:[paymentMode:'Check', cheque: chequeInstance.id])
    }

    def show(Long id) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        [paymentInstance: paymentInstance]
    }

    def edit(Long id) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        [paymentInstance: paymentInstance]
    }

    def update(Long id, Long version) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paymentInstance.version > version) {
                paymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'payment.label', default: 'Payment')] as Object[],
                        "Another user has updated this Payment while you were editing")
                render(view: "edit", model: [paymentInstance: paymentInstance])
                return
            }
        }

        paymentInstance.properties = params

        if (!paymentInstance.save(flush: true)) {
            render(view: "edit", model: [paymentInstance: paymentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
        redirect(action: "show", id: paymentInstance.id)
    }

    def delete(Long id) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        try {
            paymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "show", id: id)
        }
    }

    def generateReport(){
        println params
        //checks if searchValue is valid
        def searchValue = params.value
        if(!searchValue && params.filter.id!=' Date '){
            redirect action:'list', params:params
            return
        }

        def filter = params.filter
        def result

        if(filter.id== ' Institution '){
            searchValue = params.institution.id
            result = Institution.get(searchValue)
            if(result){ //result should be set to institution id
                result = searchValue
            }

        }
        else if(filter.id== ' Date '){
            searchValue = params.date_year+"/"+params.date_month+"/"+params.date_day
            SimpleDateFormat sdf  = new SimpleDateFormat("yyyy/MM/d")
            result = sdf.parse(searchValue)
        }
        else if(filter.id== ' Payment Mode '){
            result = ["cash", "check", "cheque"].find{ it == searchValue.trim().toLowerCase() }
            if(result=="cheque"){ result = "check" }
        }
        if(result){
            params.searchValue = result
        }else{
            flash.message = " Invalid Search Value"
        }
        params.filter = filter.id

        if(params.Generate){
            redirect action:'list', params:params
        }
        else{
            redirect action:'renderFormPDF', params:params
        }
    }
}

 