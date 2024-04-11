/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SearchUser;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// import DBConnect.DBConnect;

public class SearchUser extends HttpServlet {

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
        String stext = request.getParameter("txtsearch");
        String search="%"+stext+"%";
        try {
            
            Class.forName("org.postgresql.Driver");
              Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "sql123");
             
           
            String qry = "SELECT *  FROM applicant_info WHERE firstname like ? or middlename like ? or lastname like ?";
            PreparedStatement pst=con.prepareStatement(qry);
            pst.setString(1, search);
            pst.setString(2, search);
            pst.setString(3, search);
            ResultSet rs = pst.executeQuery();

            out.println("<html><head><title>Company Details</title><link rel=\"stylesheet\" type=\"text/css\" href=\"bootsrap.css\"/></head><body class=\"bgbody\">");
            out.println(" <table ALIGN=CENTER VALIGN=MIDDLE border=\"1\" class=\"table table-bordered table-striped table-hover\">");
            out.println("<tr>");
            out.println("<td>First Name</td>");
            out.println("<td>Last Name</td>");
            out.println("<td>DOB</td>");
            out.println("<td>Contact </td>");
            out.println("<td>Email</td>");
            out.println("<td>Edu_Level</td>");
             out.println("<td>UserName</td>");
            out.println("<td>Delete</td>");
            
            out.println("</tr>");
            while (rs.next()) {
                out.println("<tr>");

                out.println("<td>" + rs.getString("firstname") + "</td>");
                out.println("<td>" + rs.getString("lastname") + "</td>");
                out.println("<td>" + rs.getString("DOB") + "</td>");
                out.println("<td>" + rs.getString("Contact") + "</td>");
                out.println("<td>" + rs.getString("Email") + "</td>");
                out.println("<td>" + rs.getString("EducationLevel") + "</td>");
                out.println("<td>" + rs.getString("uname") + "</td>");
                out.println("<td><a class='btn btn-outline-danger' href=\"DeleteU?UID=" + rs.getString("uname") + "\">Delete </a></td>");

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
