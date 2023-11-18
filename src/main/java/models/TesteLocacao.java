package models;
import models.Locacao;

public class TesteLocacao {
	
	public static void main(String[] args) {
		Locacao l = new Locacao(3, 1, "2023-11-17", "12:00", "14:00", 2, 2);
		l.delete();
	}

}
