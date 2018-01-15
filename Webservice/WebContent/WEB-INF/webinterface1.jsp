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
<script>

</script>
<title>Using GET and POST Method to Read Form Data</title>
</head>
<body >

RESULT!!!!!
<%String text;String v[];
int flag=0;
 text=request.getParameter("param"); 
text=text.toUpperCase();

ServletContext context = getServletContext();




File f1=new File(context.getRealPath("/WEB-INF/classes/output.tsv"));

DataContext a=DataContextFactory.createCsvDataContext(f1);
Schema sh= a.getDefaultSchema();
Table t=sh.getTableByName("output.tsv");

org.apache.metamodel.query.Query q=a.query().from(t).selectAll().toQuery();
DataSet d1=a.executeQuery(q);


 while(d1.next())
 {
	 Row r=d1.getRow();
	
     String s1=r.toString();
     String s2=s1.toUpperCase();
     
     
     
      if(s2.contains(text)){
    	v=s2.split("\t");
    %>
    <%=v[1]+"-->"+v[2]%><br/>
    <%=v[3]+"-->"+v[4]%><br/>
    <%=v[5]+"-->"+v[6]%><br/>
    <%=v[7]+"-->"+v[8]%><br/>
     <%=v[9]+"-->"+v[10]%>sss
     <input type="button" value="view map">
   <br/>
    <br/>
    <br/>       
    <%}%>
          
      
<%flag=1;
 }
if(flag==0)
{
%>
<%="no match found" %>  
  
<% } %>
 

</body>


   
