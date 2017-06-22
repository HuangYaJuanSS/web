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
           <title>666</title>
    </head>
    <body>
           <%
		   try{
			   String url="E:\\websever\\apache-tomcat-8.5.12\\webapps\\superMarket\\xml\\stock.xml";
                String name=request.getParameter("name_re");
         SAXReader saxReader = new SAXReader(); 				 
         Document doc = saxReader.read(new File(url)); 	 
         String xpath="//stock["+name+"]";
		 Node v=null;
         v=doc.selectSingleNode(xpath); 
		 doc.getRootElement().remove(v);
         try {  
             /** 将document中的内容写入文件中 */  
             XMLWriter writer = new XMLWriter(new FileWriter(new File(url)));  
             writer.write(doc);  
             writer.close();  
			out.println("<script>alert('操作成功！');window.location.href='stockOperator.html';</script>");
         } catch (Exception ex) {  
             ex.printStackTrace();  
		}  
     } catch (Exception ex) {  
         ex.printStackTrace();  
     }  
          %>
    </body>
</html>