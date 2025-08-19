/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

//import Communication.IP_add;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.jasper.tagplugins.jstl.core.Url;

/**
 *
 * @author godwit10
 */
public class Connect {
    private static Connection conn1;
    
 public static void UpdateRequest(String block) throws IOException {
        
     // String Url="http://cloudelbs.j.layershift.co.uk/server/UpdateFile";
      String Url="http://localhost:8080/server/UpdateFile";

        URL toUrl = new URL(Url);
        URLEncoder.encode(" Test Man", "utf8");
        System.out.println("Url..."+toUrl);
        URLConnection yc = toUrl.openConnection();
        BufferedReader in = new BufferedReader(
                            new InputStreamReader(
                            yc.getInputStream()));
             String inputLine;

            while ((inputLine = in.readLine()) != null) 
                System.out.println(inputLine);
            in.close();

            /*  //Build parameter string
     boolean b=false;
       // String data = "username="+uname+"&password="+pass;
     
      try {  
          System.out.println("in the update request of Connect in client..");
        URL aURL = new URL( "http://localhost:8084/LBS/UpdateFile");  
        URLConnection aConnection = aURL.openConnection();  
        aConnection.setDoInput(true);  
        aConnection.setDoOutput(true);  
        aConnection.setUseCaches(false);  
        aConnection.setDefaultUseCaches(false);  
        aConnection.setRequestProperty("Content-Type","application/octet-stream");  
        aConnection.connect();  
    } catch (Exception e) { System.out.println(e); }  
    */
     
    /*
             try{ String line=null;
                    URL url = new URL( "http://localhost:8084/LBS/UpdateFile?block="+block );
                    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
                    line = in.readLine();

                    System.out.println( line );

                    in.close();
            }
            catch (Exception e)
            {
            e.printStackTrace();
            }  
     */
    /* try {
            
            // Send the request
            System.out.print("block to update..."+block);
            URL url = new URL("http://localhost:8084/LBS/UpdateFile?block="+block);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            
            //write parameters
            writer.write(block);
            writer.flush();
            
            // Get the response
         /*   StringBuffer answer = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                answer.append(line);
            }
            writer.close();
            reader.close();
            
            //Output the response
            System.out.println(answer.toString());
          //  return answer.toString();
          */
             /*
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
           // return "fail";
        } catch (IOException ex) {
            ex.printStackTrace();
           // return "fail";
        }
        */
    }
    
     public void DeleteRequest(String Index) throws IOException {
        
      String Url="http://cloudelbs.j.layershift.co.uk/server/DelReq?Index="+Index+"";
      
      System.out.println("Block index to delete..."+Index+"\nDelete request To the Server ...."+Url);

        URL toUrl = new URL(Url);
        URLEncoder.encode(Url, "utf8");
        //System.out.println("Url..."+toUrl);
        URLConnection yc = toUrl.openConnection();
        BufferedReader in = new BufferedReader(
                            new InputStreamReader(
                            yc.getInputStream()));
             String inputLine;
             System.out.println("Server Response:--------");
            while ((inputLine = in.readLine()) != null) 
                System.out.println(inputLine);
            in.close();
     }
 
 public static boolean sendPostRequest(String uname,String pass) throws IOException {
        
        //Build parameter string
        boolean b=false;
        String data = "username="+uname+"&password="+pass;
        try 
        {
            
            // Send the request
            System.out.print(uname+"  "+pass);
           // URL url = new URL("http://cloudelbs.j.layershift.co.uk/server/LoginServlet?username="+uname+"&password="+pass+"&who=user");
             URL url = new URL("http://localhost:3306/LBS/LoginServlet?username="+uname+"&password="+pass+"&who=user");
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            
            //write parameters
            writer.write(data);
            writer.flush();
            
            // Get the response
            StringBuffer answer = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                answer.append(line);
                System.out.println("rec data : "+line);
            }
            writer.close();
            reader.close();
            System.out.println("rec data1 : "+answer);
            //Output the response
            System.out.println(answer.toString());
            return true;
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
            return true;
        } catch (IOException ex) {
            ex.printStackTrace();
            return true;
        }
    }
 
 
 
 public static void insert(String user, String file) throws MalformedURLException, IOException
 { 
     
     try   {
  Class.forName("com.mysql.jdbc.Driver");
           // conn1=DriverManager.getConnection("jdbc:mysql://mysql-cloudelbs.j.layershift.co.uk/cloude","root","qJESKNSgQd");
   conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
           Statement st = conn1.createStatement();
  //ResultSet res = st.executeQuery("SELECT * FROM "+ Logintable + " WHERE username='"+uname+"' AND password='"+password+"'");
        String sql = "INSERT INTO file_add VALUES ("+user+",'"+file+")";
        int i = st.executeUpdate(sql);
           }
           catch(Exception e)
           {
               System.out.println(e);
           }
            
             // Get the response
       /*     StringBuffer answer = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(yc.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) 
            {
                answer.append(line);
            }
            writer.close();
            reader.close();*/
            
     
     
 } 
 
 
 
 
 
 public boolean sendData(String id,String user,String filename,String s_user) throws IOException {
        
        //Build parameter string
        //boolean b=false;
        //String line1=null;
        //String filec = null;
     try{
         System.out.println("IN CONNECT FILE");
        String data = "username="+user;
        System.out.println("s_user"+s_user);
            URL url = new URL("http://localhost:8080/Cloud_Deduplication_2/ApprovalFile?u_id="+id+"&user="+user+"&filename="+filename+"&s_user="+s_user);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
           // OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            OutputStreamWriter writer =  new OutputStreamWriter(conn.getOutputStream());
            
            writer.write(data);
            writer.flush();
            //write parameters
                StringBuffer answer = new StringBuffer();
             BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                answer.append(line);
                System.out.println("rec data : "+line);
            }
            writer.close();
            reader.close();
            System.out.println("rec data1 : "+answer);
            //Output the response
            System.out.println(answer.toString());
                    }catch(IOException ex){
                       Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
                    }
//            return answer.toString();
            return true;
        //}
    }
 
 
 
 
 public  String getPostData(String uname,String pass) throws IOException {
        
        //Build parameter string
        boolean b=false;
        StringBuffer answer = new StringBuffer();
        String data = "username="+uname+"&password="+pass;
        try 
        {
            
            // Send the request
            System.out.print(uname+"  "+pass);
           // URL url = new URL("http://cloudelbs.j.layershift.co.uk/server/LoginServlet?username="+uname+"&password="+pass+"&who=user");
             URL url = new URL("http://localhost:8080/LBS/Datafiles?username="+uname+"&password="+pass+"&who=user");
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
            
            //write parameters
            writer.write(data);
            writer.flush();
            
            // Get the response
            
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                answer.append(line);
                System.out.println("rec data : "+line);
            }
            writer.close();
            reader.close();
            System.out.println("rec data1 : "+answer);
            //Output the response
            System.out.println(answer.toString());
            return answer.toString();
        } catch (MalformedURLException ex) {
            ex.printStackTrace();
            return  answer.toString();
        } catch (IOException ex) {
            ex.printStackTrace();
            return  answer.toString();
        }
    }
 
 
 
 
 public static void main(String args[])
 {
     Connect cnt=new Connect();
        try {
            cnt.DeleteRequest("3");
        } catch (IOException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
 }    
}
