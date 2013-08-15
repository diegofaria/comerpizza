package br.com.comerpizza

class Category {

	String name

    static constraints = {
    	name(blank: false, nullable:false)
    }
}
