package br.com.comerpizza

class Ingredient {
	//ingrediente
	String name
	String description
	Boolean isHidden = false
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(nullable: true)
    }
}