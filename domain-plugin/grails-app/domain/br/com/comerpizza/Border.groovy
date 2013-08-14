package br.com.comerpizza

class Border {
	
	//borda

	String name
	Double price

    static constraints = {
    	name(blank: false, nullable: false)
    }
}
