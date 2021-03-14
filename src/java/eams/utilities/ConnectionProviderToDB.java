/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavalu.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Windows10
 */
public class ConnectionProviderToDB {
    
   
    private static Connection con = null;

   
    private ConnectionProviderToDB() {
    }
    public static Connection getConnection(String filepath) throws Exception {
        try {

            DbParamProvider dbParamProvider = PropertiesReader.readProperties(filepath);

            //step1 load the driver class

            Class.forName(dbParamProvider.getDriver());

            //Class.forName("com.mysql.cj.jdbc.Driver");

            //step2 create  the connection object 

            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/exavaludb","avijit","root"); 
            if(con ==null)
                con = DriverManager.getConnection(dbParamProvider.getDbUrl() + dbParamProvider.getDbName(), dbParamProvider.getUserName(), dbParamProvider.getPassword());
            
 

        } catch (ClassNotFoundException ex) {

            System.err.println(ex.getMessage());

        }

        catch (SQLException ex) {

            System.err.println(ex.getMessage());

        }
        return con;
    }
}

