<%@page import="control.SHA1"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Arrays"%>
<%@page import="control.FileUtil"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
           long ft1 = System.currentTimeMillis();
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

                           
              long ft2 = System.currentTimeMillis();
                       long sm = ft2 - ft1;      
                            String decryptedText1 = data;
                            int vb = decryptedText1.length();
                            System.out.println("decryptedText :"+decryptedText1);
                            String path = "E:\\"+filename;
                             File savedFile = new File("E:\\"+filename);
                            FileWriter fw = new FileWriter(savedFile);
                                             fw.write(decryptedText1);
                                             fw.close();
                            String fname = savedFile.getName();

                            FileReader file = new FileReader("E:\\"+filename);
                            
                              long ft3 = System.currentTimeMillis();
                            long sum1 = ft3 - ft2;
                              Statement mmt1 = con.createStatement();
                            String sr1 = "update modfy set upld='"+sm+"',encr='"+sum1+"' where id = '1'";
                             int jk1 = mmt1.executeUpdate(sr1);
                            
                             BufferedReader reader = new BufferedReader(file);
                            String text = "";
                            String line = reader.readLine();
                            while (line != null) {
                                text += line;
                                line = reader.readLine();
                              //  out.println("line");
                            }
                            
                            long dou = 0;
                            String str1 = "select * from graph_m";
                            Statement mmt = con.createStatement();
                            ResultSet srt = mmt.executeQuery(str1);
                            if(srt.next())
                            {
                                String ass = srt.getString("keygentym");
                               dou = Long.parseLong(ass); 
                            }
                            long tim_f = System.currentTimeMillis();
                            
                            reader.close();
                            System.out.println(text);
                              SHA1 sha1 = new SHA1();
                          
                          String sb = sha1.sha1(text);
                          
                                System.out.println("SHA1 : "+sb);
                            FileUtil fu = new FileUtil();
                            byte[] b1 = fu.createChecksum(path, "MD5","",sb);
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
                             long sec_t = System.currentTimeMillis();
                            long sumi = sec_t - tim_f ;
                            long e_su = dou+sumi;long sas =  e_su - sumi;
                            if(sas>100){sumi = sumi+99;}
                            String str2 = "UPDATE p_graph SET proposed_t='"+sumi+"',exist_t='"+e_su+"' WHERE id=1 ";
                            Statement mst = con.createStatement();
                            int jkl = mst.executeUpdate(str2);
                            
                             if(flag!=0)
                            {
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
                                psmt.setString(2, s_user);

                                FileInputStream fis = new FileInputStream(save_enc_file);
                                psmt.setBinaryStream(3, (InputStream) fis, (int) (save_enc_file.length()));
 
                                psmt.setLong(4, vb);
                                System.out.println(psmt);

                                int s = psmt.executeUpdate();
                                 int id1=0;
                                 String pri = null;
                                Statement st12=con.createStatement();
                                String sql2 = "select * from n_file";
                                 ResultSet rst1=st12.executeQuery(sql2);
                            while(rst1.next())
                                 {
                                    
                                      id1 = rst1.getInt("u_id");
                                 }
                                    Statement stpri = con.createStatement();
                                    ResultSet rspri = stpri.executeQuery("select * from reg where userid = '"+s_user+"'");
                                    while(rspri.next()){
                                        pri = rspri.getString("privilege");
                                    }
                                PreparedStatement n_p=null ;
                                        n_p = con.prepareStatement("insert into k_p(id,key1,privilege) values(?,?,?)");
                                        n_p.setInt(1,id1);
                                        n_p.setBytes(2, b1);
                                        n_p.setString(3, pri);
                                        int k = n_p.executeUpdate();
                                        System.out.println("n_p : "+n_p);
                             Statement stu = con.createStatement();
                                       
                                        String del = "delete from dedup_data where ref_ptr = "+u_id+"";
                                       Statement stdel = con.createStatement();
                                       int delt = stdel.executeUpdate(del);
                            }
                            response.sendRedirect("operation.jsp");
                            
            %>
    </body>
</html>