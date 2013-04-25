<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript">
	function check()
	{
	var name = document.regForm.fullname.value;
	var pwd = document.regForm.pwd.value;
	if(name==""||name==null){
	alert("Username can't be null");
	return false;
	}else if(pwd==""||pwd==null){
	alert("Password can't be null");
	return false;
	}else
	return true;
	}
	</script>


  </head>
  
  <body>
    <div class="main w">
    <%@ include file="head.html" %>
    
    <div class="login">
    <form action="admin/doLogin.jsp" method="post" name="regForm" onsubmit="return check()">
    <table>
    <tr>
    <td>UserName: </td>
    <td><input type="text" name="fullname"></td>
    <tr>
    <td>PassWord: </td>
    <td><input type="password"name="pwd"></td>
    </tr>
    <tr>
    <td><input type="submit" value="submit"></td>
    <td><input type="reset" value="reset"></td>
    </tr>
    </table>
    </form>
    </div>
    <%@ include file="foot.html" %>
    </div>
  </body>
</html>
