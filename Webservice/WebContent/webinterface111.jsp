<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.apache.metamodel.schema.Column"%>
<%@page import="org.springframework.web.context.ServletContextAware"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Enumeration"%>

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

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load('visualization', '1.0', {'packages':['corechart']});
function drawChart( htmlandcss,java,python,csharp,oth,sql) {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'req');
    data.addColumn('number', 'trend');
    data.addRows([
      ['htmlandcss', htmlandcss],
      ['java', java],
      ['Python', python],
      ['Csharp', csharp],
      ['sql', sql],
      ['Others', oth],
    
    ]);

    // Set chart options
    var options = {'title':'Trend Statistics',
    		 'is3D':true,
                   'width':900,
                   'height':600};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.BarChart(document.getElementById('chart'));
    chart.draw(data, options);
  }
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


ServletContext context = getServletContext(); 
File f1=new File(context.getRealPath("/WEB-INF/classes/s.tsv"));
DataContext a1=DataContextFactory.createCsvDataContext(f1);
Schema sh= a1.getDefaultSchema();
Table t=sh.getTableByName("s.tsv");

org.apache.metamodel.query.Query q=a1.query().from(t).selectAll().toQuery();
DataSet d1=a1.executeQuery(q);
String str9[],name1[];

int flag,c=0,htmlandcss=0,php=0,java=0,javascript=0,csharp=0,bigdata=0,hr=0,cplus=0,python=0,ruby=0,test=0,sql=0,perl=0;
while(d1.next())
{
	flag=0;
	 Row r=d1.getRow();
	 String str1=r.toString().toLowerCase();
	
	  name1=str1.split("\t");
	 String str=name1[8];
	 
	 

	if(str.contains("html")||str.contains("web")||str.contains("ajax")||str.contains("xhtml")||str.contains("rest")||str.contains("xml")||str.contains("css"))htmlandcss++;
	
	if(str.contains("php")||str.contains("drupal")||str.contains("lamp"))php++;
	if(str.contains("perl"))perl++;
	if(str.contains("java")||str.contains("jquery")||str.contains("android")||str.contains("j2ee"))java++;
	if(str.contains("javascript")||str.contains("json")||str.contains("angular"))javascript++;
	if(str.contains("c#")||str.contains("chsarp")||str.contains(".net")||str.contains("dot net")||str.contains(". net"))csharp++;
	if(str.contains("big data")||str.contains("hadoop")||str.contains("data scientist")||str.contains("bigdata")||str.contains("hbase")||str.contains("mongo")||str.contains("mongodb"))bigdata++;
	if(str.contains("recruiter")||str.contains(" hr executive "))hr++;
	
	if(str.contains("python"))python++;
	if(str.contains(" c "))c++;

	if(str.contains("test"))test++;
	if(str.contains("sql")||str.contains("mysql"))sql++;
	
%>

<%} %>
	

<div id="chart" > <script>drawChart(<%=htmlandcss%>,<%=java%>,<%=python%>,<%=csharp%>,<%=perl+hr+ruby+c+cplus+bigdata%>,<%=sql%>)</script>
</div>
</body>
</html>