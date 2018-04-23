<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上商城</title>
<link href="${pageContext.request.contextPath}/css/T2_common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/T2_main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
<script type="text/javascript">
	var ret = false;
	var rename = '${user.email}';
	function checkForm(){
		if($('#username').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}if($('#rname').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}if($('#idnum').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}if($('#add').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}if($('#mobile').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}if($('#pwd1').val() == ''){
			document.getElementById("msg").innerHTML="必须输入所有信息";
			return false;
		}
		if(ret)
			return false;
		document.getElementById("msg").innerHTML="";
		var pwd1 = document.getElementById("pwd1").value;
		var pwd2 = document.getElementById("pwd2").value;
		if(pwd1 == pwd2){
			return true;
		}else{
			document.getElementById("msg").innerHTML="两次输入的密码不一致";
			return false;
		}
	}
	function empty(){
		$('#tip').html('');
		ret = false;
	}
	
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

	<div style="width: 450px;border:#a5d1f1 1px solid; background:#FFF; margin: 0 auto;">
	    <div class="T2_title hrbottom">
	      <h3>用户注册</h3>
	    </div>
	    <form action="regist" method="post" onsubmit="return checkForm();">
		    <table class="loginForm" style="font-size: 11pt;">
				<tr><td class="formLabel">用户名</td><td><input type="text" id="username" class="zzinput" name="username" onfocus="empty();"/></td></tr>
				<tr><td></td><td><span id="tip"></span></td></tr>
				<tr><td class="formLabel">密码</td><td><input type="password" name="pwd" class="zzinput" id="pwd1"/></td></tr>
				<tr><td class="formLabel">确认密码</td><td><input type="password" id="pwd2" onblur="checkForm();" class="zzinput"/></td></tr>
				<tr><td colspan="2" align="center"><input type="reset" class="loginbtn"/>&nbsp;<input type="submit" class="loginbtn" value="注册"/></td></tr>
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