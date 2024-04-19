/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.CompanyLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.DBConnect.DBConnect;


public class CompanyLogin extends HttpServlet {

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
        String uname = request.getParameter("txtusername");
        String pass = request.getParameter("txtpassword");
        try {
DBConnect db= new DBConnect();
            Connection con=db.getDBconnection();
            Statement st = (Statement) con.createStatement();
            Statement st1 = con.createStatement();
            Statement st3 = con.createStatement();
            String str1 = "select * from companylogin where username='" + uname + "' and password='" + pass + "'and Approve='Y'";
            String str2 = "select * from companylogin where username='" + uname + "' and password='" + pass + "'and Approve='N'";
            String str3 = "select * from companylogin where username='" + uname + "' and password='" + pass + "'and Approve='D'";
            ResultSet rs = st.executeQuery(str1);
            ResultSet rs1 = st1.executeQuery(str2);
            ResultSet rs2 = st3.executeQuery(str3);
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("company", uname);
                //setting session to expiry in 30 mins
                session.setMaxInactiveInterval(600 * 60);
                Cookie loginCookie = new Cookie("company", uname);
                //setting cookie to expiry in 30 mins
                loginCookie.setMaxAge(30 * 60);
                response.addCookie(loginCookie);
               
                response.sendRedirect("CompanyHome.jsp");

            } else {

                if (rs1.next()) {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/EmployerLogin.jsp");

                    out.println("<font color=red>Please Contact Administrator to provide previllages(Because admin didn't approved you as a legal user..)</font>");
                    rd.include(request, response);

                } else {
                    if (rs2.next()) {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/EmployerLogin.jsp");

                        out.println("<font color=red>Please Contact Administrator to provide previllages(Because admin has deleted your company data)</font>");
                        rd.include(request, response);
                    } else {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/EmployerLogin.jsp");

                        out.println("<font color=red>Either user name or password is wrong.</font>");
                        rd.include(request, response);
                    }

                }


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
