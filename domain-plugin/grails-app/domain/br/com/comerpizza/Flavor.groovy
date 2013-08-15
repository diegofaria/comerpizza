package br.com.comerpizza

class Flavor {
	//sabor
	String name
	String description
	Boolean isHidden
	Boolean isActive

	static hasMany = [
		ingredients:FlavorIngredient
	]

    static constraints = {
    	name(blank: false, nullable: false)
    }
}
