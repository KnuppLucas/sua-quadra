package models;
import models.Usuario;

public class TesteUsu {

	public static void main(String[] args) {
		//Usuario usu = new Usuario(0,"teste@123", "senha", 1, "Gabriel", "12345678978", "Endereco", "bairro","cidade","UF","08295050", "400028922", "foto", "s");
		//usu.save();
		
		Usuario usu = new Usuario(3,"teste@123", "senha", 1, "Gabriel", "12345678978", "Endereco", "bairro","cidade","UF","08295050", "400028922", "foto", "s");
		usu.delete();
	
	}

}
