package br.com.comerpizza

class Border {	
	//borda
	String name
	Double price
	String photoUrl
	String thumbnailUrl

    static constraints = {
    	name(blank: false, nullable: false)
    }
}
