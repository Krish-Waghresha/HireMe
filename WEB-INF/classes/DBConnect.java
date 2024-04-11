/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.DBConnect;

import java.sql.*;

/**
 *
 * @author Vishal
 */
public class DBConnect {
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
