<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="com.lowagie.text.Element"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="java.awt.Color"%>
<%@page import="com.lowagie.text.Font"%>
<%@page import="com.lowagie.text.Chunk"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
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
  
            //String user_id = null;
         System.out.println("in download file");
            String username = request.getParameter("user");
            //if (username != null) {
             long start = System.currentTimeMillis();
            
                //user_id = (String) session.getAttribute("username");
             String user_id = null;
   if (session.getAttribute("username") != null) {
                user_id = (String) session.getAttribute("username");
                System.out.println("user :"+user_id);
                String ids=request.getParameter("u_id");
                System.out.println("ids :"+ids);
                int id=Integer.parseInt(ids);
                System.out.println("id :"+id);
                String file_name=request.getParameter("file");
                System.out.println("filename :"+file_name);
                ServletOutputStream output1 = response.getOutputStream();
//      
                String file=file_name;    //request.getParameter("file");
//          
                if(file_name.contains(".pdf"))
                {
                    file_name = "sample.txt";
                }
                 Connection con = null;

                            ServletContext sc = getServletContext();



                            Blob hash_data = null;
                            byte[] db_enc_data=null;
                            Class.forName("com.mysql.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
                            System.out.println("Connection established");
         Statement  stm = con.createStatement();
         String query = "select * from n_file where u_id ="+id+"";
         ResultSet res = stm.executeQuery(query);
    while(res.next())
               {
                   System.out.println("fghj");
                   String sq = "select * from k_p where id="+id+"";
                   Statement st01 = con.createStatement();
                   ResultSet rs01 = st01.executeQuery(sq);
                   while(rs01.next()){
                       System.out.println("qwerty");
                        hash_data=rs01.getBlob("key1");
                        System.out.println("hash_data:"+hash_data);
                       
                   }
                 db_enc_data = hash_data.getBytes(1,(int)hash_data.length());           
                               

                 System.out.println("db_enc_data"+db_enc_data);
                String instr11 = new String(db_enc_data, "UTF-8").trim();
                              System.out.println("instr::" + instr11);
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
                            System.out.println("text read :"+text);
                             AESFile ae = new AESFile();

                            ae.generateKey(db_enc_data, "AES");

                            //  System.out.println("ke:"+key);
                            
                            long end = System.currentTimeMillis();
                            long sum1 = end - start;
                            
                            String plainText = text;
                            String decryptedText = AESFile.decrypt(plainText);
                            System.out.println("decryptedText :"+decryptedText);
                            String dec_file = "D://dec_"+file_name;
                            PrintWriter writer = new PrintWriter(dec_file, "UTF-8");
                            writer.println(decryptedText);
                            writer.close();
                            
                            long end2 = System.currentTimeMillis();
                            long sum2 = end2 - end ; 
                            String asd = "update graph_d set down_time='"+sum1+"',dec_time='"+sum2+"' where id = 1";
                            Statement mt= con.createStatement();
                            int h = mt.executeUpdate(asd);
                            
                      
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
                
                
                
                
try {
			File fileq = new File("E://"+file);//"D://itext-test.pdf"
			FileOutputStream fileout = new FileOutputStream(fileq);
			Document document = new Document();
			PdfWriter.getInstance(document, fileout);
			document.addAuthor("Me");
			document.addTitle("My iText Test");

			document.open();

			Chunk chunk = new Chunk("iText Test");
			Font font = new Font(Font.COURIER);
			font.setStyle(Font.UNDERLINE);
			font.setStyle(Font.ITALIC);
			chunk.setFont(font);
			chunk.setBackground(Color.CYAN);
			document.add(chunk);

			Paragraph paragraph = new Paragraph();
			paragraph.add("Hello World");
                        paragraph.add(sb.toString());
                        paragraph.setAlignment(Element.ALIGN_CENTER);
			document.add(paragraph);



			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
                
                
                String cont=sb.toString();
                
                byte requestBytes[] = cont.getBytes();
ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
response.reset();
response.setContentType("application/pdf");
String ft=file;
response.setHeader("Content-disposition","attachment; filename="+ft);

 ServletContext ctx = getServletContext();

    OutputStream os = response.getOutputStream();
if(file.contains(".pdf")){
    File pdfFile = new File("D://"+file);
    byte[] pdfByteArray = FileUtils.readFileToByteArray(pdfFile);
    byte[] buf = new byte[1024];
int len;
int size=0;
while ((len = bis.read(buf)) > 0){
os.write(pdfByteArray);

size++;}
}
else{
byte[] buf = new byte[1024];
int len;
int size=0;
while ((len = bis.read(buf)) > 0){
os.write(buf);







size++;
}}
output1.flush();
output1.close();
response.sendRedirect("download.jsp");
         
         
        %>
            
            
            <% }

//            }%>
</html>
