package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import database.DBQuery;

public class Quadra{
	

	private int quadra_id;
	private String titulo;
	private String descricao;
	private String tipo;
	private String cep;
	private double preco;
	
	public Quadra() {

	}
	
	
	public DBQuery getDBQuery() {
		String	tableName  = "suaquadra.quadra";
		String	fieldsName  ="quadra_id,titulo,descricao,tipo,cep,preco";  
		String	fieldKey	="quadra_id";
		return( new DBQuery(tableName, fieldsName, fieldKey));
	}
	
	public String toJson() {
        String json = new Gson().toJson(this, this.getClass());
		return ( json );
	}
	
	public void fromJson(String json) {
		new Gson().fromJson(json, this.getClass());
	}
	
	public String[] toArray() {
		return(
			new String[] {
				this.getQuadra_id()+"",
				this.getTitulo(),
				this.getTipo(),
				this.getDescricao(),
				this.getCep(),
				this.getPreco()+""
			}
		);

	}
	
    public Quadra(int quadra_id, String titulo, String descricao, String tipo, String cep, double preco) {
        this.quadra_id = quadra_id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.tipo = tipo;
        this.cep = cep;
        this.preco = preco;
    }

	
public ArrayList<Quadra> listAll() {
		
		ArrayList<Quadra> listQuadra = new ArrayList<Quadra>(); 
		ResultSet rs = this.getDBQuery().select("");
		try {
			while (rs.next()) {
				Quadra tempQuadra = new Quadra(
						rs.getInt("quadra_id"),
						rs.getString("titulo"),
						rs.getString("descricao"),
						rs.getString("tipo"),
						rs.getString("cep"),
						rs.getDouble("preco")
				 );
				listQuadra.add(tempQuadra);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(listQuadra);
}

	public int getQuadra_id() {
		return quadra_id;
	}
	public void setQuadra_id(int quadra_id) {
		this.quadra_id = quadra_id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}

}
