package com.rural.bank

class Payment {

	String transactionNumber;
	Date transactionDate;
//	Bill bill;
	String paymentMode; //cash, check or account
	Cheque check; //will have a value only when payment mode is check
	BigDecimal amount;
	
    static constraints = {
		check nullable:true, blank:true
 //       bill nullable:true, blank:true
		transactionNumber nullable:false, blank:false, unique:true //required field
		paymentMode inList: ["Cash", "Check"]
	}
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${transactionNumber}"
	}
}
