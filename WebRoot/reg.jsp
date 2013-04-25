<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript">
	function check(){
	var name = document.regForm.fullname.value;
	var pwd = document.regForm.pwd.value;
	var pwd2 = document.regForm.pwd2.value;
	if(name==""||name==null){
	alert("the name can't be empty");
	return false;
	}
	else if(pwd==""||pwd==null){
	alert("the password can't be empty");
	return false;
	}
	if(pwd!=pwd2){
	alert("the passwords are not the same!");
	return false;
	}
	return true;
	}
	</script>

  </head>
  
  <body>
    <div class="main w">
    <%@include file="head.html" %>
    <div class="toLogin">
    <a href="../Login.jsp">Login</a>
    </div>
    <div class="reg">
    <form method="post" action="admin/doReg.jsp" name="regForm" onsubmit="return check()">
    <table>
    <tr>
    <td>UserName:</td>
    <td><input type="text" name="fullname">
    </tr>
    <tr>
    <td>PassWord:</td>
    <td><input type="password" name="pwd">
    </tr>
    <tr>
    <td>Comfirm PassWord:</td>
    <td><input type="password" name="pwd2">
    </tr>
    <tr>
    <td>Sex</td>
    <td><input name="sex"type="radio" value="man" checked="checked"/>帅哥
    <input name="sex" type="radio" value="woman"/>美女
    </td>
    </tr>
    <tr>
    <td>Email:</td>
    <td><input name="email" type="text"></td>
    </tr>
    <tr>
    <td>Select Image:</td>
    </tr>
    </table>
    <div class="reg_image">
	<input name="radio" type="radio" value="1.gif" checked="checked" />
      <img src="img/head/1.gif" width="70" height="70" alt="1" />
      <input type="radio" name="radio" value="2.gif" />
      <img src="img/head/2.gif" width="70" height="70" alt="2" />
      <input type="radio" name="radio" value="3.gif" />
      <img src="img/head/3.gif" width="70" height="70" alt="3" />
      <input type="radio" name="radio" value="4.gif" />
      <img src="img/head/4.gif" width="70" height="70" alt="4" />
      <input type="radio" name="radio" value="5.gif" />
      <img src="img/head/5.gif" width="70" height="70" alt="5" /><br />
      <input type="radio" name="radio" value="6.gif" />
      <img src="img/head/6.gif" width="70" height="70" alt="6" />
      <input type="radio" name="radio" value="7.gif" />
      <img src="img/head/7.gif" width="70" height="70" alt="7" />
      <input type="radio" name="radio" value="8.gif" />
      <img src="img/head/8.gif" width="70" height="70" alt="8" />
      <input type="radio" name="radio" value="9.gif" />
      <img src="img/head/9.gif" width="70" height="70" alt="9" />
      <input type="radio" name="radio" value="10.gif" />
      <img src="img/head/10.gif" width="70" height="70" alt="10" /><br />
      <input type="radio" name="radio" value="11.gif" />
      <img src="img/head/11.gif" width="70" height="70" alt="11" />
      <input type="radio" name="radio" value="12.gif" />
      <img src="img/head/12.gif" width="70" height="70" alt="12" />
      <input type="radio" name="radio" value="13.gif" />
      <img src="img/head/13.gif" width="70" height="70" alt="13" />
      <input type="radio" name="radio" value="14.gif" />
      <img src="img/head/14.gif" width="70" height="70" alt="14" />
      <input type="radio" name="radio" value="15.gif" />
      <img src="img/head/15.gif" width="70" height="70" alt="15" />
</div>
<div class="reg_sub">
<input type="submit">
<input type="reset">
</div>
    </form>
    </div>
    <%@include file="foot.html" %>
    </div>
  </body>
</html>
