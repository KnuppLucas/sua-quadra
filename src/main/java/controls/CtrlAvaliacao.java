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

import models.Avaliacao;

/**
 * Servlet implementation class CtrlAvaliacao
 */
@WebServlet("/avaliacao")
public class CtrlAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CtrlAvaliacao() {
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
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		switch(action) {
			case "save":{
				int locacao_id = Integer.parseInt(request.getParameter("locacao_id"));
				int pontuacao = Integer.parseInt(request.getParameter("pontuacao"));
				String comentario = request.getParameter("comentario");
				
				Avaliacao a = new Avaliacao(0, locacao_id, pontuacao, comentario);
				a.save();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(a);
				out.write(outJson);
			}break;
			case "delete":{
				int avaliacao_id = Integer.parseInt(request.getParameter("avaliacao_id"));
				Avaliacao a = new Avaliacao(avaliacao_id);
				a.delete();
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
				String outJson = gson.toJson(a);
				out.write(outJson);
			}break;
		}
	}

}
