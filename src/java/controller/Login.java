/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tranq
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        String userNameSI = request.getParameter("usernamesi");
        String passwordSI = request.getParameter("passwordsi");
        String userNameSU = request.getParameter("usernamesu");
        String passwordSU = request.getParameter("passwordsu");
        String passwordcfsu = request.getParameter("passwordcfsu");
        String rem = request.getParameter("remember");
        Cookie userCookie;
        Cookie passCookie;
        Cookie remember = new Cookie("remember", rem);
        if (userNameSI != null) {
            User user = dao.getUser(userNameSI, passwordSI);
            if (user != null) {
                session.setAttribute("user", user);
                userCookie = new Cookie("user", userNameSI);
                passCookie = new Cookie("pass", passwordSI);
                if (rem != null) {
                    userCookie.setMaxAge(60 * 60 * 24);
                    passCookie.setMaxAge(60 * 60 * 24);
                    remember.setMaxAge(60 * 60 * 24);
                } else {
                    userCookie.setMaxAge(0);
                    passCookie.setMaxAge(0);
                    remember.setMaxAge(0);
                }
                response.addCookie(userCookie);
                response.addCookie(userCookie);
                response.addCookie(remember);
                request.setAttribute("msg", "");
                response.sendRedirect("home");
            } else {
                request.setAttribute("msg", "This user is not exist! Please sign up!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            if (passwordSU.equals(passwordcfsu)) {
                dao.createUser(new User(userNameSU, passwordSU));
                session.setAttribute("user", dao.getUser(userNameSU, passwordSU));
                userCookie = new Cookie("user", userNameSU);
                passCookie = new Cookie("pass", passwordSU);
                if (rem != null) {
                    userCookie.setMaxAge(60 * 60 * 24);
                    passCookie.setMaxAge(60 * 60 * 24);
                    remember.setMaxAge(60 * 60 * 24);
                } else {
                    userCookie.setMaxAge(0);
                    passCookie.setMaxAge(0);
                    remember.setMaxAge(0);
                }
                response.addCookie(userCookie);
                response.addCookie(userCookie);
                response.addCookie(remember);
                response.sendRedirect("home");
            } else {
                request.setAttribute("msgSu", "Password is not matches!");
                request.setAttribute("match", false);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
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
