package br.com.comerpizza

class FlavorIngredient {

	Ingredient ingredient
	Boolean isAdditional // se eh um ingrediente adicional
	Double price = 0	 // pois o ingrediente pode ser básico em uma, mas adicional em outra

    static constraints = {
    }
}