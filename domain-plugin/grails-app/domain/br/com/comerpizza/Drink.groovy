package br.com.comerpizza

class Drink {

	String name
	String description
	Double price
	String photoUrl
	String thumbnailUrl
	Boolean isHidden = false	//inativar a bebida temporariamente
	Boolean isActive			//desativar bebida
	Date createdOn
	Date updatedOn

    static constraints = {
    	name(blank: false, nullable:false)
    	price(nullable: false)
    }

    public Drink() {
    	createdOn = new Date()
    }
}
