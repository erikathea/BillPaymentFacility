package com.rural.bank

class Bank {

	String branchName;
	String address;
	String contactNumber;
	
	static constraints = {
		branchName nullable:false, blank:false //required field
		address nullable:false, blank:false //required field
		contactNumber nullable:false, blank:false, matches:"[0-9]*"
    }
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${branchName}"
	}

}
