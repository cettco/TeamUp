<%@ page import="java.sql.*" %>
<%
  String name = (String)session.getAttribute("username");
  String type = (String)request.getParameter("type");
  String topic = (String)request.getParameter("topic");
  String time = (String)request.getParameter("time");
  String location = (String)request.getParameter("location");
  String mygroup = (String)request.getParameter("group");
  String introduction = (String)request.getParameter("introduction");
  Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  //String sql2 = "insert into team_info (UserName,Password,Sex,Email,Image) values ('"+name+"','"+password+"','"+sex+"','"+email+"','"+image+"')";
  String sql = "insert into team_info (UserName,Type,Topic,Time,Location,`Group`,Introduction) values ('"+name+"','"+type+"','"+topic+"','"+time+"','"+location+"','"+mygroup+"','"+introduction+"')";
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
   response.sendRedirect("../func/myTeam.jsp");
%>