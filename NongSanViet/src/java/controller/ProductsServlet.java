package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

public class ProductsServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String region = req.getParameter("region"); // mien-bac, mien-trung, mien-nam, mien-tay

        if (region != null && !region.isBlank()) {
            region = region.trim().toLowerCase();

            ProductDAO.RegionInfo info = productDAO.getRegionInfo(region);
            if (info != null) {
                List<Product> products = productDAO.getProductsByNames(info.productNames());
                req.setAttribute("regionTitle", info.title());
                req.setAttribute("regionIntro", info.intro());
                req.setAttribute("products", products);

                req.getRequestDispatcher("/products.jsp").forward(req, resp);
                return;
            }
        }

        // Không chọn vùng -> show tất cả
        List<Product> products = productDAO.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/products.jsp").forward(req, resp);
    }
}