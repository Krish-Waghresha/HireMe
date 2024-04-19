/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ShowDetails;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;


public class ShowDetails extends HttpServlet {

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
        String reg = (String) request.getParameter("REGUID");
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getDBconnection();
            Statement st = con.createStatement();
            String qry = "SELECT *  FROM cmpny_info WHERE C_RegId='" + reg + "' ";
            ResultSet rs = st.executeQuery(qry);
            out.println("<html><head><title>Company Details</title><link rel=\"stylesheet\" type=\"text/css\" href=\"AllStyle.css\"/></head><body class=\"bgbody\">");
            out.println(" <table ALIGN=CENTER VALIGN=MIDDLE border=\"1\" class=\"firstcol\">");
            
            out.println("<tr>");
            out.println("<td>Company Reg ID</td>");
            out.println("<td>Company Name</td>");
            out.println("<td>Company Address</td>");
            out.println("<td>Email</td>");
            out.println("<td>Contact</td>");
            out.println("<td>Emplyer</td>");
            out.println("<td>EMP Post</td>");
            out.println("<td>Emp Address</td>");
            out.println("<td>Emp Contact</td>");
            out.println("<td>Approve</td>");
            out.println("</tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("C_RegId") + "</td>");
                out.println("<td>" + rs.getString("C_Name") + "</td>");
                out.println("<td>" + rs.getString("C_Address") + "</td>");
                out.println("<td>" + rs.getString("C_Email") + "</td>");
                out.println("<td>" + rs.getString("C_Contact") + "</td>");
                out.println("<td>" + rs.getString("Emp_Name") + "</td>");
                out.println("<td>" + rs.getString("Emp_Post") + "</td>");
                out.println("<td>" + rs.getString("Emp_Address") + "</td>");
                out.println("<td>" + rs.getString("Emp_contact") + "</td>");
                 out.println("<td><a href=\"ApproveC?REGUID=" + reg + "\">Approve </a></td>");
                out.println("</tr>");
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");



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
