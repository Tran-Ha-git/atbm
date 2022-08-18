package exam.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.edu.connection.DbCon;
import exam.edu.dao.KeyDao;
import exam.edu.model.Key;
import exam.edu.model.User;

@WebServlet("/update-key")
public class UpdateKeyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String msg = null;
			String msgKey = null;
			Boolean status = null;
			List<Key> keys = new ArrayList<Key>();
			
			Integer active = request.getParameter("status")!=null?Integer.parseInt(request.getParameter("status")):null;
			Long id = request.getParameter("id")!=null?Long.parseLong(request.getParameter("id")):null;

			HttpSession session = request.getSession();
			User auth = (User) session.getAttribute("auth");

			if (auth == null) {
				response.sendRedirect("/user-login");
				return;
			}
			if (auth != null) {
				KeyDao keyDao = new KeyDao(DbCon.getConnection());

				if(active ==null || id == null ) {
					msgKey = "Cập nhật khóa không thành công.";
					status= false;
				}else {
					boolean updated =  keyDao.updateStatus(id, active);
					if(updated) {
						msgKey = "Cập nhật khóa thành công.";
						status= true;
					}else {
						msgKey = "Cập nhật khóa không thành công.";
						status= false;
					}
				}
				
				keys = keyDao.getKeysByUserId(auth.getId());
			}
			request.setAttribute("keys", keys);
			request.setAttribute("msgKey", msgKey);
			request.setAttribute("status", status);
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("key.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
