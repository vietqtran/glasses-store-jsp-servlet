/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ImageDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.User;
import model.Product;

/**
 *
 * @author tranq
 */
@WebServlet(name = "Check", urlPatterns = {"/check"})
public class Check extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Check</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Check at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action.equals("addToCart") || action.equals("getCart")) {
            if (session.getAttribute("user") != null) {
                if (action.equals("getCart")) {
                    request.getRequestDispatcher("cart").forward(request, response);
                } else {
                    OrderDAO dao = new OrderDAO();
                    int productId = 0;
                    try {
                        productId = Integer.parseInt(request.getParameter("productid"));
                    } catch (NumberFormatException e) {
                    }
                    Product p = new ProductDAO().getById(productId);
                    dao.createOrder(new Order(
                            (int) ((User) session.getAttribute("user")).getId(),
                            productId,
                            p.getName(),
                            p.getColor(),
                            p.getPrice(),
                            new ImageDAO().getById(p.getImgId()).getI1(),
                            1
                    ), ((User) session.getAttribute("user")).getId());
                    response.sendRedirect("cart");
                }
            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        }

        if (action.equals("getHome")) {
            request.getRequestDispatcher("home").forward(request, response);
        }
        if (action.equals("deleteCartProduct")) {
            String img = request.getParameter("img");
            new OrderDAO().removeByImg(img);
            response.sendRedirect("cart");
        }
        if (action.equals("logout")) {
            session.removeAttribute("user");
            request.getRequestDispatcher("home").forward(request, response);
        }
        if (action.equals("login")) {
            request.getRequestDispatcher("login").forward(request, response);
        }
        if (action.equals("increaseCart")) {
            request.setAttribute("increase", true);
            request.setAttribute("img", request.getParameter("img"));
            request.setAttribute("quantity", Integer.parseInt(request.getParameter("quantity")));
            request.getRequestDispatcher("changeQuantity").forward(request, response);
        }
        if (action.equals("decreaseCart")) {
            request.setAttribute("increase", false);
            request.setAttribute("img", request.getParameter("img"));
            request.setAttribute("quantity", Integer.parseInt(request.getParameter("quantity")));
            request.getRequestDispatcher("changeQuantity").forward(request, response);
        }
        if (action.equals("checkout")) {
            if (session.getAttribute("user") != null) {
                request.getRequestDispatcher("checkout").forward(request, response);
            } else {
                request.getRequestDispatcher("login").forward(request, response);
            }
        }
    }

    public static void main(String[] args) {
        Product p = new ProductDAO().getById(1);
        System.out.println(new ImageDAO().getById(p.getImgId()).getI1());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
