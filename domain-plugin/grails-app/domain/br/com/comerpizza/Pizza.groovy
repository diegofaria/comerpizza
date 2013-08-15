package br.com.comerpizza

class Pizza {

	String name
	String description
	Category category 		// doce, salgada, mesclada
	PizzaType type 			// premium, quadrada, por metro
	Flavor flavor
	Size size
	Double price
	String photoUrl
	String thumbnailUrl
	Boolean isHidden		//inativar a pizza temporariamente por falta de ingrediente
	Boolean isActive		//desativar pizza
	Date createdOn
	Date updatedOn

    static constraints = {
    	name(blank: false, nullable:false)
    	flavor(nullable: false)
    	size(nullable: false)
    	price(nullable: false)
    }

    public Pizza() {
    	createdOn = new Date()
    }
}
