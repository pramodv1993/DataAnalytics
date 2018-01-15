<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   <%@page import="org.jsoup.*" %>  
   <%@page import="org.jsoup.Connection.*" %>
 <%@page import="javax.servlet.http.HttpServletResponse" %>
   <%@page import="org.jsoup.select.*" %>
   <%@page import="org.jsoup.helper.*" %>

   <%@page import="org.jsoup.Jsoup" %>
   <%@page import="org.jsoup.nodes.Document" %>
   <%@page import="org.jsoup.nodes.Element"%>
     

<%String cname=(String)request.getParameter("companyname");
Connection c1=Jsoup.connect("https://in.search.yahoo.com/search?p="+ cname);

Document d=Jsoup.connect("https://in.search.yahoo.com/search?p=" + cname).get();
Elements e=d.select("li[class=first] a");
for(Element e1:e)
{
	String tname=e1.absUrl("href");
%>	
<script>window.location='<%=tname%>';</script>
<%} %>

