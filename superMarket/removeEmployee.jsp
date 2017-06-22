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
           <title>444</title>
    </head>
    <body>
           <%
		   try{
			   String url="E:\\websever\\apache-tomcat-8.5.12\\webapps\\superMarket\\xml\\employee.xml";
               String name=request.getParameter("remove_name");
         SAXReader saxReader = new SAXReader(); 				 
         Document doc = saxReader.read(new File(url)); 	 
         String xpath="//name[text()=\'"+name+"\']";
		 Node v=null;
         v=doc.selectSingleNode(xpath); 
          if(v==null) {
        	out.println("alert('no existe!');");
         }
         doc.getRootElement().remove(v.getParent());
		 
         try {  
             /** 将document中的内容写入文件中 */  
             XMLWriter writer = new XMLWriter(new FileWriter(new File(url)));  
             writer.write(doc);  
             writer.close();  
			out.println("<script>alert('删除成功！');window.location.href='employee_ad.html';</script>");
         } catch (Exception ex) {  
             ex.printStackTrace();  
		}  
     } catch (Exception ex) {  
         ex.printStackTrace();  
     }  
          %>
    </body>
</html>