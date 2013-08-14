package br.com.comerpizza

class PizzaIngredient {

	Ingredient ingredient
	Boolean isExtra // se eh um ingrediente adicional

    static constraints = {
    }

    static belongsTo = [pizza: Pizza, ingredient: Ingredient]
}
