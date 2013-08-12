package br.com.comerpizza

class Flavor {

	//Dominio para o sabor

	String name
	String description
	String imageUrl
	String thumbnailUrl
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	imageUrl(blank: false, nullable: false)
    	thumbnailUrl(blank: false, nullable: false)
    }
}
