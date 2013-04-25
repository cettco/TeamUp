<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
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
				<a href="person_edit.jsp"><img src="../img/head/<%=session.getAttribute("image") %>"></a>
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
							<input type="submit">
						</form>
					</div>
					<div class="bar">
						<ul>
							 <li><a href="other.jsp">Others</a></li>
							<li><a href="howGroupDetail.jsp?which=Academic">Academic</a></li>
							<li><a href="showGroupDetail.jsp?which=Sports">Sports</a></li>
							<li><a href="showGroupDetail.jsp?which=Entertain">Entertain</a></li>
						</ul>
					</div>
				</div>
				<div class="detail">
    <%
    if(session.getAttribute("username")==null)
				{
				response.sendRedirect("../Login.jsp");
				}
		String author= (String)request.getParameter("author");
		String topic= (String)request.getParameter("topic");
		String group= (String)request.getParameter("group");
		 Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql = "select * from team_info where UserName='"+author+"'and Topic='"+topic+"'and Type='"+group+"'";
  System.out.println(author+topic+group);
  try{
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  set = statement.executeQuery(sql);
  System.out.println("test1");
   while(set.next())
   {
   System.out.println("test2");
   String content = set.getString("Introduction");
   %>
   <hr>
   <h3><%=group %></h3>
   <hr>
   
   <article>
   <h2><%=topic %></a></h2><br>
   <aside><strong>Owner: </strong><%=author %><button onclick="addFriend(author)"><img src="../img/addfriend.png"/></button></aside>
   <div class="simple_detail">
   <blockquote><%=content %></blockquote>
   </div>
   </article>
   <%
   ResultSet rs2=null;
   try{
   String sql3 = "select * from re_topic where UserName='"+author+"'and Title='"+topic+"'";
   rs2 = statement.executeQuery(sql3);
   while(rs2.next()){
   String re_content=rs2.getString("Re_content");
   String re_author = rs2.getString("Re_author");
   %>
   <div class="re_content">
   <article>
   <%=re_content %><br>
   <hr>
   <div class = "re_author">
   <%=re_author %>
   </div>
   </article>
   </div>
   <%
   }
   }finally{
   if(rs2!=null){
   try{
   rs2.close();
   }catch(Exception e)
   {
   e.printStackTrace();
   }
   }
   }
    %>
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
     <div class="re_area">
     <hr>
     <form action="../admin/doRe.jsp?author=<%=author %>&topic=<%=topic %>" method="post">
     <textarea cols="60" rows="6" name="re_content"></textarea>
     <input type="submit">
     </form>
     </div>
     				</div>
			</div>
		</div>
	</body>
</html>
