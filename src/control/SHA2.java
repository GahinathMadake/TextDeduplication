/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

/**
 *
 * @author User6
 */
 import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class SHA2 {

    
   

//public class SHA512 {
      public void main1(String text) throws Exception {
          String password = "pass@word1";

//    	    if ((args.length == 1) && (args[0].length() > 0))
//    	    {
//    	    	password = args[0];
//    	    }
            System.out.println("Password: " + password + " in SHA512 is:");
            System.out.println("Tag: "+hashText(text));
      }
      
    public static String convertByteToHex(byte data[])
    {
        StringBuffer hexData = new StringBuffer();
        for (int byteIndex = 0; byteIndex < data.length; byteIndex++)
            hexData.append(Integer.toString((data[byteIndex] & 0xff) + 0x100, 16).substring(1));
        
        return hexData.toString();
    }
    
    public static String hashText(String textToHash) throws Exception
    {
        final MessageDigest sha512 = MessageDigest.getInstance("SHA-512");
        sha512.update(textToHash.getBytes());
        
        return convertByteToHex(sha512.digest());
    }
      public static String sha2(String input) throws NoSuchAlgorithmException {
        MessageDigest mDigest = MessageDigest.getInstance("SHA1");
        byte[] result = mDigest.digest(input.getBytes());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < result.length; i++) {
            sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
        }
         
        return sb.toString();
    }
//}


    
    
}


