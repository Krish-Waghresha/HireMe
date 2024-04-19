/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SendConfirm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;

public class SendConfirm extends HttpServlet {

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
        Integer id=Integer.parseInt(request.getParameter("id"));
        String company=request.getParameter("cmpny");
                String user=request.getParameter("user");
                String COnfirmMsg="Dear "+user+" your application is confirmed .We Will see you at the interview at given venue. Best Luck For Your Future";
        try {
            DBConnect db= new DBConnect();
            Connection con=db.getDBconnection();
            String qry="UPDATE applicant_emails SET ConfirmationMsg='"+ COnfirmMsg +"' WHERE id='"+  id +"'";
            PreparedStatement pst = (PreparedStatement) con.prepareStatement(qry);
            int chk1 = pst.executeUpdate();
            if (chk1 != 0) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/CompanyHome.jsp");
                out.println("Successfully Sent Confirmation");
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
