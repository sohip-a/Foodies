package com.FoodWebApp.Pages;

import com.FoodWebApp.Base.PageBase;
import com.github.javafaker.PhoneNumber;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class RegisterPage extends PageBase {
    public RegisterPage(WebDriver driver) {
        super(driver);
    }
    @FindBy(xpath = "//input[@id='username']")
    private WebElement username_TextField;
    @FindBy(xpath = "//input[@id='email']")
    private WebElement email_TextField;
    @FindBy(xpath = "//input[@id='phone']")
    private WebElement phone_TextField;
    @FindBy(xpath = "//input[@id='password']")
    private WebElement password_TextField;
    @FindBy(xpath = "//input[@id='confirm_password']")
    private WebElement confirmPassword;
    @FindBy(xpath = "//input[@id='regBtn']")
    private WebElement register_button;
    @FindBy(xpath = "//a[contains(text(),'Login')]")
    private WebElement login_button;

    private String username;
    private String email;
    private PhoneNumber phoneNumber;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public PhoneNumber getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(PhoneNumber phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }




    public RegisterPage fillData(String username, String email, String phone, String password) {
        username_TextField.clear();
        email_TextField.clear();
        phone_TextField.clear();
        password_TextField.clear();
        confirmPassword.clear();


        username_TextField.sendKeys(username);
        email_TextField.sendKeys(email);
        phone_TextField.sendKeys((CharSequence) phone);
        password_TextField.sendKeys(password);
        confirmPassword.sendKeys(password);
        register_button.click();
        return this;

    }
    public RegisterPage clickOnLogin(){
        login_button.click();
        return this;
    }


}
