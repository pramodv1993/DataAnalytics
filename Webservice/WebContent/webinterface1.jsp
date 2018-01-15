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
     
     
<!DOCTYPE html 
PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#myButton {
	-moz-box-shadow: 1px 10px 11px -3px #bee2f9;
	-webkit-box-shadow: 1px 10px 11px -3px #bee2f9;
	box-shadow: 1px 10px 11px -3px #bee2f9;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #63b8ee), color-stop(1, #468ccf));
	background:-moz-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-webkit-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-o-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-ms-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:linear-gradient(to bottom, #63b8ee 5%, #468ccf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee', endColorstr='#468ccf',GradientType=0);
	background-color:#63b8ee;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	border:2px solid #3866a3;
	display:inline-block;
	cursor:pointer;
	color:#14396a;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:10px 40px;
	text-decoration:none;
}
#myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #63b8ee));
	background:-moz-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-webkit-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-o-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-ms-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:linear-gradient(to bottom, #468ccf 5%, #63b8ee 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#63b8ee',GradientType=0);
	background-color:#468ccf;
}
#myButton:active {
	position:relative;
	top:1px;
}


#myButton1 {
	-moz-box-shadow: 1px 10px 11px -3px #bee2f9;
	-webkit-box-shadow: 1px 10px 11px -3px #bee2f9;
	box-shadow: 1px 10px 11px -3px #bee2f9;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #63b8ee), color-stop(1, #468ccf));
	background:-moz-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-webkit-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-o-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:-ms-linear-gradient(top, #63b8ee 5%, #468ccf 100%);
	background:linear-gradient(to bottom, #63b8ee 5%, #468ccf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee', endColorstr='#468ccf',GradientType=0);
	background-color:#63b8ee;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	border:2px solid #3866a3;
	display:inline-block;
	cursor:pointer;
	color:#14396a;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:10px 10px;
	text-decoration:none;
}
#myButton1:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #63b8ee));
	background:-moz-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-webkit-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-o-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:-ms-linear-gradient(top, #468ccf 5%, #63b8ee 100%);
	background:linear-gradient(to bottom, #468ccf 5%, #63b8ee 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#63b8ee',GradientType=0);
	background-color:#468ccf;
}
#myButton1:active {
	position:relative;
	top:1px;
	right:15px;
}


.loc {
	-moz-box-shadow:inset 0px 1px 15px 0px #54a3f7;
	-webkit-box-shadow:inset 0px 1px 15px 0px #54a3f7;
	box-shadow:inset 0px 1px 15px 0px #54a3f7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #007dc1), color-stop(1, #0061a7));
	background:-moz-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-webkit-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-o-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-ms-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#007dc1', endColorstr='#0061a7',GradientType=0);
	background-color:#007dc1;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #801616;
}
.loc:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
	background:-moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
	background-color:#0061a7;
}
.loc:active {
	position:relative;
	top:1px;
}

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
<title>Using GET and POST Method to Read Form Data</title>
<script language="javascript">
function redirect(add,add1)
{
  window.location = "http://www.google.com/maps/place/"+add+","+add1+"/";
}
</script>


</head>
<body bgcolor="#eeeeee">
<div class="container" style="background-image:url(BG_capture.JPG); background-repeat:no-repeat;"> 
  <div id="apDiv1"><img src="Logo_Picture.jpg" width="250" height="83.33" alt="Logo" /></div>
RESULTS<br><hr>
<%String text;String v[];
int flag=0;
 text=request.getParameter("param"); 
text=text.toUpperCase();

ServletContext context = getServletContext();




File f1=new File(context.getRealPath("/WEB-INF/classes/s.tsv"));

DataContext a=DataContextFactory.createCsvDataContext(f1);
Schema sh= a.getDefaultSchema();
Table t=sh.getTableByName("s.tsv");

org.apache.metamodel.query.Query q=a.query().from(t).selectAll().toQuery();
DataSet d1=a.executeQuery(q);
%>
<form method="post" action="webinterface11.jsp"><input type="submit" class="loc" value="view locations with maximum jobs">

</form>
<form method="post" action="webinterface111.jsp"><input type="submit" class="loc" value="view current trends">

</form>

<%  while(d1.next())
 {  
	 Row r1=d1.getRow();
	
     String s1=r1.toString();
     String s2=s1.toUpperCase();
    
     
     
      if(s2.matches(".*\\b"+text+"\\b.*")){
    	v=s2.split("\t");%>
    
   <b> <%=v[1]+" : "+v[2]%></b><br/><br/>
    <%=v[3]+" : "+v[4]%><br/><br/>
    <%=v[5]+"  :"+v[6]%><br/><br/>
    <%=v[7]+" : "+v[8]%><br/><br/>
     <%=v[9]+" : "+v[10]%><br><br/>
    <input id="myButton" type="submit" value="view map" onClick="redirect('<%=v[2]%>,<%=v[4]%>')" >
    <form method="post" action="company.jsp">
     <input type="hidden" name="companyname" value='<%=v[2]%>'/>
    <input id="myButton1" type="submit" value="visit company website"  ></form>
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


   
