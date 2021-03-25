/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eams.servlet;

import eams.utilities.ConnectionProviderToDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Windows10
 */
public class RemoveUser extends HttpServlet {

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
        
           Connection con = null;

        int userId = Integer.parseInt(request.getParameter("userId"));
        System.out.println(userId);
        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
//            System.out.println(inputFile);

        try (PrintWriter out = response.getWriter()) {
            con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
            PreparedStatement ps = con.prepareStatement("UPDATE personalasset SET userId=1 WHERE userId=?");

                ps.setInt(1, userId);
                int rs = ps.executeUpdate();
                if(rs>0){
                     PreparedStatement ps1 = con.prepareStatement("delete from user where userId=?");
                    ps1.setInt(1, userId);
                    ps1.executeUpdate();
                    out.println("<script>alert('Assets deallocated and user removed!');window.location.href='Users.jsp';</script>");
                }
                else{
                    PreparedStatement ps1 = con.prepareStatement("delete from user where userId=?");
                    ps1.setInt(1, userId);
                    ps1.executeUpdate();
                    out.println("<script>alert('User did not have any allocated assets. User removed!');window.location.href='Users.jsp';</script>");
                }
        }catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                con.close();
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
