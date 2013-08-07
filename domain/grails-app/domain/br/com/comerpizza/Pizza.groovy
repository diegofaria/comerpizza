package br.com.comerpizza

class Pizza {

	String name
	Boolean isHidden		//inativar a pizza temporariamente por falta de ingrediente
	Boolean isActive		//desativar o tipo de pizza			
	Size size 				
	Border specialBorder	//se possui borda recheada
	Dough dough 			//tipo da massa
	Date createdOn
	Date updatedOn
	Double price

	static hasMany = [
		flavors:Flavor,
		ingredients:Ingredient,
		additionalIngredients:Ingredient
	]

    static constraints = {
    	name(blank: false, nullable:false)
    	size(nullable: false)
    	specialBorder(nullable: true)
    	dough(nullable: true)
    }
}