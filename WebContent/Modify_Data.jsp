<%@page import="control.SHA1"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="control.AESFile"%>
<%@page import="control.FileUtil"%>
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
          Statement st11 = con.createStatement();
      ResultSet rr;
                 rr = st11.executeQuery("select * from reg where userid= '"+s_user+"'");
         String pri = "";
         while(rr.next())
                            {
                                pri = rr.getString("privilege");
                                System.out.println("privilege is : "+pri);
                            }
         Blob hash_data = null;
         byte[] db_enc_data=null;
         while(rs.next()){
             hash_data = rs.getBlob("key1");
             System.out.println("hash_data :"+hash_data);
         }
          db_enc_data = hash_data.getBytes(1,(int)hash_data.length());           
                               

                 System.out.println("db_enc_data"+db_enc_data);
         AESFile ae = new AESFile();
                            ae.generateKey(db_enc_data, "AES");
                            String sf = "select * from n_file where u_id = "+u_id+"";
                            Statement ss = con.createStatement();
                            String filec = null;
                            String filename = null;
                            ResultSet rr1 = ss.executeQuery(sf);
                            while(rr1.next()){
                                filec = rr1.getString("file");
                                System.out.println("prev :"+filec);
                                
                                filename = rr1.getString("File_Name");
                                System.out.println("filename :"+filename);
                                
                            }
                             String decryptedText = AESFile.decrypt(filec);
                            System.out.println("decryptedText :"+decryptedText);
                            
                            
//                            decryptedText = decryptedText+data;
//                            System.out.println("decryptedText :"+decryptedText);
                            
                            String path = "E:\\"+filename;
                             File savedFile = new File("E:\\"+filename);
                            FileWriter fw = new FileWriter(savedFile);
                                             fw.write(data);
                                             fw.close();

                            
                            
                             FileUtil fu = new FileUtil();
                               SHA1 sha1 = new SHA1();
                          
                          String sb = sha1.sha1(data);
                          
                                System.out.println("SHA1 : "+sb);
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
                            
                            
                            //////////check deduplication
                            int flag =0;
                                                        Statement stmt =con.createStatement();
                            String chck_sql="select * from k_p";
                            ResultSet rst1=stmt.executeQuery(chck_sql);
                            while(rst1.next())
                            {
                                int ref_id=rst1.getInt("id");
                                hash_data=rst1.getBlob("key1");
                                String p = rst1.getString("privilege");
                                System.out.println("p=="+p);
                              byte[] db_enc_data1 = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data1);
                              
                              String instr1 = new String(db_enc_data1, "UTF-8").trim();
                              System.out.println("instr::" + instr1);
                              System.out.println(instr+" == "+instr1);
                              //System.out.println(pri);
                              
                              
                              char[] db_bg= instr1.toCharArray();
                              if(Arrays.equals(org_bg, db_bg))
                              {
                                  flag = 1;
                                  System.out.println("in if");
                                  Statement dedup_stmt=con.createStatement();
                                  String query="insert into dedup_data(ref_ptr,userid,filename,privilege) values("+ref_id+",'"+s_user+"','"+filename+"','"+pri+"')";
                                  int inst=dedup_stmt.executeUpdate(query);
                                 System.out.println("deduplication is performed");
                                 %>
                                 <script>
                                     
                                     alter("File is Deduplicated");
                                     
                                     
                                 </script>    
                                 <%
                                response.sendRedirect("operation.jsp");
               
                              }
                            
                            }
                            
                            if(flag == 0){
                            String encryptedText = AESFile.encrypt(data);
                            System.out.println("encryptedText :"+encryptedText);

                            Statement st2 = con.createStatement();
                            String kl = "update n_file set file = '"+encryptedText+"',User = '"+s_user+"' where u_id = "+u_id+"";
                            System.out.println("kl :"+kl);
                            int sd = st2.executeUpdate(kl);
                            Statement st3 = con.createStatement();
                            String k1 = "update k_p set key1 = '"+b1+"' where id = "+u_id+"";
                            System.out.println("k1 :"+k1);
                            int xz = st3.executeUpdate(k1);
                            
                            
                            
                            
                            System.out.println("insertion completed");
                            response.sendRedirect("operation.jsp");
                            }
            %>
    </body>
</html>
