/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eams.servlet;

import eams.bean.PersonalAsset;
import eams.utilities.ConnectionProviderToDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
public class Track extends HttpServlet {

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

        String department = request.getParameter("department");
        String category = request.getParameter("category");
        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");

        try (PrintWriter out = response.getWriter()) {
            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

            if (category.equals("personalasset")) { //personal asset part

                //query to get the full table
                PreparedStatement ps = conn.prepareStatement("select * from personalasset where department=?");
                ps.setString(1, department);
                ResultSet mainTable = ps.executeQuery();

                //query to get the total no assets in each department
                ps = conn.prepareStatement("select type as 'Asset Name', count(type) as 'Total' from personalasset where department=? group by type");
                ps.setString(1, department);
                ResultSet totalAssetTable = ps.executeQuery();

                //query to get the total active assets
                ps = conn.prepareStatement("select type as 'Asset Name', count(type) as 'Total Active Assets' from personalasset where status='ACTIVE' and department=? group by type");
                ps.setString(1, department);
                ResultSet activeAssets = ps.executeQuery();

                request.setAttribute("mainTable", mainTable);
                request.setAttribute("totalAssetTable", totalAssetTable);
                request.setAttribute("activeAssets", activeAssets);
                RequestDispatcher rd = request.getRequestDispatcher("PersonalAssetDisplay.jsp");
                rd.forward(request, response);
            } else {    //departmental asset part

                //query to get the full table
                PreparedStatement ps = conn.prepareStatement("select * from personalasset where department=?");
                ps.setString(1, department);
                ResultSet mainTable = ps.executeQuery();

                //query to get the total no assets in each department
                ps = conn.prepareStatement("select type as 'Asset Name', count(type) as 'Total' from personalasset where department=? group by type");
                ps.setString(1, department);
                ResultSet totalAssetTable = ps.executeQuery();

                //query to get the total active assets
                ps = conn.prepareStatement("select type as 'Asset Name', count(type) as 'Total Active Assets' from departmentalasset where status='ACTIVE' and department=? group by type");
                ps.setString(1, department);
                ResultSet activeAssets = ps.executeQuery();

                request.setAttribute("mainTable", mainTable);
                request.setAttribute("totalAssetTable", totalAssetTable);
                request.setAttribute("activeAssets", activeAssets);
                RequestDispatcher rd = request.getRequestDispatcher("DepartmentalAssetDisplay.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Track.class.getName()).log(Level.SEVERE, null, ex);
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
