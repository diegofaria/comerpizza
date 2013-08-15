package br.com.comerpizza

public enum Status {

	PLACED,     // Pedido realizado
	CONFIRMED,  // Pedido pago
	ONGOING,    // Em andamento
	DELIVERING, // Saiu para entrega
	SUCCESS     // Entregue

	String name

    private UF(String name){
	    this.name = name;
	}
}