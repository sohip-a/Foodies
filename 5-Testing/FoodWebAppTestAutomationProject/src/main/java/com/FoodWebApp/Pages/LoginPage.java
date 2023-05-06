package com.FoodWebApp.Pages;

import com.FoodWebApp.Base.PageBase;
import com.FoodWebApp.utils.ConfigUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class LoginPage extends PageBase {
    public LoginPage(WebDriver driver) {
        super(driver);
    }
    @FindBy(xpath = "//input[@id='email']")
    private WebElement emailField;
    @FindBy(xpath = "//input[@id='password']")
    private WebElement passwordField;
    @FindBy(xpath = "//input[@id='loginBtn']")
    private WebElement loginButton;
    @FindBy(xpath = "//a[contains(text(),'Forgot Password?')]")
    private WebElement forgotPasswordButton;

    public LoginPage loadLoginPage(){
        driver.get(ConfigUtils.getInstance().getLoginUrl());
        return this;
    }
    public void fillLoginData(String email , String password){
        emailField.sendKeys(email);
        passwordField.sendKeys(password);
        loginButton.click();
    }
    public void goTOForgotPasswordPage(){
        forgotPasswordButton.click();
    }
}
