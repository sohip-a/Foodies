package com.FoodWebApp.utils;

import java.util.Properties;

public class ConfigUtils {
    private static Properties properties;
    private static ConfigUtils configUtils;

    private ConfigUtils() {
        properties =
                PropertiesUtils.LoadProperties("src/main/java/com/FoodWebApp/Data/Production.Properties");
    }

    public static ConfigUtils getInstance() {
        if (configUtils == null) {
            configUtils = new ConfigUtils();
        }
        return configUtils;
    }
    public String getBaseUrl() {
        String prop = properties.getProperty("baseUrl");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find BaseUrl in Property file");
    }
    public String getValidUsername() {
        String prop = properties.getProperty("validUsername");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find valid valid Username in Property file");
    }
    public String getValidEmail() {
        String prop = properties.getProperty("validEmail");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find valid Email in Property file");
    }
    public String validPhoneNumber() {
        String prop = properties.getProperty("validPhoneNumber");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find valid PhoneNumber in Property file");
    }
    public String validPassword() {
        String prop = properties.getProperty("validPassword");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find valid Password in Property file");
    }
    public String inValidEmail() {
        String prop = properties.getProperty("invalidEmail");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find invalid Email in Property file");
    }
    public String inValidPassword() {
        String prop = properties.getProperty("invalidPassword");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find invalid Password in Property file");
    }
    public String inValidPhoneNumber() {
        String prop = properties.getProperty("invalidPhoneNumber");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find invalid Phone number in Property file");
    }
    public String getLoginUrl() {
        String prop = properties.getProperty("loginUrl");
        if (prop != null) return prop;
        else
            throw new RuntimeException("Couldn't find Login URL in Property file");
    }
}
