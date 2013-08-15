package br.com.comerpizza

class Dessert {
	//sobremesa
	String name
	String description
	Double price
	String photoUrl
	String thumbnailUrl
	Boolean isHidden = false	//inativar a sobremesa temporariamente
	Boolean isActive			//desativar sobremesa
	Date createdOn
	Date updatedOn

    static constraints = {
    	name(blank: false, nullable:false)
    	price(nullable: false)
    }

    public Dessert() {
    	createdOn = new Date()
    }
}
