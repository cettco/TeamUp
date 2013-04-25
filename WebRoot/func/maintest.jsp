<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="../css/main_style.css">
		<script type="text/javascript" src="../js/func.js"></script>
	</head>
	<body>
		<div class="main">
			<div class="head">
			    <img src="../img/teamup.png">
			</div>
			<div class="leftcol">
				<div class="head_img">
				<img src="../img/head/<%=session.getAttribute("image") %>">
				</div>
				<div class="person">
				<%
				if(session.getAttribute("username")==null)
				{
				response.sendRedirect("../Login.jsp");
				}
				%>
					<a href="edit.jsp"><%=session.getAttribute("username") %></a>
				</div>
				<div class="menu">
				<table>
					<tr>
						<td><a href="main.jsp">New Things</a></td>
					</tr>
					<tr>
						<td><a href="myTeam.jsp">My Team</a></td>
					</tr>
					<tr>
						<td><a href="createTeam.jsp">Create Team</a></td>
					</tr>
                    <tr>
						<td><a href="friends.jsp">My Friend</a></td>
					</tr>
                    <tr>
						<td><a href="ownTeam.jsp">My Own Team</a></td>
					</tr>
					<tr>
						<td><a href=""></a></td>
					</tr>
				</table>
			    </div>
			</div>
			<div class="content">
				<div class="nav">
					<div class="search">
						<form method="post" action="search.jsp">
							<input type="text" name="search">
							<input type="submit" value="Search">
						</form>
					</div>
					<div class="bar">
						<ul>
							 <li><a href="other.jsp">Others</a></li>
							<li><a href="showGroupDetail.jsp?which=Academic">Academic</a></li>
							<li><a href="showGroupDetail.jsp?which=Sports">Sports</a></li>
							<li><a href="showGroupDetail.jsp?which=Entertain">Entertain</a></li>
						</ul>
					</div>
					<div class="join">
					<button onclick="addGroup('academic')"><img src="../img/addgroup.png"/></button>
					<button onclick="addGroup('sports')"><img src="../img/addgroup.png"/></button>
					<button onclick="addGroup('entertain')"><img src="../img/addgroup.png"/></button>
					</div>
				</div>
				<div class="detail">
					<%
					String name = (String)session.getAttribute("username");
  // String pwd = request.getParameter("pwd");
  Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  ResultSet rs = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql = "select * from user_fav where UserName='"+name+"'";
  String sql2 ="select team_info.Type,team_info.Topic,team_info.UserName,team_info.Introduction from team_info ,user_fav where user_fav.UserName='"+name+"' and user_fav.`Group` = team_info.Type";
  //String sql2= "select team_info.UserName,team_info.Type,team_info.Topic,team_info.Time,team_info.Location,team_info.`Group`,team_info.Introduction from user_fav,team_info where user_fav.UserName=team_info.UserName and user_fav.`Group`=team_info.Type";
  try{
	  System.out.println("first1");
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  set = statement.executeQuery(sql2);
  System.out.println("first");
  while(set.next())
  {
	  String group=set.getString("Type");
	  String topic = set.getString("Topic");
	  String author = set.getString("UserName");
	  String content = set.getString("Introduction");
	  %>
      <hr>
      <h3>活动类别：<%=group%></h3>
	  <hr>
	  <h3><a href="detail.jsp?author=<%=author%>&topic=<%=topic%>&group=<%=group%>"><%=topic %></a></h3><br>
	  <hr>
	  <article>
	  <%=content %>
	  </article>
      <%
  
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
    if(rs!=null)
   {
   try{
   rs.close();
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
				</div>
			</div>
		</div>
	</body>
</html>
