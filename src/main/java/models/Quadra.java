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
	private String foto;
	private String tipo;
	private String cep;
	private double preco;
	private String endereco;
	private String bairro;
	private String municipio;
	private String uf;
	
	public Quadra() {

	}
	
	
	public DBQuery getDBQuery() {
		String	tableName  = "suaquadra.quadra";
		String	fieldsName  ="quadra_id,titulo,descricao,foto,tipo,cep,preco,endereco,bairro,municipio,uf";  
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
				this.getFoto(),
				this.getDescricao(),
				this.getCep(),
				this.getPreco()+"",
				this.getEndereco(),
				this.getBairro(),
				this.getMunicipio(),
				this.getUf()
			}
		);

	}
	
	public Quadra(int quadra_id, String titulo, String descricao, String foto, String tipo, String cep, double preco, String endereco, String bairro, String municipio, String uf) {
		this.quadra_id = quadra_id;
		this.titulo = titulo;
		this.descricao = descricao;
		this.foto = foto;
		this.tipo = tipo;
		this.cep = cep;
		this.preco = preco;
		this.endereco = endereco;
		this.bairro = bairro;
		this.municipio = municipio;
		this.uf = uf;
	}
	
	public Quadra(int quadra_id) {
		this.quadra_id = quadra_id;
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
						rs.getString("foto"),						
						rs.getString("tipo"),
						rs.getString("cep"),
						rs.getDouble("preco"),
						rs.getString("endereco"),
						rs.getString("bairro"),
						rs.getString("municipio"),
						rs.getString("uf")
				 );
				listQuadra.add(tempQuadra);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(listQuadra);
}

public ArrayList<Quadra> listData(String data_inicio, String data_fim) {
	
	ArrayList<Quadra> listQuadra = new ArrayList<Quadra>();
	String a = "quadra_id NOT IN ("
			+ " SELECT l.quadra_id"
			+ " FROM locacao l"
			+ " WHERE l.locacao_data BETWEEN '"+data_inicio+"' AND '"+data_fim+"'"
			+ " OR l.locacao_data IS NULL)";
	System.out.println("\n"+a);
	ResultSet rs = this.getDBQuery().select(a);
	System.out.println("\n"+a);
	try {
		while (rs.next()) {
			Quadra tempQuadra = new Quadra(
					rs.getInt("quadra_id"),
					rs.getString("titulo"),
					rs.getString("descricao"),
					rs.getString("foto"),						
					rs.getString("tipo"),
					rs.getString("cep"),
					rs.getDouble("preco"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("municipio"),
					rs.getString("uf")
			 );
			listQuadra.add(tempQuadra);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return(listQuadra);
}

public ArrayList<Quadra> listEndereco(String uf) {
	
	ArrayList<Quadra> listQuadra = new ArrayList<Quadra>();
	String a = "UF = '"+uf+"'";
	ResultSet rs = this.getDBQuery().select(a);
	try {
		while (rs.next()) {
			Quadra tempQuadra = new Quadra(
					rs.getInt("quadra_id"),
					rs.getString("titulo"),
					rs.getString("descricao"),
					rs.getString("foto"),						
					rs.getString("tipo"),
					rs.getString("cep"),
					rs.getDouble("preco"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("municipio"),
					rs.getString("uf")
			 );
			listQuadra.add(tempQuadra);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return(listQuadra);
}

public ArrayList<Quadra> listEndereco(String uf, String municipio) {
	
	ArrayList<Quadra> listQuadra = new ArrayList<Quadra>();
	String a = "UF = '"+uf+
			 "' AND lower(municipio) like lower('%"+municipio+"%')";
	ResultSet rs = this.getDBQuery().select(a);
	try {
		while (rs.next()) {
			Quadra tempQuadra = new Quadra(
					rs.getInt("quadra_id"),
					rs.getString("titulo"),
					rs.getString("descricao"),
					rs.getString("foto"),						
					rs.getString("tipo"),
					rs.getString("cep"),
					rs.getDouble("preco"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("municipio"),
					rs.getString("uf")
			 );
			listQuadra.add(tempQuadra);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return(listQuadra);
}

public ArrayList<Quadra> listEndereco(String uf, String municipio, String bairro) {
	
	ArrayList<Quadra> listQuadra = new ArrayList<Quadra>();
	String a = "UF = '"+uf+
			 "' AND lower(municipio) like lower('%"+municipio+"%')"+
			 " AND lower(bairro) like lower('%"+bairro+"%')";
	ResultSet rs = this.getDBQuery().select(a);
	try {
		while (rs.next()) {
			Quadra tempQuadra = new Quadra(
					rs.getInt("quadra_id"),
					rs.getString("titulo"),
					rs.getString("descricao"),
					rs.getString("foto"),						
					rs.getString("tipo"),
					rs.getString("cep"),
					rs.getDouble("preco"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("municipio"),
					rs.getString("uf")
			 );
			listQuadra.add(tempQuadra);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return(listQuadra);
}


public ArrayList<Quadra> listDataEndereco(String data_inicio,String data_fim,String uf) {
	
	ArrayList<Quadra> listQuadra = new ArrayList<Quadra>();
	String a = "UF = '"+uf+"'"
			+ " AND quadra_id NOT IN ("
			+ " SELECT l.quadra_id"
			+ " FROM locacao l"
			+ " WHERE l.locacao_data BETWEEN '"+data_inicio+"' AND '"+data_fim+"'"
			+ " OR l.locacao_data IS NULL)";
	ResultSet rs = this.getDBQuery().select(a);
	try {
		while (rs.next()) {
			Quadra tempQuadra = new Quadra(
					rs.getInt("quadra_id"),
					rs.getString("titulo"),
					rs.getString("descricao"),
					rs.getString("foto"),						
					rs.getString("tipo"),
					rs.getString("cep"),
					rs.getDouble("preco"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("municipio"),
					rs.getString("uf")
			 );
			listQuadra.add(tempQuadra);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return(listQuadra);
}

public ArrayList<Quadra> listByType(String tipo) {
    ArrayList<Quadra> listQuadra = new ArrayList<>();
    String condition = "lower(tipo) like lower('%" + tipo + "%')";
    ResultSet rs = this.getDBQuery().select(condition);
    try {
        while (rs.next()) {
            Quadra tempQuadra = new Quadra(
                    rs.getInt("quadra_id"),
                    rs.getString("titulo"),
                    rs.getString("descricao"),
                    rs.getString("foto"),
                    rs.getString("tipo"),
                    rs.getString("cep"),
                    rs.getDouble("preco"),
                    rs.getString("endereco"),
                    rs.getString("bairro"),
                    rs.getString("municipio"),
                    rs.getString("uf")
            );
            listQuadra.add(tempQuadra);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return listQuadra;
}



public int save() {
	if (this.getQuadra_id() > 0) {
		return this.getDBQuery().update(this.toArray());
	}else {
		return this.getDBQuery().insert(this.toArray());
	}
}

public int delete() {
	if (this.getQuadra_id() > 0) {
		return this.getDBQuery().delete(this.toArray());
	}
	return(0);
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


public String getFoto() {
	return foto;
}


public void setFoto(String foto) {
	this.foto = foto;
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


public String getEndereco() {
	return endereco;
}


public void setEndereco(String endereco) {
	this.endereco = endereco;
}


public String getBairro() {
	return bairro;
}


public void setBairro(String bairro) {
	this.bairro = bairro;
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
