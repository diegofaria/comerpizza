package br.com.comerpizza

class Solicitation {

	Customer customer
	Double total
	Status status
	String notes
	Date createdOn
	Date updatedOn

	static hasMany = [
		pizzaSolicitations:PizzaSolicitation,
		drinks:Drink,
		desserts:Dessert
	]

    static constraints = {
    	total(nullable: false)
    	status(nullable: false, enumType:"ordinal")
    }

    public Solicitation() {
    	createdOn = new Date()
    }
}