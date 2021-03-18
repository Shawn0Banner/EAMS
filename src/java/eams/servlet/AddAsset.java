/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eams.servlet;

import eams.bean.DepartmentalAsset;
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
public class AddAsset extends HttpServlet {

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

        String category = request.getParameter("category");
        int modelNo = Integer.parseInt(request.getParameter("modelNo"));
        System.out.println(request.getParameter("modelNo"));
        System.out.println(request.getParameter("type"));
        System.out.println(request.getParameter("department"));
        System.out.println(request.getParameter("value"));
        System.out.println(request.getParameter("category"));

        Connection conn = null;

        InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");

        try (PrintWriter out = response.getWriter()) {

            /*
                Motive is to check whether the entered modelNo is already present or not
                if not the enter the respective values into the respective tables
                if so then display an errror message and redirect the user to the same page
             */
            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);
            PreparedStatement ps = null;
            int r = 0;

            Statement stmt = conn.createStatement();
            ResultSet rs = null;

            //checking what kind of an asset is being pushed by the user
            //if personal asset then it would be pushed into the personal asset table
            //else the asset will be pushed into the departmental asset table
            // for the personal asset table
            if (category.equals("personalAsset")) {
                rs = stmt.executeQuery("select * from personalasset where modelNo=" + modelNo);

                if (rs.next()) {
                    System.out.println("Model No MISTMATCH!");
                    out.println("<script>alert('Model No MISMATCH'); window.location.href='EditAsset.jsp';</script>");
                } else {
                    PersonalAsset asset = new PersonalAsset();
                    asset.setModelNo(Integer.parseInt(request.getParameter("modelNo")));
                    asset.setType(request.getParameter("type"));
                    asset.setDepartment(request.getParameter("department"));
                    asset.setValue(Double.parseDouble(request.getParameter("value")));
                    asset.setStatus("ACTIVE");

                    ps = conn.prepareStatement("insert into personalasset(modelNo, userId, type, department, value, status) values(?,?,?,?,?,?)");
                    ps.setInt(1, asset.getModelNo());   //inserting model no into the table
                    ps.setInt(2, 1);    //setting the userId as admin id to the table
                    ps.setString(3, asset.getType());   //setting the asset type to the table
                    ps.setString(4, asset.getDepartment()); //setting the asset department to the table
                    ps.setDouble(5, asset.getValue());  //seting the asset value to the table                
                    ps.setString(6, asset.getStatus()); //setting the 
                    r = ps.executeUpdate();

                    if (r > 0) {
                        System.out.println("Personal Asset Added");
                        RequestDispatcher rd = request.getRequestDispatcher("EditAsset.jsp");
                        rd.forward(request, response);
                    } else {
                        System.out.println("Personal Asset Not Added");
                    }
                }
            } //for the department assets table
            else {
                rs = stmt.executeQuery("select * from departmentalasset where modelNo=" + modelNo);

                if (rs.next()) {
                    System.out.println("Model No MISMATCH");
                    out.println("<script>alert('Model No MISMATCH'); window.location.href='EditAsset.jsp';</script>");
                } 
                else {
                    DepartmentalAsset asset = new DepartmentalAsset();
                    asset.setModelNo(Integer.parseInt(request.getParameter("modelNo")));
                    asset.setType(request.getParameter("type"));
                    asset.setDepartment(request.getParameter("department"));
                    asset.setValue(Double.parseDouble(request.getParameter("value")));
                    asset.setStatus("ACTIVE");

                    ps = conn.prepareStatement("insert into departmentalasset(modelNo, type, department, value, status) values (?, ?, ?, ?, ?)");
                    ps.setInt(1, asset.getModelNo());   //setting the asset model no to the table
                    ps.setString(2, asset.getType());   //setting the asset type to the table
                    ps.setString(3, asset.getDepartment());
                    ps.setDouble(4, asset.getValue());
                    ps.setString(5, asset.getStatus());

                    r = ps.executeUpdate();

                    if (r > 0) {
                        System.out.println("Departmental Asset Added");
                        RequestDispatcher rd = request.getRequestDispatcher("EditAsset.jsp");
                        rd.forward(request, response);
                    } else {
                        System.out.println("Departmental Asset Not Added");
                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(AddAsset.class.getName()).log(Level.SEVERE, null, ex);
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
