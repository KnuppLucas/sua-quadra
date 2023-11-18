package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import database.DBQuery;

public class Locacao {
	
	private int locacao_id;
	private int quadra_id;
	private String locacao_data;
	private String horario_entrada;
	private String horario_saida;
	private int qtde_horas;
	private int cliente;
	
	public Locacao() {
		
	}
	
	public DBQuery getDBQuery() {
		String	tableName  = "suaquadra.locacao";
		String	fieldsName  ="locacao_id,quadra_id,locacao_data,horario_entrada,horario_saida,qtde_horas,cliente";  
		String	fieldKey	="locacao_id";
		return( new DBQuery(tableName, fieldsName, fieldKey));
	}
	
	public String toJson() {
        String json = new Gson().toJson(this, this.getClass());
		return ( json );
	}
	
	public void fromJson(String json) {
		new Gson().fromJson(json, this.getClass());
	}
	
	public Locacao(int locacao_id, int quadra_id, String locacao_data, String horario_entrada, String horario_saida, int qtde_horas, int cliente) {
	        this.locacao_id = locacao_id;
	        this.quadra_id = quadra_id;
	        this.locacao_data = locacao_data;
	        this.horario_entrada = horario_entrada;
	        this.horario_saida = horario_saida;
	        this.qtde_horas = qtde_horas;
	        this.cliente = cliente;
	}
	
	public String[] toArray() {
		return(
			new String[] {
				this.getLocacao_id()+"",
				this.getQuadra_id()+"",
				this.getLocacao_data(),
				this.getHorario_entrada(),
				this.getHorario_saida(),
				this.getQtde_horas()+"",
				this.getCliente()+""
			}
		);

	}
	
public ArrayList<Locacao> listAll() {
		
		ArrayList<Locacao> listLocacao = new ArrayList<Locacao>(); 
		ResultSet rs = this.getDBQuery().select("");
		try {
			while (rs.next()) {
				Locacao tempLocacao = new Locacao(
						rs.getInt("locacao_id"),
						rs.getInt("quadra_id"),
						rs.getString("locacao_data"),
						rs.getString("horario_entrada"),
						rs.getString("horario_saida"),
						rs.getInt("qtde_horas"),
						rs.getInt("cliente")
				 );
				listLocacao.add(tempLocacao);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(listLocacao);
}

public int save() {
	if (this.getLocacao_id() > 0) {
		return this.getDBQuery().update(this.toArray());
	}else {
		return this.getDBQuery().insert(this.toArray());
	}
}

public int delete() {
	if (this.getLocacao_id() > 0) {
		return this.getDBQuery().delete(this.toArray());
	}
	return(0);
}


	
	
	public int getLocacao_id() {
		return locacao_id;
	}
	public void setLocacao_id(int locacao_id) {
		this.locacao_id = locacao_id;
	}
	public int getQuadra_id() {
		return quadra_id;
	}
	public void setQuadra_id(int quadra_id) {
		this.quadra_id = quadra_id;
	}
	public String getLocacao_data() {
		return locacao_data;
	}
	public void setLocacao_data(String locacao_data) {
		this.locacao_data = locacao_data;
	}
	public String getHorario_entrada() {
		return horario_entrada;
	}
	public void setHorario_entrada(String horario_entrada) {
		this.horario_entrada = horario_entrada;
	}
	public String getHorario_saida() {
		return horario_saida;
	}
	public void setHorario_saida(String horario_saida) {
		this.horario_saida = horario_saida;
	}
	public int getQtde_horas() {
		return qtde_horas;
	}
	public void setQtde_horas(int qtde_hotas) {
		this.qtde_horas = qtde_hotas;
	}
	public int getCliente() {
		return cliente;
	}
	public void setCliente(int cliente) {
		this.cliente = cliente;
	}
	
	

}
