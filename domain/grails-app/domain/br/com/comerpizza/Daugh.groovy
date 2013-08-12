package br.com.comerpizza

class Daugh {

	//Domimio para a massa

	String name
	String description
	String imageUrl
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(blank: false, nullable: false)
    }
}
