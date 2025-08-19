
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
          <%
             String driver="com.mysql.jdbc.Driver";
           String[] a=new String[10]; 
     String url="jdbc:mysql://localhost:3306/cloud_deduplication";
          double ant=0,honey=0;
         try{
           Class.forName(driver);
                Connection connection=  DriverManager.getConnection(url,"root","");
           
              
               
               Statement st;
               st=(Statement) connection.createStatement(); 
                System.out.println(" run 1");
                 String sql2="select * from n_file";
                 System.out.println("sql2->"+sql2);
                 ResultSet res=st.executeQuery(sql2);
                 int flag=0;
                 int n_file ;
                 while(res.next())
                      {
                       String size = res.getString("size");
                            a[flag] = size;
                            flag++;
                 }
                          
       }catch(Exception e){
         
         e.printStackTrace();
         }
          System.out.println("1->"+a[0]);
           System.out.println("2->"+a[1]);
System.out.println("3->"+a[2]);
 System.out.println("4->"+a[3]);
%>
          
          
        var data = google.visualization.arrayToDataTable([
          ['Incoherency Bound', ' Uploaded Files ', ' Deduplicated File ','',''],
          [' Time ',  <%=a[0]%>,      <%=a[1]%>,<%=a[2]%>, <%=a[3]%> ],
         
          
        ]);

        var options = {
          title: ' time estimation ',
          vAxis: {title: ' Request ',  titleTextStyle: {color: 'red'}},
           hAxis: {title: ' Responce time in miliseconds',  titleTextStyle: {color: 'red'}}
        };
  <%
         
 
 %>  
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
      <div id="chart_div" style="width: 900px; height: 500px;">
          
          
          
          
      </div>
  </body>
</html>