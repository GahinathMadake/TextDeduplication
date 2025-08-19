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
import java.io.OutputStreamWriter;
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
import java.util.StringTokenizer;
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
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

    public static int startid;
    public static String ses1;
    public static String ses2;
    public static String servername;
    public static String saveFile1;
    public static long start;
    public static long stop;
    public static long encrypt;
    public static long key_gen;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {

        String user_id = "";
        HttpSession session = request.getSession();
        PrintWriter out = responce.getWriter();
        if (session.getAttribute("username") != null) {
            user_id = (String) session.getAttribute("username");
            start = System.currentTimeMillis();
            out.println("user_id" + user_id);
            RequestDispatcher rd = null;

            String id = "";
            String user = "";
            String privi = "";
            String pri="";
            int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            out.println("isMultipart" + isMultipart);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                    out.println("items" + items);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }

                try {

                    Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) { // for expernal data receive which we get from text or hoidden from jsp page
                            String namee = item.getFieldName();
                            String value = item.getString();
                            System.out.println("Namee "+namee+" : "+value);
                            pri=value;
                            if (namee.equals("user")) {
                                out.println("user" + user);
                                user = value;
                                count1 = 1;
                            } 
                            if (namee.equals("tag1")) {
                                out.println("privilege" + privi);
                                System.out.println("privilege" + privi);
                                privi = value; 
                                System.out.println("privilege" + privi);
                                count1 = 1;
                            }
                        } else { //this for getting file data from jsp page


                            String itemName = item.getName();
                            System.out.println("itemName" + itemName);
                            File savedFile = new File("D:\\"+itemName);//config.getServletContext().getRealPath("/")+"emp_image\\image\\"+itemName);
                            
                           
                            item.write(savedFile);
                            System.out.println("Data is : "+item);
                            String aw = item.toString() ;
                            StringTokenizer stk = new StringTokenizer(aw, ",");
                                    String fir = "";
                                    String sec = "";
                                    if(stk.hasMoreTokens())
                                    {
                                        fir = stk.nextToken();
                                        sec = stk.nextToken();
                                    }
                                    System.out.println("fir : "+fir+" Sec : "+sec);
                            String ext = FilenameUtils.getExtension(itemName);
                           
                            System.out.println("fname"+ext);
                            System.out.println("file extention :"+ext);
                            long vb = savedFile.length();
                            System.out.println("file size :"+vb);
                            
                            String str=itemName;
                            String file_witout_ext ="";
                            if (!str.contains(".")) 
                             {   
                                file_witout_ext=str;
                                System.out.println("File Name=" + str);
                             }   
                            else {
                                str = str.substring(0, str.lastIndexOf("."));
                                // Because extension is always after the last '.'
                                file_witout_ext=str;
                                System.out.println("File Name=" + str);
                            }

                             System.out.println("file_witout_ext" + file_witout_ext);
                            

                             if(itemName.contains(".pdf")){
                             PDDocument pd;
 BufferedWriter wr;
 try {
     itemName = "SampleText.txt";
         File input = new File(savedFile.getAbsolutePath());  // The PDF file from where you would like to extract
         File output = new File("D:\\SampleText.txt"); // The text file where you are going to store the extracted data
         pd = PDDocument.load(input);
         System.out.println(pd.getNumberOfPages());
         System.out.println(pd.isEncrypted());
//         pd.save("CopyOfInvoice.pdf"); // Creates a copy called "CopyOfInvoice.pdf"
         PDFTextStripper stripper = new PDFTextStripper();
         wr = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(output)));
         stripper.writeText(pd, wr);
         if (pd != null) {
             pd.close();
         }
        // I use close() to flush the stream.
        wr.close();
 } catch (Exception e){
         e.printStackTrace();
        }
                             
                             }
                            String fname = savedFile.getName();

                            FileReader file = new FileReader("D:\\"+itemName);

                            String path = "D:\\"+itemName;
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
 SHA2 sha2 = new SHA2();
                           try{ sha2.main1(text);}catch(Exception ee){}
                          String sb = sha2.sha2(text);
                          
                                System.out.println("SHA1 : "+sb);
                            FileUtil fu = new FileUtil();
                            byte[] b1 = fu.createChecksum(path, "MD5",pri,sb);
                            System.out.println("b1 lenght" + b1.length);
                            System.out.println("b length" + b1.length);
                            System.out.println("File Token ::" + b1);

                            String instr = new String(b1, "UTF-8").trim();
                            System.out.println("main instr::" + instr);

                            byte[] bg = instr.getBytes();
                            System.out.println("bg length" + bg.length);
                            System.out.println("bg::" + bg);
                            char[] org_bg=instr.toCharArray();
                            key_gen = System.currentTimeMillis();
                            key_gen = key_gen - start;
                            System.out.println("key_gen : "+key_gen);
                             Connection con = null;
                            try {
                              ServletContext sc = getServletContext();
                                Class.forName("com.mysql.jdbc.Driver");
                                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
                                System.out.println("Connection established");
                            
                                
                                Blob hash_data;
                                
                                int flag=0;
                            /////////////////check deduplication
                            
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
                              if(Arrays.equals(org_bg, db_bg) && p.equals(pri))
                              {
                                  System.out.println("in if");
                                  Statement dedup_stmt=con.createStatement();
                                  String query="insert into dedup_data(ref_ptr,userid,filename,privilege,size) values("+ref_id+",'"+user_id+"','"+fname+"','"+privi+"','"+vb+"')";
                                  int inst=dedup_stmt.executeUpdate(query);
                                  flag=1;
//                                  request.setAttribute("msg", "File is Already Exist....");
//                                    System.out.println("deduplication");

//                                    RequestDispatcher rd1 = request.getRequestDispatcher("uploadfile1.jsp");
//                                  rd1.include(request, responce);
                                  //responce.sendRedirect("uploadfile1.jsp");
                                  responce.sendRedirect("uploadfile.jsp?alredy=upload");
//                                  out.println("alert('File is Already Exist...')");
//                                  responce.sendRedirect("uploadfile.jsp");
//                                  
//                                     request.setAttribute("msg", "Registration Successfully");
//                                    System.out.println("sessionqq");
//
//  RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
//                                  rd1.include(request, responce);
                
                                  
                              }
                              
                            }     
                            
                            
                            
                            if(flag==0)
                            {
                                
                                System.out.println("in else");
                            ///////////////////////////////////
                            AESFile ae = new AESFile();

                            ae.generateKey(b1, "AES");
                            

                            //  System.out.println("ke:"+key);
                            String plainText = text; 
                            System.out.println("plain : "+plainText);
                           
                          
                            String encryptedText = AESFile.encrypt(plainText);
                            encrypt = System.currentTimeMillis();
                            encrypt = encrypt - start;
                                System.out.println("encrypt : "+encrypt);
                            //  String decryptedText = AESFile.decrypt(encryptedText);

//                            System.out.println("Plain Text : " + plainText);
//                            System.out.println("Encrypted Text : " + encryptedText);
                            //  System.out.println("Decrypted Text : " + decryptedText);

                         //   File fs=new File("")
                            
                            String enc_file = "D:\\"+file_witout_ext+"."+".txt";
                            ///////////write encrypted file

                            PrintWriter writer = new PrintWriter(enc_file, "UTF-8");
                            writer.println(encryptedText);
                            writer.close();


                           

                                Statement st = null;
                              

                                File save_enc_file = new File(enc_file);


                                PreparedStatement psmt = null;
                               // PreparedStatement psmt1 = null;
                                //psmt1 = con.prepareStatement("insert into file(userid,filename,secrete_key,file,privilege)" + "values(?,?,?,?,?)");
                                
                                psmt= con.prepareStatement("insert into n_file(File_Name,User,file,status,size)"+"values(?,?,?,'false',?)");
                              // psmt1.setString(1, fname);
                              // psmt1.setString(2, user_id);
                                //System.out.println(psmt);
                                psmt.setString(1, fname);
                                psmt.setString(2, user_id);
//                                psmt.setBytes(3, b1);
                                FileInputStream fis = new FileInputStream(save_enc_file);
                                psmt.setBinaryStream(3, (InputStream) fis, (int) (save_enc_file.length()));
                                //psmt1.setBinaryStream(3,(InputStream) fis, (int) (save_enc_file.length()) );
//                                psmt.setString(5, privi); 
                                psmt.setLong(4, vb);
                                System.out.println(psmt);
                               // System.out.println(psmt1);
                                //int p = psmt1.executeUpdate();
                                int s = psmt.executeUpdate();
//                                psmt1.setString(1,user_id);
//                                psmt1.setString(2 , fname);
//                                psmt1.setBytes(3, b1);
//                                psmt1.setBinaryStream(4, (InputStream) fis, (int) (save_enc_file.length()));
//                                psmt1.setString(4, pri);
//                                int fg = psmt1.executeUpdate();
                                st = con.createStatement();
                                
                                int id1=0;
                                Statement st1=con.createStatement();
                                String sql = "select * from n_file";
                                 ResultSet rst1=st1.executeQuery(sql);
                            while(rst1.next())
                                 {
                                    // System.out.println("start k_p");
                                      id1 = rst1.getInt("u_id");
                                 }
                                         //System.out.println("g"+g);
                                         System.out.println("id : "+id1+" key : "+b1+" privileges "+pri);
                                        PreparedStatement n_p=null ;
                                        n_p = con.prepareStatement("insert into k_p(id,key1,privilege) values(?,?,?)");
                                        n_p.setInt(1,id1);
                                        n_p.setBytes(2, b1);
                                        n_p.setString(3, pri);
//                                        n_p.setString(4, sb);
                                        int k = n_p.executeUpdate();
                                        System.out.println(n_p);
                                        stop = System.currentTimeMillis();
                                        stop = stop-start;
                                        System.out.println("stop : "+stop);
                                       String graph = "update graph_m set uploadtym = '"+stop+"' , encrypttym = '"+encrypt+"' , keygentym = '"+key_gen+"' where id  = 1";
                                        Statement stg = con.createStatement();
                                        System.out.println("graph : "+graph);
                                        int grp = stg.executeUpdate(graph);
                                        
                                        responce.sendRedirect("uploadfile.jsp?uplaod=done");
                                    
                             }  
                            } catch (Exception e) { 
                                e.printStackTrace();
                                System.out.println(e.getMessage());
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
            }
        }
// rd.forward(request, responce);
    }
}