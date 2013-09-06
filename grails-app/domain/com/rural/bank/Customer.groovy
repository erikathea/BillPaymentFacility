package com.rural.bank

class Customer{

	String name;
	Date birthDate;
	String address;
	String contactNumber;

    static constraints = {
		name nullable:false, blank:false //required field
		address nullable:false, blank:false //required field
		birthDate nullable:false, blank:false //required field
		contactNumber nullable:false, blank:false, matches:"[0-9]*"
    }
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${name}"
	}
}

