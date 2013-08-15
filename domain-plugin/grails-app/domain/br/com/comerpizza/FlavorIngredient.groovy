package br.com.comerpizza

class FlavorIngredient {

	Ingredient ingredient
	Boolean isAdditional // se eh um ingrediente adicional
	Double price // pois o ingrediente pode ser básico em uma, mas adicional em outra

    static constraints = {
    }

    static belongsTo = [pizza: Pizza, ingredient: Ingredient]
}
