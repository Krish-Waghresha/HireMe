/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SendMail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;


public class SendMail extends HttpServlet {

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
        String RegID = request.getParameter("cmp_reg");
        String username = request.getParameter("user_id");
        String Content = request.getParameter("content");
        String applied = "N";
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getDBconnection();
            String str = "INSERT INTO applicant_emails (a_uname, ApplicantMsg, Applied, Cmny_name) VALUES (?,?,?,?)";
            PreparedStatement pst = (PreparedStatement) con.prepareStatement(str);
            pst.setString(1, username);
            pst.setString(2, Content);
            pst.setString(3, applied);
            pst.setString(4, RegID);
            int chk = pst.executeUpdate();
            if (chk != 0) {

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/CompanyHome.jsp");
                out.println("<font color=red>Mail Successfully Sent</font>");
                rd.include(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/SearchCandidate.jsp");
                out.println("<font color=red>Sorry.... Not Sent</font>");
                rd.include(request, response);

            }
        } catch (Exception e) {
			out.println(e);
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
