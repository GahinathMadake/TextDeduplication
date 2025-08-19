/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package control;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
//import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;
import org.apache.commons.io.FilenameUtils;

/**
 * Servlet implementation class UploadServlet
 */
//@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UpdateServlet extends HttpServlet {

    public static int startid;
    public static String ses1;
    public static String ses2;
    public static String servername;
    public static String saveFile1;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
        long f1 = System.currentTimeMillis();
        String user_id = "";
        HttpSession session = request.getSession();
        PrintWriter out = responce.getWriter();
        if (session.getAttribute("username") != null) {
             try {
            user_id = (String) session.getAttribute("username");
            out.println("user_id" + user_id);
            RequestDispatcher rd = null;
            String txtarea = request.getParameter("data");
            String id = request.getParameter("id");
                 System.out.println("iddddd : "+id);
            String uid = id.replace("/","");
            System.out.println("uid :"+uid);
            int u_id = Integer.parseInt(uid);
//            String id = "";
            String decryptedText  = null;
            String str = request.getParameter("decryptedText");
            decryptedText = str.replaceAll("%20", " ");
            
            decryptedText = decryptedText.replace("/", "");
                 System.out.println("input data: "+decryptedText);
            String user = "";
            String privi = "";
            String pri="";
            int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

            Connection con = null;
                           
                              ServletContext sc = getServletContext();
                              Class.forName("com.mysql.jdbc.Driver");
                              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
                                System.out.println("Connection established");
            
             String sf = "select * from n_file where u_id = "+u_id+"";
                            Statement ss = con.createStatement();
                            String filec = null;
                            String filename = null;
                            ResultSet rr = ss.executeQuery(sf);
                            while(rr.next()){
                                filec = rr.getString("file");
                                System.out.println("prev :"+filec);
                                filename = rr.getString("File_Name");
                            }
            
//            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//            out.println("isMultipart" + isMultipart);
//            if (!isMultipart) {
//            } else {
//                FileItemFactory factory = new DiskFileItemFactory();
//                ServletFileUpload upload = new ServletFileUpload(factory);
//                List items = null;
//                try {
//                    items = upload.parseRequest(request);
//                    out.println("items" + items);
//                } catch (FileUploadException e) {
//                    e.printStackTrace();
//                }
//
//                try {
//
//                    Iterator itr = items.iterator();
//                    while (itr.hasNext()) {
//                        FileItem item = (FileItem) itr.next();
//                        if (item.isFormField()) { // for expernal data receive which we get from text or hoidden from jsp page
//                            String namee = item.getFieldName();
//                            String value = item.getString();
//                            System.out.println("Namee "+namee+" : "+value);
//                            pri=value;
//                            if (namee.equals("user")) {
//                                out.println("user" + user);
//                                user = value;
//                                count1 = 1;
//                            } 
//                            if (namee.equals("tag1")) {
//                                out.println("privilege" + privi);
//                                System.out.println("privilege" + privi);
//                                privi = value; 
//                                System.out.println("privilege" + privi);
//                                count1 = 1;
//                            }
//                        } 
//                        //else { //this for getting file data from jsp page
//
//
//                            String itemName = item.getName();
//                            System.out.println("itemName" + itemName);
//                            File savedFile = new File("E:\\"+itemName);//config.getServletContext().getRealPath("/")+"emp_image\\image\\"+itemName);
//                            
//                           
//                            item.write(savedFile);
//                            
//                            String ext = FilenameUtils.getExtension(itemName);
//                           
//                            System.out.println("fname"+ext);
//                            System.out.println("file extention :"+ext);
//                            long vb = savedFile.length();
//                            System.out.println("file size :"+vb);
//                            
//                            String str=itemName;
//                            String file_witout_ext ="";
//                            if (!str.contains(".")) 
//                             {   
//                                file_witout_ext=str;
//                                System.out.println("File Name=" + str);
//                             }   
//                            else {
//                                str = str.substring(0, str.lastIndexOf("."));
//                                // Because extension is always after the last '.'
//                                file_witout_ext=str;
//                                System.out.println("File Name=" + str);
//                            }
//
//                             System.out.println("file_witout_ext" + file_witout_ext);
                            
//                           String itemName = item.getName();
//                            File fg = new File(itemName);
//                           String extension = FilenameUtils.getExtension(itemName);
////   File savedFile = new File(config.getServletContext().getRealPath("/")+"emp_image\\image\\"+itemName);
//
//                           File savedFile = new File("D:\\PDF\\" + itemName);
//
//                            item.write(savedFile);
//                            out.println(savedFile.getAbsolutePath());
                            
                            long f2 = System.currentTimeMillis();
                            long sum = f2 - f1;
                           String decryptedText1 = decryptedText+txtarea;
                            int vb = decryptedText1.length();
                            System.out.println("decryptedText :"+decryptedText);
                            String path = "E:\\"+filename;
                             File savedFile = new File("E:\\"+filename);
                            FileWriter fw = new FileWriter(savedFile);
                                             fw.write(decryptedText1);
                                             fw.close();
                            String fname = savedFile.getName();
                            long f3 = System.currentTimeMillis();
                            long sum2 = f3 - f2 ;
                            Statement mmt = con.createStatement();
                            String sr1 = "update insrt set upld='"+sum+"',encr='"+sum2+"' where id = '1'";
                            int jk = mmt.executeUpdate(sr1);
                            FileReader file = new FileReader("E:\\"+filename);

//                            String path = "E:\\"+itemName;
                            BufferedReader reader = new BufferedReader(file);
                            String text = "";
                            String line = reader.readLine();
                            while (line != null) {
                                text += line;
                                line = reader.readLine();
                              //  out.println("line");
                            }
                            reader.close();
                            System.out.println(text);
                            SHA1 sha1 = new SHA1();
                          
                          String sb = sha1.sha1(text);
                          
                                System.out.println("SHA1 : "+sb);
                            FileUtil fu = new FileUtil();
                            byte[] b1 = fu.createChecksum(path, "MD5",pri,sb);
                            System.out.println("b1 lenght" + b1.length);
                            System.out.println("b length" + b1.length);
                            System.out.println("b::" + b1);

                            String instr = new String(b1, "UTF-8").trim();
                            System.out.println("main instr::" + instr);

                            byte[] bg = instr.getBytes();
                            System.out.println("bg length" + bg.length);
                            System.out.println("bg::" + bg);
                            char[] org_bg=instr.toCharArray();
                            
                             
                            
                                
                                Blob hash_data;
                                
                                int flag=0;

                            
                            Statement stmt =con.createStatement();
                            String chck_sql="select * from k_p";
                            ResultSet rst=stmt.executeQuery(chck_sql);
                            while(rst.next())
                            {
                                int ref_id=rst.getInt("id");
                                hash_data=rst.getBlob("key1");
                                String p = rst.getString("privilege");
                                System.out.println("p=="+p);
                              byte[] db_enc_data = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data);
                              
                              String instr1 = new String(db_enc_data, "UTF-8").trim();
                              System.out.println("instr::" + instr1);
                              System.out.println(instr+" == "+instr1);
                              //System.out.println(pri);
                              
//                             
                              char[] db_bg= instr1.toCharArray();
                              if(Arrays.equals(org_bg, db_bg) )
                              {
                                  
                                  System.out.println("key equal");
                                  
                              }
                              else{
                                  
                                  flag ++;
                                  System.out.println(" in else : :"+flag);
                              }
                              
                            }     
                            
                            
                            
                            if(flag!=0)
                            {
                                System.out.println("flaggggggggg");
                                 Statement stc = con.createStatement();
                                   String strc = "select * from dedup_data where ref_ptr = "+u_id+"";
                                   ResultSet rsc = stc.executeQuery(strc);
                                   if(rsc.next()){
                                 String dedup_user = rsc.getString("userid");
                                System.out.println("in else");
                            ///////////////////////////////////
                            AESFile ae = new AESFile();

                            ae.generateKey(b1, "AES");


                            String plainText = text; 
                            System.out.println("plain : "+plainText);
                            String encryptedText = AESFile.encrypt(plainText);



                            
                            String enc_file = "E:\\"+filename;
                            ///////////write encrypted file

                            PrintWriter writer = new PrintWriter(enc_file, "UTF-8");
                            writer.println(encryptedText);
                            writer.close();


                           

                                Statement st = null;
                              

                                File save_enc_file = new File(enc_file);


                                PreparedStatement psmt = null;

                                
                                psmt= con.prepareStatement("insert into n_file(File_Name,User,file,status,size)"+"values(?,?,?,'false',?)");

                                psmt.setString(1, fname);
                                psmt.setString(2, user_id);

                                FileInputStream fis = new FileInputStream(save_enc_file);
                                psmt.setBinaryStream(3, (InputStream) fis, (int) (save_enc_file.length()));
 
                                psmt.setLong(4, vb);
                                System.out.println(psmt);

                                int s = psmt.executeUpdate();

                                st = con.createStatement();
                                
                                int id1=0;
                                Statement st1=con.createStatement();
                                String sql = "select * from n_file";
                                 ResultSet rst1=st1.executeQuery(sql);
                            while(rst1.next())
                                 {
                                    
                                      id1 = rst1.getInt("u_id");
                                 }
                                    Statement stpri = con.createStatement();
                                    ResultSet rspri = stpri.executeQuery("select * from reg where userid = '"+user_id+"'");
                                    while(rspri.next()){
                                        pri = rspri.getString("privilege");
                                    }
                                         System.out.println("id : "+id1+" key : "+b1+" privileges "+pri);
                                        PreparedStatement n_p=null ;
                                        n_p = con.prepareStatement("insert into k_p(id,key1,privilege) values(?,?,?)");
                                        n_p.setInt(1,id1);
                                        n_p.setBytes(2, b1);
                                        n_p.setString(3, pri);
                                        int k = n_p.executeUpdate();
                                        System.out.println("n_p : "+n_p);
                                        String upd = "update n_file set User = '"+dedup_user+"' where u_id = "+u_id+"";
                                        System.out.println("upd : "+upd);
                                        Statement stu = con.createStatement();
                                        int asd = stu.executeUpdate(upd);
                                        String del = "delete from dedup_data where ref_ptr = "+u_id+"";
                                       Statement stdel = con.createStatement();
                                       int delt = stdel.executeUpdate(del);
                                           //////////////////check
                              int id11=0;
                                Statement st21=con.createStatement();
                                String sql21 = "select * from n_file";
                                 ResultSet rst21=st21.executeQuery(sql21);
                            while(rst21.next())
                                 {
                                    // System.out.println("start k_p");
                                      id11 = rst21.getInt("u_id");
                                 }
                              
                              String ck = "select * from k_p where id = "+id11+"";
                              Statement stck = con.createStatement();
                              ResultSet rsck = stck.executeQuery(ck);
                              Blob hashdata = null;
                               byte[] dbencdata=null;
         while(rsck.next()){
             hashdata = rsck.getBlob("key1");
             System.out.println("hash_data :"+hashdata);
         }
                              
             dbencdata = hashdata.getBytes(1,(int)hashdata.length());           
                String instr11 = new String(dbencdata, "UTF-8").trim();
                              System.out.println("instr::" + instr11);
//                              System.out.println(instr1+" == "+instr11);  
                              System.out.println("db_enc_data"+dbencdata);
         AESFile ae2 = new AESFile();
                            ae2.generateKey(dbencdata, "AES");
                              
                           String decryptedText_ck = AESFile.decrypt(encryptedText);
                            System.out.println("decryptedText check :"+decryptedText_ck);   
                              
                                        
                                        
                                        responce.sendRedirect("uploadfile.jsp");

                             
                            
                            
                            
                            
                            
                            }
                                   else{
                                       
                                        AESFile ae = new AESFile();

                            ae.generateKey(b1, "AES");


                            String plainText = text; 
                            System.out.println("plain : "+plainText);
                            String encryptedText = AESFile.encrypt(plainText);



                            
                            String enc_file = "E:\\"+filename;
                            ///////////write encrypted file

                            PrintWriter writer = new PrintWriter(enc_file, "UTF-8");
                            writer.println(encryptedText);
                            writer.close();
                                       
                               Statement st = null;
                              

                                File save_enc_file = new File(enc_file);


                                PreparedStatement psmt = null;

                                
//                                psmt= con.prepareStatement("insert into n_file(File_Name,User,file,status,size)"+"values(?,?,?,'false',?)");
                                psmt = con.prepareStatement("update n_file set file = ? , size = ? where u_id = ?");
//                                psmt.setString(1, fname);
//                                psmt.setString(2, user_id);

                                FileInputStream fis = new FileInputStream(save_enc_file);
                                psmt.setBinaryStream(1, (InputStream) fis, (int) (save_enc_file.length()));
 
                                psmt.setLong(2, vb);
                                psmt.setInt(3, u_id);
                                System.out.println(psmt);

                                int s = psmt.executeUpdate();    
                                
                                 int id1=0;
                                Statement st1=con.createStatement();
                                String sql = "select * from n_file";
                                 ResultSet rst1=st1.executeQuery(sql);
                            while(rst1.next())
                                 {
                                    
                                      id1 = rst1.getInt("u_id");
                                 }
                                
                                
                                 Statement stpri = con.createStatement();
                                    ResultSet rspri = stpri.executeQuery("select * from reg where userid = '"+user_id+"'");
                                    while(rspri.next()){
                                        pri = rspri.getString("privilege");
                                    }
                                         System.out.println("id : "+u_id+" key : "+b1+" privileges "+pri);
                                        PreparedStatement n_p=null ;
//                                        n_p = con.prepareStatement("insert into k_p(id,key1,privilege) values(?,?,?)");
                                        n_p = con.prepareStatement("update k_p set key1 = ? , privilege = ? where id = ?");
                                       
                                        n_p.setBytes(1, b1);
                                        n_p.setString(2, pri);
                                         n_p.setInt(3, u_id);
                                        int k = n_p.executeUpdate();
                                        System.out.println("n_p : "+n_p);   
                                        responce.sendRedirect("home.jsp");
 
                                   }
                            
                            }  
                            } catch (Exception e) { 
                                e.printStackTrace();
                                System.out.println(e.getMessage());
                            }
                        //}
                    }
    

            }

}