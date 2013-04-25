<%@ page import="java.sql.*"%>
<%
String name=(String)session.getAttribute("username");
String group = request.getParameter("group");
String friend = request.getParameter("friend");
//if(group==null)group="";
System.out.println("empty2");
if(friend==null)System.out.println("empty");
if(name==null)
response.sendRedirect("../Login.jsp");
Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql2=null;
  if(friend==null){
  friend="";
  sql2 = "select * from user_fav where UserName='"+name+"'"+"and Friends='"+friend+"'";
  }
  else{
  group = "";
  sql2 = "select * from user_fav where UserName='"+name+"'"+"and `Group`='"+group+"'";
  }
  String sql = "insert into user_fav (UserName,Friends,`Group`) values ('"+name+"','"+friend+"','"+group+"')";
  //String sql2 = "select * from user_fav where UserName='"+name+"' and Friends='"+friend+"' and `Group`='"+group+"'";
  try{
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  System.out.println("1");
  set = statement.executeQuery(sql2);
  System.out.println("2");
  if(!set.next()){
  System.out.println("3");
  statement.executeUpdate(sql);
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
<html>
<head>
<link rel="stylesheet" href="../css/main_style.css">
<script language="javascript">
function go()
{
 window.history.go(-1);
}
setTimeout("go()",1000);
</script>
</head>
<body>
<div class="main">
Add success
</div>
</body>
</html>