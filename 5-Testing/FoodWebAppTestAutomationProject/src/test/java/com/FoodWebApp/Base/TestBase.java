package com.FoodWebApp.Base;


import com.FoodWebApp.Factory.DriverFactory;
import io.qameta.allure.Allure;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

import java.io.*;
import java.util.List;

import static org.bouncycastle.crypto.tls.ContentType.alert;


public class TestBase {

    protected WebDriver driver;

    @BeforeMethod
    public void setUp() {
        driver = new DriverFactory().initializeDriver();

    }


    @AfterMethod
    public void tearDown(ITestResult result) {
        try {
            String testCasesName = result.getMethod().getMethodName();
            File destinationFile = new File("target" + File.separator + "screenShots" + File.separator + testCasesName + ".png");
            takeScreenshot(destinationFile);
            InputStream inputStream = new FileInputStream(destinationFile);
            Allure.addAttachment("screenshot", inputStream);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (UnhandledAlertException | NoAlertPresentException e) {
            driver.switchTo().alert().dismiss();
        }
        driver.quit();
    }

    public void takeScreenshot(File destinationFile) {
        WebDriver driver1 = driver;
        File file = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
        try {
            FileUtils.copyFile(file, destinationFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

