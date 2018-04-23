<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上商城</title>
<link href="${pageContext.request.contextPath}/css/T2_common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/T2_main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="T2_wrap">
	<div class="T2_huoche_nav">
	    <div class="logo"><a href="index" title="返回主页"><img src="${pageContext.request.contextPath}/images/logo.png"/></a></div>
	</div>
	<div class="T2_huoche_topbar">
	  <div class="tleft"></div>
	  <div class="tright"></div>
	  <div class="th3">
	  	<span class="dateSpan">今天是<%=new SimpleDateFormat("yyyy年MM月dd日").format(new Date()) %></span>
	  </div>
	</div>
	<div class="space_08"></div>
</div>

	<div style="width: 350px;border:#a5d1f1 1px solid; background:#FFF; margin: 0 auto;">
	    <div class="T2_title hrbottom">
	      <h3>用户登录</h3><span style="float:right;"><a href="regist.jsp">注册&gt;&gt;</a></span>
	    </div>
	    <form action="login" method="post">
		    <table class="loginForm">
				<tr><td class="formLabel">用户名</td><td><input type="text" name="username"/></td></tr>
				<tr><td class="formLabel">密码</td><td><input type="password" name="pwd" id="pwd1"/></td></tr>
				<tr><td colspan="2" align="center"><input type="reset" class="loginbtn"/>&nbsp;<input type="submit" class="loginbtn" value="登录"/></td></tr>
				<tr><td colspan="2" align="center"><span id="msg" style="color:red;">${msg}</span></td></tr>
			</table>
		</form>
	</div>
	<div class="space_20"></div>
	<div class="T2_wrap">
		<div class="bottomdiv"><hr/>网上商城<br/> </div>
	</div>
</body>
</html>