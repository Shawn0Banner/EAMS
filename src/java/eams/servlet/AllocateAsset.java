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
public class AllocateAsset extends HttpServlet {

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

        for (String type : types) {
            System.out.println(type);
        }

        System.out.println(userEmail);

        try (PrintWriter out = response.getWriter()) {
            /*
                Check if the userId is present in the user table
                Check if the userId has an asset allocated of selected type
                    if so 
                        print error
                    else
                        allocate asset
             */

            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
            Statement stmt = conn.createStatement();

            //user exists or not
            ResultSet rs1 = stmt.executeQuery("select * from user where email='" + userEmail + "'");

            if (rs1.next()) {
                int userId = rs1.getInt("userId");
                System.out.println(userId);
                String userDepartment = rs1.getString("department");

                for (String type : types) {
                    //checking if the user already has a checked type asset asssigned
                    PreparedStatement ps = conn.prepareStatement("select * from personalasset where userId=? and type=?");
                    ps.setInt(1, userId);
                    ps.setString(2, type);

                    ResultSet rs2 = ps.executeQuery();

                    if (rs2.next()) {
                        System.out.println("USER ALREADY HAS A " + rs2.getString("type"));
                        out.println("<script>alert('User already has selected assets'); window.location.href='AdminHome.jsp';</script>");                      
                    } else {
                        //checking if there are assets of the cheked type not allocated to any user other than the admin
                        //selecting only the assets which are allocated to admin and department is equal to the user type
                        ps = conn.prepareStatement("select * from personalasset where userId=1 and type=? and department=?");

                        ps.setString(1, type);
                        ps.setString(2, userDepartment);
                        ResultSet rs3 = ps.executeQuery();

                        if (rs3.next()) {
                            //updating the first row with the input user id
                            PreparedStatement ps1 = conn.prepareStatement("update personalasset set userId=? where modelNo=?");
                            ps1.setInt(1, userId);
                            ps1.setInt(2, rs3.getInt("modelNo"));

                            int r = ps1.executeUpdate();

                            //asset is allocated
                            if (r > 0) {
                                System.out.println("Asset Allocated");
                                out.println("<script>alert('All Assets Allocated'); window.location.href='AdminHome.jsp';</script>");
                            } else {
                                System.out.println("SOME ERROR!");
                                out.println("<script>alert('SOME ERROR'); window.location.href='AdminHome.jsp';</script>");
                            }
                        } else {
                            System.out.println("ALL ASSETS ALLOCATED OR FREE ASSET NOT FOUND");
                            out.println("<script>alert('ALL ASSETS ALLOCATED OR ASSET NOT FOUND'); window.location.href='AdminHome.jsp';</script>");
                        }
                    }
                }
            } //the entered email id has not been found in the user table 
            else {
                System.out.println("User DOESNOT EXIST");
                out.println("<script>alert('USER DOES NOT EXIST'); window.location.href='AdminHome.jsp';</script>");
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AllocateAsset.class.getName()).log(Level.SEVERE, null, ex);
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
