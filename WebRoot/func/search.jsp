<%@page import="java.io.PrintWriter"%>
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
							<li><a href="showGroupDetail.jsp?which=Academic">Academic</a></li>
							<li><a href="showGroupDetail.jsp?which=Sports">Sports</a></li>
							<li><a href="showGroupDetail.jsp?which=Entertain">Entertain</a></li>
						</ul>
					</div>
					<div class="join">
					<button onclick="addGroup('entertain')"><img src="../img/addgroup.png"/></button>
					<button onclick="addGroup('sports')"><img src="../img/addgroup.png"/></button>
					<button onclick="addGroup('academic')"><img src="../img/addgroup.png"/></button>
					</div>
				</div>
				<div class="detail">
					<%
					 String name = (String)session.getAttribute("username");
   if(name==null){
   response.sendRedirect("../Login.jsp");
}
   String search = request.getParameter("search");
  Connection conn = null;
  Statement statement = null;
  ResultSet set = null;
  String url = "jdbc:mysql://localhost/teamup";
  String driver = "com.mysql.jdbc.Driver";
  String user = "root";
  String password = "zsq001";
  String sql = "select * from team_info where UserName like '%"+search+"%' or Type like '%"+search+"%' or Topic like'"+search+"%' or Time like'%"+search+"%' or Location like'%"+search
  +"' or `Group` like '%"+search+"%' or Introduction like '%"+search+"%'";
  try{
  Class.forName(driver).newInstance();
  conn =(Connection)DriverManager.getConnection(url, user, password);
  statement = conn.createStatement();
  set = statement.executeQuery(sql); 
  while(set.next()){
 String topic =set.getString("Topic");
   
   String author =set.getString("UserName");
   String content = set.getString("Introduction");
   String group = set.getString("Type");
  %>
  <article>
   <h2><a href="detail.jsp?author=<%=author%>&topic=<%=topic%>&group=<%=group%>"><%=topic %></a></h2><br>
   <aside><strong>Owner: </strong><%=author %></aside>
   <div class="simple_detail">
   <blockquote><%=content %></blockquote>
   </div>
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
