package exam.edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.PublicKey;
import java.security.Signature;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.edu.connection.DbCon;
import exam.edu.dao.UserDao;
import exam.edu.model.Order;
import exam.edu.model.User;
import exam.edu.utils.RSAUtil;
import exam.edu.utils.SHA256Hashing;

@WebServlet("/sign-order")
public class SignOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean hasSign = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			Boolean first = (boolean) request.getSession().getAttribute("first");
			if (first != null && first == false) {
				doPost(request, response);
				return;
			}
			request.getSession().setAttribute("first", false);

			String inforBill = (String) request.getSession().getAttribute("inforBill");
			request.setAttribute("inforBill", inforBill);
			//******hasSign = false;
			hasSign = true;
			request.setAttribute("hasSign", hasSign);
			RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			Boolean first = (boolean) (request.getSession().getAttribute("first")!=null?request.getSession().getAttribute("first"):false);
			if (first != null && first == true) {
				doGet(request, response);
				return;
			}
			String error = null;
			String inforBill = request.getParameter("sign-order");
			String key = request.getParameter("sign-key") != null ? request.getParameter("sign-key") : null;
			String signature = request.getParameter("sign-signature") != null ? request.getParameter("sign-signature")
					: null;
			User auth = (User) request.getSession().getAttribute("auth");

			if (isEmpty(signature)) {
				//***********hasSign = false;
				hasSign = true;
			}
			if (auth == null) {
				response.sendRedirect("user-login");
				return;
			}

			Order order = (Order) request.getSession().getAttribute("order");
			if (order == null) {
				response.sendRedirect("/cart");
				return;
			}
			if ((!hasSign && (isEmpty(inforBill) || isEmpty(key)))
					|| (hasSign && !first && (isEmpty(inforBill) || isEmpty(signature)))) {
				hasSign = false;
				error = "Th??ng tin ????n h??ng ho???c private key kh??ng h???p l???!";
				request.setAttribute("hasSign", hasSign);
				request.setAttribute("error", error);
				request.getSession().setAttribute("first", false);
				RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
				rd.forward(request, response);
				return;
			}

			// create signature
			if (!hasSign && signature == null) {
				// hash infoBill
//				String content = inforBill + SHA256Hashing.getSecret();
//				String hashcode = SHA256Hashing.HashWithJavaMessageDigest(content);
				String hashcode = inforBill;
				// encrypt the hashcode by private key
				signature = Base64.getEncoder().encodeToString(RSAUtil.encryptByPrivateKey(hashcode, key));

				request.setAttribute("signature", signature);
				hasSign = true;
				request.setAttribute("error", "");
				request.getSession().setAttribute("isVerifiedOrder", false);
				request.setAttribute("hasSign", hasSign);
				request.setAttribute("inforBill", inforBill);
				request.getSession().setAttribute("first", false);
				RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
				rd.include(request, response);
				return;
			}

			// Verify ch??? k??
			if (hasSign && !isEmpty(signature) && !isEmpty(inforBill)) {
				String hashcode= inforBill; // m?? hash ????n h??ng

				UserDao userDao = new UserDao(DbCon.getConnection());
				String publicKey64 = userDao.getPublicKey(auth.getId());
				PublicKey publicKey = RSAUtil.getPublicKey(publicKey64);

				byte[] sigToVerify; // ch??? k?? c???n ???????c verify
				try {
					sigToVerify = Base64.getDecoder().decode(signature);
				}
				// B???t l???i khi decode Base64 do ch??? k?? kh??ng h???p l???
				catch (IllegalArgumentException e){
					hasSign = true;
					error = "Ch??? k?? kh??ng h???p l???!";
					request.setAttribute("hasSign", hasSign);
					request.setAttribute("error", error);
					request.setAttribute("signature", signature);
					request.setAttribute("inforBill", inforBill);
					request.getSession().setAttribute("first", false);
					RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
					rd.forward(request, response);
					return;
				}

				// ?????i t?????ng Signature
				Signature sig = Signature.getInstance("SHA256withRSA"); // Ch?? ?? algo ph???i gi???ng tool t???o ch??? k??
				sig.initVerify(publicKey); // ??? tool l?? initSign()
				sig.update(hashcode.getBytes());

				boolean result = sig.verify(sigToVerify);

				if(!result) {
					hasSign = true;
					error = "Ch??? k?? kh??ng h???p l???!";
					request.setAttribute("hasSign", hasSign);
					request.setAttribute("error", error);
					request.setAttribute("signature", signature);
					request.setAttribute("inforBill", inforBill);
					request.getSession().setAttribute("first", false);
					RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
					rd.forward(request, response);
					return;
				}

				// verify = true
				if (result) {
					// move to place-order with isVerifiedOrder=true
					request.getSession().setAttribute("isVerifiedOrder", true);
					request.setAttribute("signature", null);
					RequestDispatcher rd = request.getRequestDispatcher("/place-order");
					rd.include(request, response);
					return;
				} else {
					request.getSession().setAttribute("first", false);
					request.getSession().setAttribute("isVerifiedOrder", false);
					request.setAttribute("infoBill", inforBill);
					request.setAttribute("hasSign", hasSign);
					RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
					rd.include(request, response);
					return;
				}
				
			}

			request.setAttribute("infoBill", inforBill);
			request.setAttribute("hasSign", hasSign);
			RequestDispatcher rd = request.getRequestDispatcher("signature-order.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/home");
		}
	}

	private boolean isEmpty(String s) {
		if (s == null || s == "") {
			return true;
		}
		return false;
	}
}
