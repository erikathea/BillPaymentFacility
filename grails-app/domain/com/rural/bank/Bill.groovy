package com.rural.bank

import org.apache.commons.lang.builder.HashCodeBuilder;

class Bill {

    String billNumber;
//    Institution institution;
//    Customer customer;
    BigDecimal balanceDue;
    Date dueDate;

    static constraints = {
        billNumber nullable:false, blank:false, unique:true
//        customer nullable:true, blank:true
        balanceDue nullable:false, blank:false
//        institution nullable:true, blank:true
        dueDate nullable:true, blank:true
    }
	
//	static auditable = true

    @Override
    public int hashCode(){
        return new HashCodeBuilder()
                .append(billNumber)
                .hashCode();
    }

    @Override
    public boolean equals(Object object){
        if (object == null){
            return false;
        }
        if (!(object instanceof Bill)){
            return false;
        }
        if (((Bill) object).billNumber != billNumber){
            return false;
        }
        return true;
    }	

}
