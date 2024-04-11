/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.SearchCandidate;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


class DBConnect {
    public Connection getDBconnection(){
         Connection con=null;
        try {
               Class.forName("org.postgresql.Driver");
              con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "sql123");
             
        } catch (Exception e) {
        }
        return con;
        
    }
    
}

public class SearchCandidate extends HttpServlet {

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
        String edu_level = request.getParameter("edu_level");
        String edu_course = request.getParameter("edu_course");
        Float marks = Float.parseFloat(request.getParameter("marks"));
        try {
            DBConnect db = new DBConnect();
            Connection con = db.getDBconnection();
            String qry = "SELECT *  FROM applicant_info WHERE EducationLevel='" + edu_level + "'and Marks>='" + marks + "'";
            PreparedStatement pst = con.prepareStatement(qry);
            ResultSet rs = pst.executeQuery();
            out.println("<html><head><title>Company Details</title><link rel=\"stylesheet\" type=\"text/css\" href=\"bootstrap.css\"/></head><body class=\"bgbody\">");
            out.println(" <table class=\"table table-striped table-hover table-bordered ml-10 p-5\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("</table>");
            out.println(" <table class=\"table table-striped table-hover table-bordered ml-10 p-5\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th colspan=\"13\">Possible Candidates That Matches to Your Search Criteria ");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tr>");
            out.println("<td>First Name</td>");
            out.println("<td>Middle Name</td>");
            out.println("<td>Last Name</td>");
            out.println("<td>DOB</td>");
            out.println("<td>Gender</td>");
            out.println("<td>Address</td>");
            out.println("<td>Contact </td>");
            out.println("<td>Email</td>");
            out.println("<td>Edu_Level</td>");
            out.println("<td>Edu_Course</td>");
            out.println("<td>Marks</td>");
            out.println("<td>Certificate Course</td>");
            out.println("<td>Send Mail</td>");
            out.println("<td>Download Resume</td>");
            out.println("</tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("firstname") + "</td>");
                out.println("<td>" + rs.getString("middlename") + "</td>");
                out.println("<td>" + rs.getString("lastname") + "</td>");
                out.println("<td>" + rs.getString("DOB") + "</td>");
                out.println("<td>" + rs.getString("Gender") + "</td>");
                out.println("<td>" + rs.getString("Address") + "</td>");
                out.println("<td>" + rs.getString("Contact") + "</td>");
                out.println("<td>" + rs.getString("Email") + "</td>");
                out.println("<td>" + rs.getString("EducationLevel") + "</td>");
                out.println("<td>" + rs.getString("Edu_Course") + "</td>");
                out.println("<td>" + rs.getString("Marks") + "</td>");
                out.println("<td>" + rs.getString("Certificate") + "</td>");
                out.println("<td><a href=\"SendMail.jsp?UID=" + rs.getString("uname") + "\">Send Mail </a></td>");
                out.println("<td><a href=\"Download?UID=" + rs.getString("id") + "\">Download </a></td>");
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
