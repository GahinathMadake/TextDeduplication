<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Arrays"%>
<%@page import="control.FileUtil"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="control.AESFile"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String s_user = (String) session.getAttribute("username");
                    System.out.println("s_user"+s_user);
            String id = request.getParameter("id");
            String uid = id.replace("/", "");
            System.out.println("uid :"+uid);
            int u_id = Integer.parseInt(uid);
            String data = request.getParameter("data");
            System.out.println("uid :"+u_id+"data :"+data);
             Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
     String sql = "select * from k_p where id = "+u_id+"";
    System.out.println("sql :"+sql);
         ResultSet rs = st1.executeQuery(sql);
         Blob hash_data = null;
                   Statement st11 = con.createStatement();
      ResultSet rr1;
                 rr1 = st11.executeQuery("select * from reg where userid= '"+s_user+"'");
         String pri = "";
         while(rr1.next())
                            {
                                pri = rr1.getString("privilege");
                                System.out.println("privilege is : "+pri);
                            }
         byte[] db_enc_data=null;
         while(rs.next()){
             hash_data = rs.getBlob("key1");
             System.out.println("hash_data :"+hash_data);
         }
          db_enc_data = hash_data.getBytes(1,(int)hash_data.length());           
                String instr1 = new String(db_enc_data, "UTF-8").trim();
                              System.out.println("instr::" + instr1);
                              System.out.println(instr1+" == "+instr1);
                              //System.out.println(pri);
                              
                              
                              //char[] db_bg= instr1.toCharArray();                

                 System.out.println("db_enc_data"+db_enc_data);
         AESFile ae = new AESFile();
                            ae.generateKey(db_enc_data, "AES");
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
                             String decryptedText = AESFile.decrypt(filec);
                            System.out.println("decryptedText :"+decryptedText);
                             
                            
                            decryptedText = decryptedText+data;
                            System.out.println("decryptedText :"+decryptedText);
                            String path = "E:\\"+filename;
                             File savedFile = new File("E:\\"+filename);
                            FileWriter fw = new FileWriter(savedFile);
                                             fw.write(decryptedText);
                                             fw.close();
                                             FileUtil fu = new FileUtil();
                            byte[] b1 = fu.createChecksum(path, "MD5",pri,"");
                            System.out.println("b1 lenght" + b1.length);
                            System.out.println("b length" + b1.length);
                            System.out.println("b::" + b1);

                            String instr = new String(b1, "UTF-8").trim();
                            System.out.println("main instr::" + instr);
                            AESFile ae1 = new AESFile();
                            ae1.generateKey(b1, "AES");
                            String encryptedText = AESFile.encrypt(decryptedText);
                            byte[] bg = instr.getBytes();
                            System.out.println("bg length" + bg.length);
                            System.out.println("bg::" + bg);
                            char[] org_bg=instr.toCharArray();
                              int flag =0;
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
                              System.out.println(instr1+" == "+instr11);  
                              System.out.println("db_enc_data"+dbencdata);
         AESFile ae2 = new AESFile();
                            ae2.generateKey(dbencdata, "AES");
                              
                           String decryptedText_ck = AESFile.decrypt(encryptedText);
                            System.out.println("decryptedText check :"+decryptedText_ck);   
                              
                              
                              
                              
                              
                              
                              
                              
                              
                              
                                     Statement stmt =con.createStatement();
                            String chck_sql="select * from k_p";
                             int vb  = decryptedText.length();
                            ResultSet rst1=stmt.executeQuery(chck_sql);
                            while(rst1.next())
                            {
                                int ref_id=rst1.getInt("id");
                                hash_data=rst1.getBlob("key1");
                                String p = rst1.getString("privilege");
                                System.out.println("p=="+p);
                              byte[] db_enc_data1 = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data1);
                              
                              String instr2 = new String(db_enc_data1, "UTF-8").trim();
                              System.out.println("instr::" + instr2);
                              System.out.println(instr+" == "+instr2);
                              //System.out.println(pri);
                           
                             
                              char[] db_bg= instr1.toCharArray();
                               if(Arrays.equals(org_bg, db_bg))
                              {
                              
                              }else{
                                   
                                   flag ++;
                                   
                               }
                            }
                            if(flag == 1){
                                   
                                   Statement stc = con.createStatement();
                                   String strc = "select * from dedup_data where ref_ptr = "+u_id+"";
                                   ResultSet rsc = stc.executeQuery(strc);
                                   if(rsc.next()){
                                       String dedup_user = rsc.getString("userid");
                                       PreparedStatement psmt = null;
                          psmt= con.prepareStatement("insert into n_file(File_Name,User,file,status,size)"+"values(?,?,?,'false',?)");    
                          psmt.setString(1, filename);
                                psmt.setString(2, s_user);
                                psmt.setString(3, encryptedText);
//                                FileInputStream fis = new FileInputStream(savedFile);
//                                psmt.setBinaryStream(3, (InputStream) fis, (int) (savedFile.length()));
                                 psmt.setLong(4, vb);
                                System.out.println(psmt);
                                 int s = psmt.executeUpdate();
                                 int id1=0;
                                Statement st2=con.createStatement();
                                String sql2 = "select * from n_file";
                                 ResultSet rst2=st2.executeQuery(sql2);
                            while(rst2.next())
                                 {
                                    // System.out.println("start k_p");
                                      id1 = rst2.getInt("u_id");
                                 }
                                 PreparedStatement n_p=null ;
                                        n_p = con.prepareStatement("insert into k_p(id,key1,privilege) values(?,?,?)");
                                        n_p.setInt(1,id1);
                                        n_p.setBytes(2, b1);
                                        n_p.setString(3, pri);
                                        int k = n_p.executeUpdate();
                                        System.out.println(n_p);
                                        String upd = "update n_file set User = '"+dedup_user+"' where u_id = "+u_id+"";
                                        System.out.println("upd : "+upd);
                                        Statement stu = con.createStatement();
                                        int asd = stu.executeUpdate(upd);
                                        String del = "delete from dedup_data where ref_ptr = "+u_id+"";
                                       Statement stdel = con.createStatement();
                                       int delt = stdel.executeUpdate(del);
                                   }
                                   
         
                            }    
           
//                               }
//                      
//                            }   
                            
                             System.out.println("insertion completed");
                            response.sendRedirect("operation.jsp");
            %>
    </body>
</html>
