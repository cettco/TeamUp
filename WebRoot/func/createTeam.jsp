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
					<a href="edit.jsp"><%=session.getAttribute("username") %></a>
				</div>
				<div class="menu">
				<table>
					<tr>
						<td><a href="../func/main.jsp">New Things</a></td>
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
				</div>
				<div class="detail">
				<div class="w">
				<form action="../admin/doCreate.jsp" method="post">
				<table>
				<tr>
			<td>Type:<input type="text" name="type"></td>
		</tr>
		<tr>
			<td>Topic:<input type="text" name="topic"></td>
		</tr>
		<tr>
			<td>Time:<input type="text" name="time">&nbsp;&nbsp;Location:<input type="text" name="location"></td>
		</tr>
		<tr>
			<td>Group:<input type="text" name="group"></td>
		</tr>
		<tr>
			<td>Introduction:<textarea id="introduction" name="introduction" cols="40" rows="10"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit"></td>
		</tr>
				</table>
				</form>
			</div>
		</div>
	</body>
</html>
