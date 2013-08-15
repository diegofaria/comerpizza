package br.com.comerpizza

class Ingredient {

	//Dominio para o ingrediente

	String name
	String description
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    }
}