
package org.DBConnect;

import java.sql.*;

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
