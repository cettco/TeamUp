<%@page import="sun.awt.RepaintArea"%>
<%
String name = (String)session.getAttribute("username");
if(name==null){
response.sendRedirect("../Login.jsp");
}
 %>
<html>
<head>
	<link rel="stylesheet" href="../css/main_style.css">
	<meta charset="utf-8">
</head>
<body>
	<div class="main">
		<div class="head">
			<img src="../img/teamup.png"/>
		</div>
		<div class="edit_name">
		Hello <%=name %>
		</div>
		<div class="edit">
		<form action="../admin/doEdit.jsp" method="post">
			<table>
				
				<tr>
					<td>PassWord:</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td>Sex</td>
					<td><input name="sex"type="radio" value="man" checked="checked"/>Main
    <input name="sex" type="radio" value="woman"/>Woman</td>
				</tr>
				<tr>
					<td>Mail:</td>
					<td><input type="text" name="mail"></td>
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