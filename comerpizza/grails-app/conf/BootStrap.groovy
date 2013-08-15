import br.com.comerpizza.*;

class BootStrap {

    def init = { servletContext ->

		//def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		//def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

		//def testUser = new User(username: 'me', enabled: true, password: 'password')
		//testUser.save(flush: true)

		//UserRole.create testUser, adminRole, true

		//assert User.count() == 1
		//assert Role.count() == 2
		//assert UserRole.count() == 1


		//pizza time!
		def doceCategory = new Category()
		doceCategory.name = "Doce"
		doceCategory.save(flush:true, failOnError: true)

		def salgadaCategory = new Category()
		salgadaCategory.name = "Salgada"
		salgadaCategory.save(flush:true, failOnError: true)

		def normalPizzaType = new PizzaType()
		normalPizzaType.name = "Normal"
		normalPizzaType.save(flush:true, failOnError: true)

		def quadradaPizzaType = new PizzaType()
		quadradaPizzaType.name = "Quadrada"
		quadradaPizzaType.save(flush:true, failOnError: true)

		def brotoSize = new Size()
		brotoSize.name = "Broto"
		brotoSize.description = "Pizza do tamanho broto (pequeno)"
		brotoSize.photoUrl = "http://images03.olx.com.br/ui/20/96/31/1332872292_337739531_3-vendo-pizza-brotinho-no-atacado-Rio-de-Janeiro.jpg"
		brotoSize.isActive = true
		brotoSize.save(flush:true, failOnError: true)

		def mediaSize = new Size()
		mediaSize.name = "Média"
		mediaSize.description = "Pizza do tamanho médio"
		mediaSize.photoUrl = "http://pizzaria.luigipizzas.com.br/product_images/f/462/pizza_media__58232_zoom.jpg"
		mediaSize.isActive = true
		mediaSize.save(flush:true, failOnError: true)

		def grandeSize = new Size()
		grandeSize.name = "Grande"
		grandeSize.description = "Pizza do tamanho grande"
		grandeSize.photoUrl = "http://lh5.ggpht.com/xzTFlR4Fkm91LEYyp0QicRSVG0hhKjBKzr8uywNvRu9I_9J3mUIqAIHGspnym2KL05QA4Jk2cICwxDnZaIQaoswDIRWIO7g76wRZfA"
		grandeSize.isActive = true
		grandeSize.save(flush:true, failOnError: true)

		def tomateIngredient = new Ingredient()
		tomateIngredient.name = "Tomate"
		tomateIngredient.isActive = true
		tomateIngredient.save(flush:true, failOnError: true)

		def queijoIngredient = new Ingredient()
		queijoIngredient.name = "Queijo"
		queijoIngredient.isActive = true
		queijoIngredient.save(flush:true, failOnError: true)

		def cebolaIngredient = new Ingredient()
		cebolaIngredient.name = "Cebola"
		cebolaIngredient.isActive = true
		cebolaIngredient.save(flush:true, failOnError: true)

		def calabraIngredient1 = new FlavorIngredient()
		calabraIngredient1.ingredient = tomateIngredient
		calabraIngredient1.isAdditional = true
		calabraIngredient1.price = 1
		calabraIngredient1.save(flush:true, failOnError: true)

		def calabraIngredient2 = new FlavorIngredient()
		calabraIngredient2.ingredient = queijoIngredient
		calabraIngredient2.isAdditional = false
		calabraIngredient2.save(flush:true, failOnError: true)

		def calabraIngredient3 = new FlavorIngredient()
		calabraIngredient3.ingredient = cebolaIngredient
		calabraIngredient3.isAdditional = false
		calabraIngredient3.save(flush:true, failOnError: true)

		def calabresaFlavor = new Flavor()
		calabresaFlavor.name = "Calabresa"
		calabresaFlavor.description = "Calabresa, queijo, cebola, molho de tomate e azeitonas"
		calabresaFlavor.isActive = true
		calabresaFlavor.save(flush:true, failOnError: true)

		def calabraPizza = new Pizza()
		calabraPizza.name = "Pizza de calabresa"
		calabraPizza.description = "Pizza de calabresa, queijo, cebola, molho de tomate e azeitonas"
		calabraPizza.category = salgadaCategory
		calabraPizza.type = normalPizzaType
		calabraPizza.flavor = calabresaFlavor
		calabraPizza.size = mediaSize
		calabraPizza.price = 20
		calabraPizza.photoUrl = "http://choperiaoasis.com.br/wp-content/uploads/2012/06/pizza-calabresa-2.jpg"
		calabraPizza.thumbnailUrl = "http://www.gigantedelivery.com.br/uploads/shop/3/pizza_calabresa.jpg"
		calabraPizza.isActive = true
		calabraPizza.save(flush:true, failOnError: true)
    }
    def destroy = {
    }
}
