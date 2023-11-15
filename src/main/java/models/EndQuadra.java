package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import database.DBQuery;

public class EndQuadra {
	
	private String cep;
	private String endereco;
	private String municipio;
	private String uf;
	
	
	public EndQuadra() {

	}
	
	public DBQuery getDBQuery() {
		String	tableName  = "suaquadra.end_quadra";
		String	fieldsName  ="cep,endereco,municipio,uf";  
		String	fieldKey	="cep";
		return( new DBQuery(tableName, fieldsName, fieldKey));
	}
	
	public String toJson() {
        String json = new Gson().toJson(this, this.getClass());
		return ( json );
	}
	
	public void fromJson(String json) {
		new Gson().fromJson(json, this.getClass());
	}
	
	
	public EndQuadra(String cep, String endereco, String municipio, String uf){
		this.setCep(cep);
		this.setEndereco(endereco);
		this.setMunicipio(municipio);
		this.setUf(uf);

	}
	
	public String[] toArray() {
		return(
			new String[] {
				this.getCep(),
				this.getEndereco(),
				this.getMunicipio(),
				this.getUf()
			}
		);

	}
	
	public ArrayList<EndQuadra> listAll() {
		
		ArrayList<EndQuadra> listEndQuadra = new ArrayList<EndQuadra>(); 
		ResultSet rs = this.getDBQuery().select("");
		try {
			while (rs.next()) {
				EndQuadra tempEndQuadra = new EndQuadra(
						rs.getString("cep"),
						rs.getString("endereco"),
						rs.getString("municipio"),
						rs.getString("uf")
				 );
				listEndQuadra.add(tempEndQuadra);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(listEndQuadra);
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	

}
