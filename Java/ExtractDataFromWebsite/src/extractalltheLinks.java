import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.By;


public class extractalltheLinks {
    public static void main(String[] args) {


        String path = System.getProperty("user.dir");
        //System.out.println(path);
        System.setProperty("webdriver.chrome.driver", path + "\\ressources\\chromedriver.exe");

        WebDriver driver = new ChromeDriver();
        driver.navigate().to("http://www.calculator.net");

        java.util.List<WebElement> links = driver.findElements(By.tagName("a"));
        System.out.println("Number of Links in the Page is " + links.size());

        for (int i = 1; i < links.size(); i++) {
            System.out.println("Name of Link# " + i + links.get(i).getText());
        }

    }
}
