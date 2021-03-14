/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exavalu.utilities;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Windows10
 */
public class PropertiesReader {
    
    
     public static DbParamProvider readProperties(String filepath)  {
        DbParamProvider dbParamProvider = new DbParamProvider();
        //Now read the property file and extarct the properties to set into DbParamProvider class
        FileReader reader;
        try {
            reader = new FileReader(filepath);
            Properties p = new Properties();
            p.load(reader);
            dbParamProvider.setDriver(p.getProperty("driver"));
            dbParamProvider.setDbUrl(p.getProperty("db_url"));
            dbParamProvider.setDbName(p.getProperty("db_name"));
            dbParamProvider.setUserName(p.getProperty("user_name"));
            dbParamProvider.setPassword(p.getProperty("password"));
        } catch (FileNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        catch(IOException ex)
        {
            System.out.println(ex.getMessage());
        }

        return dbParamProvider;
    }

}


