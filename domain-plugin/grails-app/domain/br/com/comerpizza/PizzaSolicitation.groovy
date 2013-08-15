package br.com.comerpizza

class PizzaSolicitation {
	
	Pizza pizza	
	Border specialBorder	//se possui borda recheada
	Dough dough 			//tipo da massa
	Double price

	static hasMany = [
		flavors:Flavor
	]

    static constraints = {
    	pizza(nullable: false)
    	specialBorder(nullable: true)
    	dough(nullable: true)
    	price(nullable: false)
    }
}