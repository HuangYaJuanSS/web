<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.xml.bind.annotation.XmlAttribute"%>


<%@ page import="org.dom4j.Attribute"%>
<%@ page import="org.dom4j.Document"%>
<%@ page import="org.dom4j.DocumentException"%>
<%@ page import="org.dom4j.Element"%>
<%@ page import="org.dom4j.Node"%>
<%@ page import="org.dom4j.io.OutputFormat"%>
<%@ page import="org.dom4j.io.SAXReader"%>
<%@ page import="org.dom4j.io.XMLWriter"%>
<%@ page import="org.w3c.dom.Attr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html>
    <head>
           <title>111</title>
    </head>
    <body>
           <%
		   try{
                String strSelect=request.getParameter("select");
				 String change=request.getParameter("field1");
      		
         SAXReader saxReader = new SAXReader(); 				 
         Document document = saxReader.read(new File("E:\\websever\\apache-tomcat-8.5.12\\webapps\\superMarket\\xml\\market_information.xml")); 	 
               
		String xpath= "//"+strSelect;
         Node v=null;
         v=document.selectSingleNode(xpath); 
         if(v==null) {
        	 out.println("no existe!");
         }
         v.setText(change); 
         try {  
             /** ��document�е�����д���ļ��� */  
             XMLWriter writer = new XMLWriter(new FileWriter(new File("E:\\websever\\apache-tomcat-8.5.12\\webapps\\superMarket\\xml\\market_information.xml")));  
             writer.write(document);  
             writer.close();  
			out.println("<script>alert('�޸ĳɹ���');window.location.href='information.html';</script>");
         } catch (Exception ex) {  
             ex.printStackTrace();  
		}  
     } catch (Exception ex) {  
         ex.printStackTrace();  
     }  
          %>
    </body>
</html>