package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import database.DBQuery;

public class Avaliacao {

	private int avaliacao_id;
	private int locacao_id;  
	private int pontuacao; 
	private String comentario;  
	
	public Avaliacao() {
		
	}
	
	public DBQuery getDBQuery() {
		String	tableName  = "suaquadra.avaliacao";
		String	fieldsName  ="avaliacao_id,locacao_id,pontuacao,comentario";  
		String	fieldKey	="avaliacao_id";
		return( new DBQuery(tableName, fieldsName, fieldKey));
	}
	
	public String toJson() {
        String json = new Gson().toJson(this, this.getClass());
		return ( json );
	}
	
	public void fromJson(String json) {
		new Gson().fromJson(json, this.getClass());
	}

	public Avaliacao(int avaliacao_id, int locacao_id, int pontuacao, String comentario) {
		this.avaliacao_id = avaliacao_id;
		this.locacao_id = locacao_id;
		this.pontuacao = pontuacao;
		this.comentario = comentario;
	}
	
	public Avaliacao(int avaliacao_id) {
		this.avaliacao_id = avaliacao_id;
	}
	
	public String[] toArray() {
		return(
			new String[] {
				this.getAvaliacao_id()+"",
				this.getLocacao_id()+"",
				this.getPontuacao()+"",
				this.getComentario()
			}
		);

	}
	
	
	public ArrayList<Avaliacao> listAll() {
			
			ArrayList<Avaliacao> listAvaliacao = new ArrayList<Avaliacao>(); 
			ResultSet rs = this.getDBQuery().select("");
			try {
				while (rs.next()) {
					Avaliacao tempAvaliacao = new Avaliacao(
							rs.getInt("avaliacao_id"),
							rs.getInt("locacao_id"),
							rs.getInt("pontuacao"),
							rs.getString("comentario")
					 );
					listAvaliacao.add(tempAvaliacao);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return(listAvaliacao);
	}
	
	public int save() {
		if (this.getAvaliacao_id() > 0) {
			return this.getDBQuery().update(this.toArray());
		}else {
			return this.getDBQuery().insert(this.toArray());
		}
	}

	public int delete() {
		if (this.getAvaliacao_id() > 0) {
			return this.getDBQuery().delete(this.toArray());
		}
		return(0);
	}

	
	public int getAvaliacao_id() {
		return avaliacao_id;
	}
	public void setAvaliacao_id(int avaliacao_id) {
		this.avaliacao_id = avaliacao_id;
	}
	public int getLocacao_id() {
		return locacao_id;
	}
	public void setLocacao_id(int locacao_id) {
		this.locacao_id = locacao_id;
	}
	public int getPontuacao() {
		return pontuacao;
	}
	public void setPontuacao(int pontuacao) {
		this.pontuacao = pontuacao;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

}
