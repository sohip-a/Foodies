package com.FoodWebApp.Test;

import com.FoodWebApp.Base.TestBase;
import com.FoodWebApp.Pages.RegisterPage;
import com.FoodWebApp.utils.ConfigUtils;
import org.openqa.selenium.By;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.time.Duration;

public class RegisterTest extends TestBase {
    //TC_Register_001
    @Test(priority = 1)
    public void validateSignup() {
        // Happy Scenario
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ConfigUtils.getInstance().getValidEmail()
                , ConfigUtils.getInstance().validPhoneNumber(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.getTitle(), "homepage");
    }

    //TC_Register_002
    @Test(priority = 2)
    public void invalidSignupUsingWrongFormatEmail() {
        // sign up using invalid email format
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ConfigUtils.getInstance().inValidEmail()
                , ConfigUtils.getInstance().validPhoneNumber(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.switchTo().alert().getText(), "Email format is not valid");
        driver.switchTo().alert().accept();
    }

    //TC_Register_003
    @Test(priority = 3)
    public void invalidSignupUsingBlankEmail() {
        // sign up using blank email
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ""
                , ConfigUtils.getInstance().validPhoneNumber(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.switchTo().alert().getText(), "Email is required");
    }

    //TC_Register_004
    @Test(priority = 4)
    public void invalidSignupUsingBlankID() {
        // sign up using blank ID
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData("", ConfigUtils.getInstance().getValidEmail(),
                ConfigUtils.getInstance().validPhoneNumber(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.getTitle(), "Food Web App - Registration");
    }

    //TC_Register_005
    @Test(priority = 5)
    public void invalidSignupUsingBlankPassword() {
        // sign up with blank password
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ConfigUtils.getInstance().getValidEmail(),
                ConfigUtils.getInstance().validPhoneNumber(), "");
        Assert.assertEquals(driver.switchTo().alert().getText(), "Password is required");
    }

    //TC_Register_006
    @Test(priority = 6)
    public void invalidSignupUsingInvalidPhoneNumber() {
        // sign up with invalid phone number
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ConfigUtils.getInstance().getValidEmail(),
                ConfigUtils.getInstance().inValidPhoneNumber(), ConfigUtils.getInstance().validPassword());
        Assert.assertEquals(driver.switchTo().alert().getText(), "phone must no contain any characterss");

    }

    //TC_Register_007
    @Test(priority = 7)
    public void invalidSignupUsingInvalidPassword() {
        // sign up using invalid password
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.fillData(ConfigUtils.getInstance().getValidUsername(), ConfigUtils.getInstance().getValidEmail(),
                ConfigUtils.getInstance().validPhoneNumber(), ConfigUtils.getInstance().inValidPassword());
        Assert.assertEquals(driver.switchTo().alert().getText(), "Password must contain at least one numeric value");
    }

    //    TC_Register_008
    @Test(priority = 8)
    public void validateLoginButtonInRegisterPage() {
        // Redirect To login page from registration page
        RegisterPage registerPage = new RegisterPage(driver);
        registerPage.clickOnLogin();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(3));
        Assert.assertTrue(driver.findElement(By.xpath("//input[@id='loginBtn']")).isDisplayed());
        Assert.assertEquals(driver.getTitle(), "Food Web App - Login");
    }
}