import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.ArrayList;
import java.util.List;


public class Main {

    public static void main(String[] args) {

        //contain the data
        ArrayList<ArrayList<String>> table = new ArrayList<>();

        //set the path
        String path = System.getProperty("user.dir");
        //System.out.println(path);
        System.setProperty("webdriver.chrome.driver",path+"\\ressources\\chromedriver.exe");

        //WebDriver driver = new FirefoxDriver();
        WebDriver driver = new ChromeDriver();
        driver.get("http://comersis.fr/");

        java.util.List<WebElement> links = driver.findElements(By.tagName("a"));
        System.out.println("Number of Links in the Page is " + links.size());

       //home page
       //WebElement page1 = driver.findElement(By.linkText("nature-juridique")).click();
       // findElementByLinkText("nature-juridique");
        List<WebElement> pages1 = driver.findElements(By.cssSelector(".list-group-item a"));//.click();not a good habit bc of security stuff
        ArrayList<String> linksofP1 = new ArrayList<>();

        for (int i = 0 ; i < pages1.size(); i++) {
            //System.out.println(i-20 + " : " + pages1.get(i).getText());
            linksofP1.add(pages1.get(i).getAttribute("href"));
        }
        //System.out.println(linksofP1.size());
        //System.out.println( driver.findElement( By.partialLinkText("nature-juridique")).toString() ) ;
        //System.out.println(linksofP1.get(4));

        //departements
        //page2 = page1.findElements(By.linkText("epci."));
        //List<WebElement> pages2 = new ArrayList();
        ArrayList<String> linksofP2 = new ArrayList<>();
        for (int i = 0 ; i < linksofP1.size(); i++) {
            driver.navigate().to(linksofP1.get(i));

            List<WebElement> pages2 = driver.findElements(By.cssSelector(".panel-primary a"));

            for (int j = 0 ; j < pages2.size(); j++) {
                //System.out.println(i+ " " + pages2.get(j).getText());
                //System.out.println(i+ " " + pages2.get(j).getAttribute("href"));
                linksofP2.add(pages2.get(j).getText()); //.getAttribute("href")
            }
            //driver.navigate().back();
        }

        //for (int i = 0 ; i < linksofP2.size(); i++) System.out.println(linksofP2.get(i));

        //commune
        //id
        ArrayList<String> ids = new ArrayList<>();
        String id;


        for (int i = 0 ; i < linksofP2.size(); i++) {
            id = linksofP2.get(i);
            int stringlength = id.length();

            ids.add(id.substring( stringlength-9, stringlength ));
            //System.out.println(ids.get(i));
        }

        System.out.println( driver.findElements(By.cssSelector("h1 a")).get(0).getText() );


        //header
        //String header = page2.findElement(By.tagName("h1")).toString();
        ArrayList<String> headers = new ArrayList<>();
        for (String link : linksofP2) {
            driver.navigate().to(link);
            headers.add( driver.findElement(By.cssSelector("h1 a")).getText() );
        }



        //description
        //List<WebElement> description = driver.findElements(By.tagName("p"));
        ArrayList<String> descriptions = new ArrayList<>();
        for (String link : linksofP2) {
            driver.navigate().to(link);
            descriptions.add( driver.findElement(By.cssSelector(".page-header p")).getText() );
        }

        //coorodnnes(presidence, adress, tel, fax)
       // List<WebElement> coordonees = driver.findElements(By.tagName("ul"));
        ArrayList<String> coordonneesPresidence = new ArrayList<>();
        ArrayList<String> coordonneesAdress = new ArrayList<>();
        ArrayList<String> coordonneesTel = new ArrayList<>();
        ArrayList<String> coordonneesFax = new ArrayList<>();
        for (String link : linksofP2) {
            driver.navigate().to(link);
            List<WebElement> coordonnees = driver.findElements(By.cssSelector(".panel-success .list-group-item"));
            coordonneesPresidence.add(coordonnees.get(1).getText());
            coordonneesAdress.add(coordonnees.get(2).getText());
            coordonneesTel.add(coordonnees.get(3).getText());
            coordonneesFax.add(coordonnees.get(4).getText());
        }


        //nb de membres0
        ArrayList<String> nbMember = new ArrayList<>();
        //population 20201
        ArrayList<String> pop2020 = new ArrayList<>();
        //nb de competence2
        ArrayList<String> nbComp = new ArrayList<>();
        //nature juridique3
        ArrayList<String> natjur = new ArrayList<>();
        //financement5
        ArrayList<String> finance = new ArrayList<>();

        for (String link : linksofP2) {
            driver.navigate().to(link);
            List<WebElement> colonneG = driver.findElements(By.cssSelector(".panel-default td:nth-child(1)"));
            List<WebElement> colonneD = driver.findElements(By.cssSelector(".panel-default th"));

            nbMember.add(colonneD.get(0).getText());
            pop2020.add(colonneD.get(1).getText());
            nbComp.add(colonneD.get(2).getText());
            natjur.add(colonneD.get(3).getText());
            finance.add(colonneD.get(5).getText());
        }


        table.add(linksofP2);
        table.add(ids);
        table.add(headers);
        table.add(descriptions);
        table.add(coordonneesPresidence);
        table.add(coordonneesAdress);
        table.add(coordonneesTel);
        table.add(coordonneesFax);
        table.add(nbMember);
        table.add(pop2020);
        table.add(nbComp);
        table.add(natjur);
        table.add(finance);

        for (int i = 0; i < table.size(); i++) {
            for (int j = 0; j < table.get(i).size(); j++) {
                System.out.println(table.get(i).get(j));
            }
        }

    }


}
