package exam.edu.servlet;

import exam.edu.connection.DbCon;
import exam.edu.dao.KeyDao;
import exam.edu.model.Key;
import exam.edu.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/save-key")
public class SaveKeyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");
        if (auth == null) {
            response.sendRedirect("/user-login");
            return;
        }

        String publicKey = request.getParameter("contentKey");
        Long userId = auth.getId();
        KeyDao keyDao = null;
        try {
            keyDao = new KeyDao(DbCon.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        List<Key> keys = keyDao.getKeysByUserId(userId, 1);
        if (keys.size() == 0)
            keyDao.saveKey(publicKey, 1, userId);
        else
            keyDao.saveKey(publicKey, 0, userId);

        response.sendRedirect("/key");

    }
}
