<%@ page import="java.sql.*"%>
<%
  String re_author = (String)session.getAttribute("username");
  String author = request.getParameter("author");
  String re_content=request.getParameter("re_content");
  String title = request.getParameter("topic");
  // String pwd = request.getParameter("pwd");
  Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  ResultSet rs = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql = "insert into re_topic (UserName,Title,Re_content,Re_author) values ('"+author+"','"+title+"','"+re_content+"','"+re_author+"')";
  try{
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  statement.executeUpdate(sql);
   
   }
   catch(Exception e){
   e.printStackTrace();
   }
   finally{
   if(set!=null)
   {
   try{
   set.close();
   }
   catch(Exception e){
   e.printStackTrace();
   }
   }
   if(statement!=null)
   {
   try{
   statement.close();
   }
   catch(Exception e){
   e.printStackTrace();
   }
   }
   if(conn!=null)
   {
   try{
   conn.close();
   }
   catch(Exception e){
   e.printStackTrace();
   }
   }
   }
   response.sendRedirect("../func/main.jsp");
   
%>
<html>
</html>