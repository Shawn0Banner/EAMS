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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abhradeep
 */
public class RemoveAsset extends HttpServlet {

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

        /*
           Objective is to first get the category from the user and then according to the category
            delete the asset from that category based on the modelNo of that asset
         */
        Connection conn = null;
        String category = request.getParameter("category");
        int modelNo = Integer.parseInt(request.getParameter("modelNo"));
        int r = 0;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");

        System.out.println(category);

        try (PrintWriter out = response.getWriter()) {
            /*
                Motive is to check whether the entered model is present in the respective table or not
                if not then
             */

            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            Statement stmt = conn.createStatement();
            ResultSet rs = null;

            if (category.equals("personalAsset")) {
                //delition of personal asset portion
                rs = stmt.executeQuery("select * from personalasset where modelNo=" + modelNo);

                if (rs.next()) {
                    PreparedStatement ps = conn.prepareStatement("delete from personalasset where modelNo=?");
                    ps.setInt(1, modelNo);

                    r = ps.executeUpdate();

                    if (r > 0) {
                        System.out.println("Personal Asset Delete Successfully");
                        RequestDispatcher rd = request.getRequestDispatcher("EditAsset.jsp");
                        rd.forward(request, response);
                    } else {
                        System.out.println("Asset Delete Failed");
                    }
                } else {
                    System.out.println("Model No NOT PRESENT");
                    out.println("<script>alert('Model No NOT PRESENT'); window.location.href='EditAsset.jsp';</script>");
                }

            } //deletion of departmental asset portion
            else {
                rs = stmt.executeQuery("select * from departmentalasset where modelNo=" + modelNo);

                if (rs.next()) {
                    PreparedStatement ps = conn.prepareStatement("delete from departmentalasset where modelNo=?");
                    ps.setInt(1, modelNo);

                    r = ps.executeUpdate();

                    if (r > 0) {
                        System.out.println("Departmental Asset Deletion Successfull");
                        RequestDispatcher rd = request.getRequestDispatcher("EditAsset.jsp");
                        rd.forward(request, response);
                    } else {
                        System.out.println("Departmental Asset Delition Failed");
                        out.println("<script>alert('Deletion Failed');</script>");
                    }
                }
                else{
                    System.out.println("Model No NOT PRESENT");
                    out.println("<script>alert('Model No NOT PRESENT'); window.location.href='EditAsset.jsp';</script>");
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(RemoveAsset.class.getName()).log(Level.SEVERE, null, ex);
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
