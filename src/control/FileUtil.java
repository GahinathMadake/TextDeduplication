/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author Godwit-3
 */
public class FileUtil {
    
    public static String getChecksum(String filename, String algo,String privilege,String sha1) throws Exception {  
        System.out.println("in getChecksum");
      byte[] b = createChecksum(filename, algo,privilege,sha1);  
      System.out.println("b length"+b.length);
      System.out.println("b::"+b);
      
      String instr=new String(b);
      System.out.println("instr::"+instr);
      
      byte[] bg=instr.getBytes();
       System.out.println("bg length"+bg.length);
      System.out.println("bg::"+bg);
      
      
      String result = "";  
      for (int i=0; i < b.length; i++) {  
           result +=  
                     Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );  
      }  
      
      System.out.println("result"+result);
      return result;  
 }  
    public static byte[] createChecksum(String filename, String algo,String privilege,String sha1) throws Exception{  
        System.out.println("in createChecksum");
        System.out.println("filename"+filename);
        System.out.println("sha1 : "+sha1);
        System.out.println("algo"+algo);
      FileInputStream fis = new FileInputStream(filename);  
       System.out.println("fis"+fis);
      byte[] buffer = new byte[1024];  
       System.out.println("buffer"+buffer);
      MessageDigest complete = MessageDigest.getInstance(algo); //One of the following  "SHA-256"  
       System.out.println("complete"+complete);
      int numRead;  
      do {  
           numRead = fis.read(buffer);  
           if (numRead > 0) {  
                complete.update(buffer, 0, numRead);  
                 System.out.println("numRead"+numRead);
           }  
      } while (numRead != -1);  
      fis.close();  
      return complete.digest();  
 }   
}
