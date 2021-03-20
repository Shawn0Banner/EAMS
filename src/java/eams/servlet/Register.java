/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eams.servlet;

import eams.bean.User;
import eams.utilities.ConnectionProviderToDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows10
 */
public class Register extends HttpServlet {

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

        Connection conn = null;
        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");

        try (PrintWriter out = response.getWriter()) {

            /*
                Motive is the check whether is entered email is already present or not
                if not then insert the respective data into the user table 
                if so then display an error message and redirect the user the same page
             */
            User newUser = new User();

            newUser.setEmail(request.getParameter("email"));
            newUser.setUserName(request.getParameter("userName"));
            newUser.setDepartment(request.getParameter("department"));
            newUser.setPassword(request.getParameter("password1"));
            newUser.setType("USER");
            //our system will treat every new user register as a user type and not admin type
            //our system only has one admin only         

            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user where email='" + newUser.getUserName()+"'");

            if (rs.next()) {
                System.out.println("Email Address Already Present");
                out.print("<script>alert('Email Address Already Present'); window.location.href='Register.jsp';</script>");
            } else {

                PreparedStatement ps = conn.prepareStatement("insert into user(userName, email, password, department, type) values (?,?,?,?,?)");
                ps.setString(1, newUser.getUserName());
                ps.setString(2, newUser.getEmail());
                ps.setString(3, newUser.getPassword());
                ps.setString(4, newUser.getDepartment());
                ps.setString(5, newUser.getType());

                int r = ps.executeUpdate();

                if (r > 0) {
                    System.out.println("New user created SUCCESSFULLY");
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                } else {
                    System.out.println("New user creation FAILED");
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
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
        processRequest(request, response);
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
