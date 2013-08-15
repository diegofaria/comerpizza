package br.com.comerpizza

class PizzaType {

    String name

    static constraints = {
    	name(blank: false, nullable:false)
    }
}
