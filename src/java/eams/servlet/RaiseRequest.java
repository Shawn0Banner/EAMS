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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abhradeep
 */
public class RaiseRequest extends HttpServlet {

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
            String userEmail = request.getParameter("userEmail");
            int modelNo = Integer.parseInt(request.getParameter("modelNo"));
            String category = request.getParameter("category");

            System.out.println(userEmail);
            System.out.println(modelNo);
            System.out.println(category);

            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            PreparedStatement ps = null;
            ResultSet rs = null;

            if (category.equals("personalasset")) {
                //for personal asset
                /*
                    Check if the model no exists in the table
                    if exists then change the value of status to not working or defective
                 */

                ps = conn.prepareStatement("select * from personalasset where modelNo=?");
                ps.setInt(1, modelNo);

                rs = ps.executeQuery();

                if (rs.next()) {
                    PreparedStatement ps1 = conn.prepareStatement("update personalasset set status='DEFECTIVE' where modelNo=?");
                    ps1.setInt(1, modelNo);

                    int r = ps1.executeUpdate();

                    if (r > 0) {
                        System.out.println("REPAIR REQUEST RAISED!!");
                        out.println("<script>alert('REPAIR REQUEST RAISED'); window.location.href='UserHome.jsp';</script>");
                    } else {
                        System.out.println("SOME ERROR");
                        out.println("<script>alert('SOME ERROR'); window.location.href='UserHome.jsp';</script>");
                    }
                } else {
                    System.out.println("ASSET NOT FOUND!");
                    out.println("<script>alert('ASSET NOT FOUND!'); window.location.href='UserHome.jsp';</script>");
                }
            } 
            else {
                //for departmental asset
                /*
                    Check if the model no exists in the table
                    if exists then change the value of status to not working or defective
                 */

                ps = conn.prepareStatement("select * from departmentalasset where modelNo=?");
                ps.setInt(1, modelNo);

                rs = ps.executeQuery();

                if (rs.next()) {
                    //the asset is found
                    //perform the update on the departmental asset table
                    
                    PreparedStatement ps1 = conn.prepareStatement("update departmentalasset set status='DEFECTIVE' where modelNo=?");
                    ps1.setInt(1, modelNo);

                    int r = ps1.executeUpdate();

                    if (r > 0) {
                        System.out.println("REPAIR REQUEST RAISED!!");
                        out.println("<script>alert('REPAIR REQUEST RAISED'); window.location.href='UserHome.jsp';</script>");
                    } else {
                        System.out.println("SOME ERROR");
                        out.println("<script>alert('SOME ERROR'); window.location.href='UserHome.jsp';</script>");
                    }
                } else {
                    //if the asset is not found
                    //...display an error to the user
                    System.out.println("ASSET NOT FOUND!");
                    out.println("<script>alert('ASSET NOT FOUND!'); window.location.href='UserHome.jsp';</script>");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
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
