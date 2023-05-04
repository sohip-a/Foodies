package com.FoodWebApp.Test;

import com.FoodWebApp.Base.TestBase;
import com.FoodWebApp.Pages.LoginPage;
import com.FoodWebApp.utils.ConfigUtils;
import org.openqa.selenium.By;
import org.testng.Assert;
import org.testng.annotations.Test;

public class LoginTest extends TestBase {
    //TC_Login_009
    @Test
    public void validateLogin() {
        // Happy scenario
        LoginPage loginPage = new LoginPage(driver);
        loginPage
                .loadLoginPage()
                .fillLoginData(ConfigUtils.getInstance().getValidEmail(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.getTitle(), "homepage");

    }

    //TC_Login_010
    @Test
    public void invalidEmailLogin() {
        // login using invalid Email
        LoginPage loginPage = new LoginPage(driver);
        loginPage
                .loadLoginPage()
                .fillLoginData(ConfigUtils.getInstance().inValidEmail(),
                        ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.getTitle(), "Food Web App - Login");
    }

    //TC_Login_011
    @Test
    public void invalidPasswordLogin() {
        // Login using invalid password
        LoginPage loginPage = new LoginPage(driver);
        loginPage
                .loadLoginPage()
                .fillLoginData(ConfigUtils.getInstance().getValidEmail(),
                        ConfigUtils.getInstance().inValidPassword());
        Assert.assertEquals(driver.switchTo().alert().getText(), "Please enter a valid Credentials to login");
    }
    //TC_Login_012
    @Test
    public void invalidLoginCredentials() {
        // login using invalid email and password
        LoginPage loginPage = new LoginPage(driver);
        loginPage
                .loadLoginPage()
                .fillLoginData(ConfigUtils.getInstance().inValidEmail(),
                        ConfigUtils.getInstance().inValidPassword());
        Assert.assertEquals(driver.getTitle(), "Food Web App - Login");
    }

    //TC_Login_013
    @Test
    public void redirectToForgotPasswordPage() {
        // redirect to forgot password page from login page
        LoginPage loginPage = new LoginPage(driver);
        loginPage
                .loadLoginPage().loadLoginPage().goTOForgotPasswordPage();
        Assert.assertEquals(driver.getTitle() , "Food Web App - Forgot Password");
        Assert.assertTrue(driver.findElement(By.xpath("//input[@id='resetBtn']")).isDisplayed());
    }

}
