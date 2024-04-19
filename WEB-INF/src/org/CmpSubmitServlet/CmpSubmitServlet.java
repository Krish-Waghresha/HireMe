/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.CmpSubmitServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;


public class CmpSubmitServlet extends HttpServlet {

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
        String c_regid = request.getParameter("regid");
        String c_name = request.getParameter("cname");
        String c_address = request.getParameter("caddress");
        String c_scope = request.getParameter("scope");
        String c_email = request.getParameter("cemail");
        String c_contact = request.getParameter("contactno");
        String Emp_name = request.getParameter("emp_name");
        String Emp_post = request.getParameter("emp_post");
        String Emp_address = request.getParameter("emp_address");
        String Emp_contact = request.getParameter("emp_contactno");
        String uname = request.getParameter("regid");
        String pass = request.getParameter("password");
        String c_approv = "N";

        try {
            DBConnect db= new DBConnect();
            Connection con=db.getDBconnection();
            Statement st = (Statement) con.createStatement();
            String str1 = "select * from companylogin where username='" + uname + "'";
            ResultSet rs = st.executeQuery(str1);
            if (rs.next()) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/CmpnyReg.jsp");

                out.println("<font color=red>Sorry The Registration No. You HAve Entered Is Already Registerd Plz Check That</font>");
                rd.include(request, response);
                con.close();
            } else {
            DBConnect db1= new DBConnect();
            Connection con1=db1.getDBconnection();
                String str3 = "INSERT INTO cmpny_info (C_RegId, C_Name, C_Address, C_Approve, C_Scope, C_Email, C_Contact, Emp_Name, Emp_Post, Emp_Address, Emp_contact, username, password) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                String str2 = "INSERT INTO companylogin (username, password, Approve) VALUES (?,?,?)";
                String str4 = "INSERT INTO company_list (C_reg, C_Name,C_Address,C_Approve) VALUES (?,?,?,?)";
                PreparedStatement pst = (PreparedStatement) con1.prepareStatement(str2);
                PreparedStatement pst1 = (PreparedStatement) con1.prepareStatement(str3);
                PreparedStatement pst2 = (PreparedStatement) con1.prepareStatement(str4);

//                Set parameter values for string str2
                pst.setString(1, uname);
                pst.setString(2, pass);
                pst.setString(3, c_approv);
//                Set parameter values for string str3
                pst1.setString(1, c_regid);
                pst1.setString(2, c_name);
                pst1.setString(3, c_address);
                pst1.setString(4, c_approv);
                pst1.setString(5, c_scope);
                pst1.setString(6, c_email);
                pst1.setString(7, c_contact);
                pst1.setString(8, Emp_name);
                pst1.setString(9, Emp_post);
                pst1.setString(10, Emp_address);
                pst1.setString(11, Emp_contact);
                pst1.setString(12, uname);
                pst1.setString(13, pass);
//                Set parameter values for string str4             
                pst2.setString(1, c_regid);
                pst2.setString(2, c_name);
                pst2.setString(3, c_address);
                pst2.setString(4, c_approv);
                int chk = pst.executeUpdate();
                int chk1 = pst1.executeUpdate();
                if (chk1 != 0 && chk != 0) {
                    int chk2 = pst2.executeUpdate();
                out.println("<html><head><title>Company Details</title><link rel=\"stylesheet\" type=\"text/css\" href=\"AllStyle.css\"/></head><body class=\"bgbody\">");
                    out.println("<h1><font color=red>Welcome to our Site.. <br>you have successfully registered...<br> your request has been sent for approval..<br>Thank you..</font></h1>");
                     out.println("</body>");
            out.println("</html>");
                } else {
                    response.sendRedirect("ApplicantReg.jsp");
                    out.println("<font color=red>Sorry Retry the Registration Process</font>");
                }
                pst.close();
                pst1.close();
                pst2.close();
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
