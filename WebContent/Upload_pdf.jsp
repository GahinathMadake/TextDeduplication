

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%--<%@page import="org.cloudbus.cloudsim.examples.encryptData"%>--%>
<%@page import="control.encryptData"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.security.MessageDigest"%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  
        <center><h1></h1></center>
   <%!
     String paper_title="";	 
	 String category="";
	 String type="";
     String paper_keyword="";
	 String auth_name="";
	 int count1=0,count2=0,count3=0,count4=0,count5=0;
         File savedFile;
         String itemName;
         String extension;
 %>
 <%
  boolean isMultipart=false;
    String sss=null;

 try{
  System.out.println("first");
 isMultipart = ServletFileUpload.isMultipartContent(request);
 }
 catch(Exception r)
                 {
     r.printStackTrace();
 }
 if (!isMultipart) {
 } else {
   FileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
    System.out.println("first1");
   List items = null;
   try {
   items = upload.parseRequest(request);
   } catch (FileUploadException e) {
   e.printStackTrace();
   }
   Iterator itr = items.iterator();
   while (itr.hasNext()) 
	   {
   FileItem item = (FileItem) itr.next();
   if (item.isFormField())
	   {
	      String name = item.getFieldName();
		  String value = item.getString();
		  if(name.equals("file_title"))
	           {
			   paper_title=value;
                            System.out.println("first2");
            		 count1=1;
			   }
          	    
   } else
	   {
    try {
	
   itemName = item.getName();
   File fg=new File(itemName);
   extension=FilenameUtils.getExtension(itemName);
//   File savedFile = new File(config.getServletContext().getRealPath("/")+"emp_image\\image\\"+itemName);
   
   File f2=new File("D:\\PDF\\");
    if(!f2.isDirectory())
             {
           boolean success = (f2).mkdir();
     }   
   
     savedFile = new File("D:\\PDF\\"+itemName);
   
   item.write(savedFile);
   out.println(savedFile.getAbsolutePath());
   
    FileReader fr = new FileReader(savedFile);
                           BufferedReader brre = new BufferedReader(fr);
                           String  line =null;
                           String  line1 =null;
                           StringBuffer ssb = new StringBuffer();
                                                              
                           while((line=brre.readLine())!= null)
                             {
                              ssb.append(line) ;
                           }
                                 line1 = ssb.toString();    
                        
                        
    sss = session.getAttribute("emailid").toString();                   
    System.out.println("anvfgl b;lgrk ");
    byte[] encr=null;
                          try {
                               encryptData ed=new encryptData();
                                encr= ed.enData(line1,sss);
                                System.out.println(line1);
                                /////////encrypt data first
                              } catch (IOException ex) {
                               ex.printStackTrace(); //Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
                           } 
     System.out.println("encr"+encr);
                         ////////////////////////////save encrypted file
                         //  String path=System.getProperty("user.dir");
                           File pub = new File("D://serv");


                           if(!pub.isDirectory())
                           {
                               pub.mkdir();
                           }
                           FileOutputStream fos = new FileOutputStream("D://aa_encrypt.txt");
                           
                           //System.out.println("fos:"+pub+"\\"+sessionemail+"_encrypt.txt");
                           fos.write(encr);
                           fos.close();
//            
   
   
        
     %><table>
         <tr><td width="210"></td>
             <td> <img src=image/<%=itemName %> width="137"  height="140"></td></tr>
     </table>
     <table width="350">
   
   <% if(count1==1)
      		 out.println("<tr><td align='left'><b>Name:</td><td><b>"+paper_title);
	  if(count2==2)	 
		     out.println("</td><tr><td align='left'><b>Addresss:</td><td><b>"+paper_keyword);
	  if(count5==5)	 
		     out.println("</td><tr><td align='left'><b></td><td><b>"+auth_name);
	  if(count3==3)
		     out.println("</td><tr><td align='left'><b>Contact No</td><td><b>"+category);
   if(count4==4)
		     out.println("</td><tr><td align='left'><b>Contact No</td><td><b>"+category);
	  
   } catch (Exception e) {
   e.printStackTrace();
   }%>
    </td></tr></table>
         <%
   }
   }
    Connection con = null;
   try{
               
		Statement st = null;
		ServletContext sc = getServletContext();
		String url = sc.getInitParameter("url");
		String driver = sc.getInitParameter("driver");
		String password = sc.getInitParameter("password");
		String username = sc.getInitParameter("username");

                
                Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/cloud_deduplication";
                
		//Class.forName(driver);
		con = DriverManager.getConnection(connectionURL, "root", "");
		out.println("Connection established");

		st = con.createStatement();
        
      
        
        System.out.println("value of "+sss);
     ResultSet rs=null;
    PreparedStatement psmt=null;
    FileInputStream fis;
    out.println("dfgdfg");
//    iris_code ic=new iris_code();
//    String byte_image=ic.main(savedFile);
   System.out.println("dsfdfb");
psmt=con.prepareStatement("insert into data_file(file_title,file)"+"values(?,?)");
System.out.println(psmt);

psmt.setString(1,category);
fis=new FileInputStream(savedFile);
psmt.setBinaryStream(5, (InputStream)fis, (int)(savedFile.length()));
System.out.println(psmt);
int s = psmt.executeUpdate();

out.println("s:::"+s);

   }
   catch(Exception e)
             {
       e.printStackTrace();
   } finally{
   
       if (con != null) {
			con.close();
			System.out.println("Connection closed");
		}
   }
 

response.sendRedirect("homepage.jsp");
                
   }
   %>
    
	