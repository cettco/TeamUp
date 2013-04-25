<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="entity.*,java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("fullname");
	String pwd = request.getParameter("pwd");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	String image=request.getParameter("radio");
	int flag;
	Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql1 = "select * from user_info where UserName='"+name+"'";
  try{
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  set = statement.executeQuery(sql1); 
   if(set.next()){
   response.sendRedirect("../regError.html");
   }
   else{
   String sql2 = "insert into user_info (UserName,Password,Sex,Email,Image) values ('"+name+"','"+pwd+"','"+sex+"','"+email+"','"+image+"')";
   statement.executeUpdate(sql2);
   response.sendRedirect("../Login.jsp");
   }
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
%>