package com.rural.bank

class Institution {

	String code;
	String name;
	
	static hasMany = [customers:Customer]
    static constraints = {
		code nullable:false, blank:false, unique:true
		name nullable:false, blank:false
        customers nullable: true, blank: true
    }
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${code} ${name}"
	}

}
