package br.com.comerpizza

class Ingredient {

	String name
	String description
	Boolean isHidden
	Boolean isActive
	Double price

    static constraints = {
    	name(blank: false, nullable: false)
    }
}
