package exam.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import exam.edu.model.User;
import exam.edu.utils.RSAKeyPairGenerator;

@WebServlet("/create-key")
public class CreateKeyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			HttpSession session = request.getSession();
			User auth = (User) session.getAttribute("auth");

			if (auth == null) {
				response.sendRedirect("/user-login");
				return;
			}
			if (auth != null) {
				RSAKeyPairGenerator generator = new RSAKeyPairGenerator();
				Base64.getEncoder().encodeToString(generator.getPublicKey().getEncoded());
				Base64.getEncoder().encodeToString(generator.getPrivateKey().getEncoded());

				Map<String, String> options = new LinkedHashMap<>();
				options.put("private", Base64.getEncoder().encodeToString(generator.getPrivateKey().getEncoded()));
				options.put("public",Base64.getEncoder().encodeToString(generator.getPublicKey().getEncoded()));
				String json = new Gson().toJson(options);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
