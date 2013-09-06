package com.rural.bank

class Cheque {
	String type;
	String number;
	Date date;
	
    static constraints = {
		number nullable:false, blank:false
		type inList: ["Local", "Regional" ]
	}
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${number} ${type}"
	}

}
