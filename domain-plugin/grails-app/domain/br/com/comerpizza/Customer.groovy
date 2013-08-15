package br.com.comerpizza

class Customer {

	String name
	String lastName
	String email
	String mobilePhone
	String password

	static hasMany = [
		addresses:Address
	]

    static constraints = {
    	name(minSize:3, blank: false, nullable:false)
    	email(email: true, blank: false, nullable:false, unique: true)
    	password(minSize:4, blank: false, nullable:false)
    }
}
