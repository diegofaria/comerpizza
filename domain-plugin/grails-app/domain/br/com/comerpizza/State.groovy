package br.com.comerpizza

class State {

	String name
	String acronym

	static hasMany = [
		cities:City
	]

    static constraints = {
    	name(blank: false, nullable:false)
    	acronym(maxSize: 2, blank: false, nullable:false)
    }
}
