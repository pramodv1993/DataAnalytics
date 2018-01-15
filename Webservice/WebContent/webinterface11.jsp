<%@page import="org.apache.metamodel.schema.Column"%>
<%@page import="org.springframework.web.context.ServletContextAware"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.*" %>
     <%@page import="javax.servlet.*" %>
    <%@page import="org.apache.poi.ss.formula.functions.*"%>
     <%@page import="org.apache.metamodel.query.*"%>
     <%@page import="org.slf4j.impl.*"%>
     <%@page import="java.io.*"%>
 <%@page import="java.util.*"%>
  <%@page import="org.apache.metamodel.*"%>
 <%@page import="org.apache.metamodel.query.*"%>
 <%@page import="org.apache.metamodel.schema.*"%>
  <%@page import="org.apache.metamodel.data.*"%>
  <%@page import="java.lang.*"%>
  <%@page import="org.apache.*" %>
  <%@page import="javax.servlet.http.HttpServletRequest" %>
  <%@page import="org.apache.jasper.compiler.* "%>
  <%@page import="org.apache.jasper.servlet.*" %>


     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.container {
	width: 1052px;
	height: 1156px;
	background: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}
#apDiv1 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: 786px;
	top: 42px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load('visualization', '1.0', {'packages':['corechart']});
function drawChart( a2, b2, c2, d2, e2, f2,oth2) {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Location');
    data.addColumn('number', 'Jobs');
    data.addRows([
      ['Chennai', a2],
      ['Kolkata', b2],
      ['Pune', c2],
      ['Bangalore', d2],
      ['Delhi', e2],
      ['Mumbai', f2],
      ['Others', oth2]
    ]);

    // Set chart options
    var options = {'title':'Location Statistics',
    		 'is3D':true,
                   'width':900,
                   'height':600};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart'));
    chart.draw(data, options);
  }
</script>


<body bgcolor="#eeeeee">
<div class="container" style="background-image:url(BG_capture.JPG); background-repeat:no-repeat;"> 
  <div id="apDiv1"><img src="Logo_Picture.jpg" width="250" height="83.33" alt="Logo" /></div>
<%
int a=0,b=0,c=0,d=0,e=0,f=0,flag=0,oth=0,p=0;

ServletContext context = getServletContext(); 
File f1=new File(context.getRealPath("/WEB-INF/classes/s.tsv"));
DataContext a1=DataContextFactory.createCsvDataContext(f1);
Schema sh= a1.getDefaultSchema();
Table t=sh.getTableByName("s.tsv");

org.apache.metamodel.query.Query q=a1.query().from(t).selectAll().toQuery();
DataSet d1=a1.executeQuery(q);
String name[],name1[];


while(d1.next())
{
	flag=0;
	 Row r=d1.getRow();
	 String str=r.toString();
	 name=str.split("\t");
   if(name[4].contains("Chennai")){a++;flag=1;}	
   if(name[4].contains("Kolkata")){b++; flag=2;}
   if(name[4].contains("Pune")){c++; flag=3;}
   if(name[4].contains("Bengaluru / Bangalore")){d++; flag=4;}
   if(name[4].contains("Delhi")){e++; flag=5;}
   if(name[4].contains("Mumbai")){f++; flag=6;}
   if(flag==0){oth++;}
 
%>
	
	
<%}%>
<div id="chart" ></div> <script>drawChart(<%=a%>,<%=b%>,<%=c%>,<%=d%>,<%=e%>,<%=f%>,<%=oth%>)</script>

</body>
</html>
