package br.com.comerpizza

class Size {

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
