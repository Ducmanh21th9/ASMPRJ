package controller;


import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
    
import model.Product;

public class HomeServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO();
        System.out.println("HomeServlet initialized");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("HomeServlet doGet called");
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        List<Product> featuredProducts = productDAO.getFeaturedProducts();
        request.setAttribute("featuredProducts", featuredProducts);
        
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public void destroy() {
        System.out.println("HomeServlet destroyed");
    }
}