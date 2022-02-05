import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

public class Main {

    static void urlTohtml1() {
        String content = null;
        URLConnection connection = null;
        try {
            connection = new URL("http://www.google.com").openConnection();
            Scanner scanner = new Scanner(connection.getInputStream());
            scanner.useDelimiter("\\Z");
            content = scanner.next();
            scanner.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println(content);
    }


    static void urlTohtml2() throws MalformedURLException, IOException{

        URL url = new URL("http://www.google.com");
        InputStream is = url.openStream();
        int ptr = 0;
        StringBuffer buffer = new StringBuffer();
        while ((ptr = is.read()) != -1) {
            buffer.append((char)ptr);
        }
        System.out.println(buffer.toString());
    }


    public static void main(String[] args) throws IOException {
        String html;
        String website = "https://www.google.com/";
        URL url = new URL(website);
        URLConnection connect = new URL("http://www.google.com").openConnection();

        Scanner scanner = new Scanner(connect.getInputStream());
        /* getContent ; getHeaderField ; getInputStream() ;
    getContentEncoding
    getContentLength
    getContentType
    getDate
    getExpiration ; getLastModifed   */
        scanner.useDelimiter("</html" +
                ">");//\\Z");
        html = scanner.next();
        scanner.close();

        //html = url.getContent().toString();
        System.out.println(html);



        URLConnection connected = new URL("http://www.google.com").openConnection();
        //System.out.println(connected.getDate());
        //System.out.println(url.getFile());
        //System.out.println(url.getContent().toExternalForm();
        //System.out.println(html);

        //urlTohtml2();


        /**Scanner example
        Scanner s = new Scanner("1 fish 2 fish red fish blue fish")
        s.useDelimiter(" fish ");
        System.out.println(s.nextInt() +  s.next());
        s.close();
        **/

    }


}
