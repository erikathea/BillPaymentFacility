package com.rural.bank

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	static auditable = true
	
	public String toString(){
		return "${authority}"
	}
}
