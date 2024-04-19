/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Download;

import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.DBConnect.DBConnect;


public class Download extends HttpServlet {

    static final long serialVersionUID = 1L;
    private static final int BUFSIZE = 4096;
    private String filePath;

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
        Integer uid = Integer.parseInt(request.getParameter("UID"));
        String filename = "";

        try {
            DBConnect db = new DBConnect();
            Connection con = db.getDBconnection();
            String qry = "SELECT * FROM applicant_info where id='" + uid + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(qry);
            while (rs.next()) {
                filename = rs.getString("resumepath");
            }
            filePath = getServletContext().getRealPath("")
                    + File.separator + "Resume" + File.separator + filename;

        } catch (Exception e) {
        }
        try {
            File file = new File(filePath);
            int length = 0;
            ServletOutputStream outStream = response.getOutputStream();
            ServletContext context = getServletConfig().getServletContext();
            String mimetype = context.getMimeType(filePath);
            // sets response content type
            if (mimetype == null) {
                mimetype = "application/octet-stream";
            }
            response.setContentType(mimetype);
            response.setContentLength((int) file.length());
            String fileName = (new File(filePath)).getName();
            // sets HTTP header
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            OutputStream out = response.getOutputStream();
            FileInputStream in = new FileInputStream(file);
            byte[] buffer = new byte[4096];
            
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
            in.close();
            out.flush();

        } catch (Exception e) {
        }

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
