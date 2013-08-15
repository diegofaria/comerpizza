package br.com.comerpizza

class City {

	String name
	State state

	static belongsTo = [state: State]

    static constraints = {
    	name(blank: false, nullable:false)
    	state(nullable:false)
    }
}
