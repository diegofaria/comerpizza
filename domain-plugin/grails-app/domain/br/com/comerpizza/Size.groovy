package br.com.comerpizza

class Size {

	//Domimio para o tamanho da pizza

	String name
	String description
	String imageUrl
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(blank: false, nullable: false)
    	imageUrl(blank: false, nullable: false)
    }
}
