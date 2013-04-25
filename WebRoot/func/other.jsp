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
				<table>
				<tr>
	<td><a href="showGroupDetail.jsp?which=Tools">Tools</a><button onclick="addGroup('tools')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Social">Social</a><button onclick="addGroup('social')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Entertain">Entertain</a><button onclick="addGroup('entertain')"><img src="../img/addgroup.png"/></td>
</tr>
<tr>
	<td><a href="showGroupDetail.jsp?which=Education">Education</a><button onclick="addGroup('education')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Project">Project</a><button onclick="addGroup('project')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Books">Books</a><button onclick="addGroup('entertain')"><img src="../img/addgroup.png"/></td>
</tr>
<tr>
	<td><a href="showGroupDetail.jsp?which=News">News</a><button onclick="addGroup('news')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Music">Music</a><button onclick="addGroup('music')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Travel">Travel</a><button onclick="addGroup('travel')"><img src="../img/addgroup.png"/></td>
</tr>
<tr>
	<td><a href="showGroupDetail.jsp?which=Food">Food</a><button onclick="addGroup('food')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Sports">Sports</a><button onclick="addGroup('sports')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Medical">Medical</a><button onclick="addGroup('medical')"><img src="../img/addgroup.png"/></td>
</tr>
<tr>
	<td><a href="showGroupDetail.jsp?which=Shopping">Shopping</a><button onclick="addGroup('shopping')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=Picture">Picture</a><button onclick="addGroup('picture')"><img src="../img/addgroup.png"/></td>
	<td><a href="showGroupDetail.jsp?which=FinalExam">FinalExam</a><button onclick="addGroup('finalexam')"><img src="../img/addgroup.png"/></td>
</tr>
				</table>
     				</div>
			</div>
		</div>
	</body>
</html>
