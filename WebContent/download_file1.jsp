
<%@page import="java.io.PrintWriter"%>
<%@page import="control.AESFile"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.decryptData"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="control.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%--<%@page import="cpabe.Decrypt_file"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
    </body>
     <% 
  
            String user_id = request.getParameter("username");
            if (user_id!= null) {
                user_id = (String) session.getAttribute("username");

        
                String ids=request.getParameter("id");
                int id=Integer.parseInt(ids);
                String file_name=request.getParameter("file");
           
                ServletOutputStream output1 = response.getOutputStream();
//      
                String file=file_name;    //request.getParameter("file");
//          
                 Connection con = null;

                            ServletContext sc = getServletContext();
                            String url = sc.getInitParameter("url");
                            String driver = sc.getInitParameter("driver");
                            String password = sc.getInitParameter("password");
                            String username = sc.getInitParameter("username");
                            Blob hash_data;
                            byte[] db_enc_data=null;
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, username, password);
                            System.out.println("Connection established");
         Statement  stm = con.createStatement();
         String query = "select * from file where id="+id+"";
         ResultSet res = stm.executeQuery(query);
    while(res.next())
               {
         hash_data=res.getBlob("secrete_key");
                                
                               db_enc_data = hash_data.getBytes(1,(int)hash_data.length());
                              System.out.println("db_enc_data"+db_enc_data);
          FileOutputStream fos11 = new FileOutputStream("D://enc_"+file_name);
         byte[] array1 = new byte[1];
        byte[] buffer = new byte[1];
        InputStream is = res.getBinaryStream("file");
        
         while (is.read(buffer) > 0) {
        fos11.write(buffer);
      }
      fos11.close();
         
              }
         
         
        System.out.println("dfhfgb");
      
             String decrypted_str =null;
             
             
             ///////////////////decrypt file
              FileReader f = new FileReader("D://enc_"+file_name);

                           
                            BufferedReader reader = new BufferedReader(f);
                            String text = "";
                            String line = reader.readLine();
                            while (line != null) {
                                text += line;
                                line = reader.readLine();
                              //  out.println("line");
                            }
                            reader.close();
                            
                             AESFile ae = new AESFile();

                            ae.generateKey(db_enc_data, "AES");

                            //  System.out.println("ke:"+key);
                            String plainText = text;
                            String decryptedText = AESFile.decrypt(plainText);
                            
                            String dec_file = "D://dec_"+file_name;
                            PrintWriter writer = new PrintWriter(dec_file, "UTF-8");
                            writer.println(decryptedText);
                            writer.close();

                       
                        String decfile = "D://dec_"+file_name;
         StringBuffer sb = new StringBuffer();
         BufferedReader br = null;    
         
         
         
         
         
         
         
         
         
         
 
		try {
 
			String sCurrentLine;
 
			br = new BufferedReader(new FileReader(decfile));
 
			while ((sCurrentLine = br.readLine()) != null) {
				//System.out.println(sCurrentLine);
                            sb.append(sCurrentLine);
			}
 
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
                
                
                String cont=sb.toString();
                
                byte requestBytes[] = cont.getBytes();
ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
response.reset();
response.setContentType("application/text");
String ft=file;
response.setHeader("Content-disposition","attachment; filename="+ft);
byte[] buf = new byte[1024];
int len;
int size=0;
while ((len = bis.read(buf)) > 0){
output1.write(buf, 0, len);
size++;
}
output1.flush();
output1.close();
response.sendRedirect("user.jsp");
         
         
        %>
            
            
            <% }else {
                
               //                response.sendRedirect("index.jsp");
                response.sendRedirect("user.jsp");
                
            }%>
</html>

