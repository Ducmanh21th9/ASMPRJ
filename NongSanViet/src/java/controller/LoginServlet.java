package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || password == null || username.isBlank() || password.isBlank()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ tài khoản/email và mật khẩu.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        User u = userDAO.login(username.trim(), password);

        if (u == null) {
            req.setAttribute("error", "Sai tài khoản/email hoặc mật khẩu.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        // Lưu session
        HttpSession session = req.getSession(true);
        session.setAttribute("authUser", u);

        String role = (u.getRole() == null) ? "" : u.getRole().trim();

        // ✅ Phân luồng theo role
        if (role.equalsIgnoreCase("ADMIN")) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            // MEMBER (hoặc role khác) -> về trang chính mua hàng
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}