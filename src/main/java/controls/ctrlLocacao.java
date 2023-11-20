package controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import models.Locacao;

/**
 * Servlet implementation class ctrlLocacao
 */
@WebServlet("/locacao")
public class CtrlLocacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CtrlLocacao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		switch(action) {
			case "save":{
				int quadra_id = Integer.parseInt(request.getParameter("quadra_id"));
				String locacao_data = request.getParameter("locacao_data");
				String horario_entrada = request.getParameter("horario_entrada");
				String horario_saida = request.getParameter("horario_saida");
				int qtde_horas = Integer.parseInt(request.getParameter("qtde_horas"));
				int cliente = Integer.parseInt(request.getParameter("cliente"));
				
				Locacao l = new Locacao(0, quadra_id, locacao_data, horario_entrada, horario_saida, qtde_horas, cliente);
				l.save();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(l);
				out.write(outJson);
			}break;
			case "delete":{
				int locacao_id = Integer.parseInt(request.getParameter("locacao_id"));
				Locacao l = new Locacao(locacao_id);
				l.delete();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(l);
				out.write(outJson);
			}break;
		}
		//doGet(request, response);
	}

}
