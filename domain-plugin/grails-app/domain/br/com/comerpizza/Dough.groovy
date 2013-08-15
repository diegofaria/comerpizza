package br.com.comerpizza

class Dough {
	//massa
	String name
	String description
	String photoUrl
	String thumbnailUrl
	Boolean isHidden
	Boolean isActive

    static constraints = {
    	name(blank: false, nullable: false)
    	description(blank: false, nullable: false)
    }
}
