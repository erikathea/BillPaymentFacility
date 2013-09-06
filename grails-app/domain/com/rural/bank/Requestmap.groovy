package com.rural.bank

class Requestmap {

	String url
	String configAttribute

	static mapping = {
		cache true
	}
	static auditable = true
	
	static constraints = {
		url blank: false, unique: true
		configAttribute blank: false
	}
}
