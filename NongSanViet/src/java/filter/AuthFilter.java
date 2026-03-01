package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String ctx = req.getContextPath();

        boolean isStatic =
                uri.endsWith(".css") || uri.endsWith(".js") ||
                uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") || uri.endsWith(".webp") ||
                uri.endsWith(".ico") || uri.endsWith(".svg");

        boolean isPublic =
                uri.equals(ctx + "/") ||
                uri.equals(ctx + "/index.jsp") ||
                uri.startsWith(ctx + "/home") ||
                uri.startsWith(ctx + "/login") ||
                uri.startsWith(ctx + "/logout") ||
                isStatic ||
                uri.endsWith(".html");

        if (isPublic) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("authUser") : null;

        if (user == null) {
            resp.sendRedirect(ctx + "/login");
            return;
        }

        String role = user.getRole() == null ? "" : user.getRole().trim();

        if (uri.startsWith(ctx + "/admin/") && !role.equalsIgnoreCase("ADMIN")) {
    resp.sendError(403, "Bạn không có quyền truy cập khu vực ADMIN.");
    return;
        }
        chain.doFilter(request, response);
    }
}