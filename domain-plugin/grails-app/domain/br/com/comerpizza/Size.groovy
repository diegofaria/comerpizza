package br.com.comerpizza

class Size {

	//Domimio para o tamanho da pizza

	String name
	String description
	String photoUrl
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(blank: false, nullable: false)
    }
}
