package br.com.comerpizza

class Size {
	//tamanho da pizza
	String name
	String description
	String photoUrl
	Boolean isHidden = false
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(blank: false, nullable: false)
    }
}
