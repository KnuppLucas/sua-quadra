package controls;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import models.Quadra;

/**
 * Servlet implementation class ctrlQuadra
 */
@WebServlet("/quadra")
public class CtrlQuadra extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CtrlQuadra() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		switch (action) {
			case "all":{
	            ArrayList<Quadra> quadra = new Quadra().listAll();
	            Gson gson = new GsonBuilder().setPrettyPrinting().create();
	            String outJson = gson.toJson(quadra);
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            out.write(outJson);
			}break;
			case "data":{
				String data_inicio = request.getParameter("data_inicio");
				String data_fim = request.getParameter("data_fim");
				ArrayList<Quadra> quadra = new Quadra().listData(data_inicio, data_fim);
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(quadra);
				out.write(outJson);
			}break;
			case "endereco":{
				String uf = request.getParameter("uf");
				String municipio = request.getParameter("municipio");
				String bairro = request.getParameter("bairro");
				if(municipio != "" && bairro == "") {
					ArrayList<Quadra> quadra = new Quadra().listEndereco(uf,municipio);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
				if(municipio != "" && bairro != ""){
					ArrayList<Quadra> quadra = new Quadra().listEndereco(uf,municipio,bairro);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
				if(municipio == "" && bairro == ""){
					ArrayList<Quadra> quadra = new Quadra().listEndereco(uf);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
			}break;
			case "enderecoData":{
				String uf = request.getParameter("uf");
				String municipio = request.getParameter("municipio");
				String bairro = request.getParameter("bairro");
				String data_inicio = request.getParameter("data_inicio");
				String data_fim = request.getParameter("data_fim");
				if(municipio != "" && bairro == "") {
					ArrayList<Quadra> quadra = new Quadra().listEndereco(uf,municipio);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
				if(municipio != "" && bairro != ""){
					ArrayList<Quadra> quadra = new Quadra().listEndereco(uf,municipio,bairro);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
				if(municipio == "" && bairro == ""){
					ArrayList<Quadra> quadra = new Quadra().listDataEndereco(data_inicio, data_fim, uf);
					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					String outJson = gson.toJson(quadra);
					out.write(outJson);
				}
			}break;
			case "tipo": {
			    String tipo = request.getParameter("type");
			    ArrayList<Quadra> quadra = new Quadra().listByType(tipo);
			    Gson gson = new GsonBuilder().setPrettyPrinting().create();
			    String outJson = gson.toJson(quadra);
			    out.write(outJson);
			} break;

		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		int quadra_id = Integer.parseInt(request.getParameter("quadra_id"));
		String action = request.getParameter("action");
		
		switch (action) {
			case "save":{
				String titulo = request.getParameter("titulo");
				String descricao = request.getParameter("descricao");
				String foto = request.getParameter("foto");
				String tipo = request.getParameter("tipo");
				String cep = request.getParameter("cep");
				Double preco =  Double.parseDouble(request.getParameter("preco"));
				String endereco = request.getParameter("endereco");
				String bairro = request.getParameter("bairro");
				String uf = request.getParameter("uf");
				String municipio = request.getParameter("municipio");
				Quadra q = new Quadra(0, titulo, descricao, foto, tipo, cep, preco, endereco, bairro, municipio, uf);
				q.save();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(q);
				out.write(outJson);
			}break;
			
			case "delete":{				
				Quadra q = new Quadra(quadra_id);
				q.delete();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(q);
				out.write(outJson);
			}break;
		}

		//doGet(request, response);
	}

}
