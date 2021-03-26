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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abhradeep
 */
public class DeAllocate extends HttpServlet {

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
       
        String userEmail = request.getParameter("userEmail");
        String types[] = request.getParameterValues("type");
        
        for(String type: types){
            System.out.println(type);
        }
        
        try (PrintWriter out = response.getWriter()) {
            
            /*
                First the motive is to check whether the userId is present or not
                if so then set the user id against the modelId in the personalasset table as 1(ADMIN ID)
                if not the display error message and redirect the user to the same page
            */
            
            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
            Statement stmt = conn.createStatement();
            
            //query to search for a user in the user table using his or her emailId
            ResultSet rs = stmt.executeQuery("select * from user where email='"+userEmail+"'");
            
            if(rs.next()){
                for(String type: types){
                    PreparedStatement ps = conn.prepareStatement("update personalasset set userId=1 where type=?");
                    ps.setString(1, type);
                    
                    int r = ps.executeUpdate();
                    
                    if(r>0){
                        System.out.println("ASSETS DE-ALLOCATED FROM USER");
                        out.println("<script>alert('ASSETS DE-ALLOCATED FROM USER'); window.location.href='AdminHome.jsp';</script>");
                    } else{
                        System.out.println("SOME ERROR");
                        out.println("<script>alert('SOME ERROR'); window.location.href='AdminHome.jsp';</script>");
                    }
                }
            }
            else{
                System.out.println("USER NOT FOUND");
                out.println("<script>alert('USER NOT FOUND'); window.location.href='AdminHome.jsp';</script>");
            }
            
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DeAllocate.class.getName()).log(Level.SEVERE, null, ex);
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
