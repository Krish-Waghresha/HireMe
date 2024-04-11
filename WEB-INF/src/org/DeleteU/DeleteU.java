/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.DeleteU;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;

/**
 *
 * @author Vishal
 */
public class DeleteU extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname = (String) request.getParameter("UID");
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getDBconnection();
            String str1 = "DELETE FROM applicant_info WHERE uname='" + uname + "'";
            String str2 = "UPDATE applicantlogin SET delete='D' WHERE username='"+ uname +"'";
            PreparedStatement pst1 = (PreparedStatement) con.prepareStatement(str1);
            PreparedStatement pst2 = (PreparedStatement) con.prepareStatement(str2);
            int chk2 = pst2.executeUpdate();
            int chk1 = pst1.executeUpdate();
            
             if (chk1 != 0 && chk2 != 0 ) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminHome.jsp");
                out.println("Successfully Deleted  selected User");
                rd.include(request, response);

            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
