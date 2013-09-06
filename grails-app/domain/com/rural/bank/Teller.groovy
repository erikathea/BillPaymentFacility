package com.rural.bank

class Teller extends User {

	String employeeNumber;
	String name;
	Branch branch;
	
    static constraints = {
		branch nullable:false, blank:false //required field
		name nullable:false, blank:false //required field
		employeeNumber nullable:false, blank:false, unique:true  //can also add matches:”[0-9]” if employeeNumber can only be digits
    }
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${employeeNumber} ${name}"
	}

}
