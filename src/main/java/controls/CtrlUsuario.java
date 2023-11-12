package controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Usuario;

/**
 * Servlet implementation class CtrlUsuario
 */
@WebServlet("/usuario")
public class CtrlUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlUsuario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		switch (action) {
		case "login": {
			String email 	= request.getParameter("email");
			String senha 	= request.getParameter("pswd");
			Usuario usuario = new Usuario().checkLogin(email, senha);
			if( usuario.getAtivo().equals("S")) {
				//Usuario Validado com Sucesso
				request.getSession().setAttribute("idUsuario", usuario.getIdUsuario() );
				request.getSession().setAttribute("email", usuario.getEmail() );
				request.getSession().setAttribute("nome", usuario.getNome() );
				request.getSession().setAttribute("idNivelUsuario", usuario.getIdNivelUsuario());
				usuario.setSenha("");
			} else{
				//Usuario não encontrato ou inátivo
				usuario = new Usuario(0, "", "", 0, "", "", "", "", "", "", "", "", "", "");
				request.getSession().invalidate();
			}
			String outJson = usuario.toJson();
			out.write( outJson ) ;
		} break;
		case "save": {
			String email 	= request.getParameter("email");
			String senha 	= request.getParameter("pswd");
			String nome 	= request.getParameter("nome");
			String cpf 		= request.getParameter("cpf");
			String endereco = request.getParameter("logradouro");
			String bairro 	= request.getParameter("bairro");
			String cidade 	= request.getParameter("cidade");
			String uf 		= request.getParameter("uf");
			String cep 		= request.getParameter("cep");
			
			Usuario usuario = new Usuario().checkEmail(email);
			
			if(usuario.getEmail() != null) {
				usuario.setIdUsuario(0);
			}else {
				usuario = new Usuario().checkCPF(cpf);
				if(usuario.getEmail() != null) {
					usuario.setIdUsuario(0);
				}
				else {
					usuario = new Usuario(0, email, senha, 1, nome, cpf, endereco, bairro, cidade, uf, cep, "", "", "S");
					usuario.save();
					usuario = new Usuario().checkEmail(email);
				}
			}
			String outJson = usuario.toJson();
			out.write(outJson) ;
		} break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

}
