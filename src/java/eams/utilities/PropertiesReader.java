/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eams.utilities;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 *
 * @author Abhradeep
 */
public class PropertiesReader {

    public static DbParamProvider readProperties(InputStream inputFile) {
        DbParamProvider dp = new DbParamProvider();
        //read the properties files and extract the properties to set into DbParamProvider class
        try {
            InputStreamReader reader = new InputStreamReader(inputFile);
            //FileReader reader = new FileReader(inputFile);
            Properties p = new Properties();
            p.load(reader);

            dp.setDriver(p.getProperty("driver"));
            dp.setDbUrl(p.getProperty("db_url"));
            dp.setDbName(p.getProperty("db_name"));
            dp.setUserName(p.getProperty("user_name"));
            dp.setPassword(p.getProperty("password"));
        } catch (IOException e) {
            System.out.println(e);
        }
        return dp;
    }

}
