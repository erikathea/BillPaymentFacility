package com.rural.bank

class BankAccount {

	Branch branch;
	String accountNumber;
	BigDecimal accountBalance;
	
    static constraints = {
		branch nullable:false, blank:false //required field
		accountNumber nullable:false, blank:false, unique:true  //can also add matches:”[0-9]” if accountNumber can only be digits
    }
	
	static auditable = true
	
	public String toString(){ // override toString
		return "${accountNumber}"
	}

}
