/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.Upload;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.DBConnect.DBConnect;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {

    private static final String DATA_DIRECTORY = "Resume";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    public  String filepath="";
     public String fileName=null;
    public  String username = null;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        PrintWriter out = response.getWriter();
        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                     fileName = new File(item.getName()).getName();
                    filepath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filepath);
                    System.out.println(filepath);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                   
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user")) {
                                username = cookie.getValue();
                            }
                        }
                    }
                  
                }
            }
            DBConnect db= new DBConnect();
            Connection con=db.getDBconnection();
              String qry="UPDATE applicant_info SET resumepath='"+ fileName +"' WHERE uname='"+ username +"';";
               PreparedStatement pst = (PreparedStatement) con.prepareStatement(qry);
            int chk1 = pst.executeUpdate();
            if (chk1 != 0) {
                getServletContext().getRequestDispatcher("/ApplicantHome.jsp").forward(
                    request, response);

            }else{
                  RequestDispatcher rd = getServletContext().getRequestDispatcher("/UploadResume.jsp");
                out.println("Sorry Try Again");
                rd.include(request, response);
                
            }

            

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

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
