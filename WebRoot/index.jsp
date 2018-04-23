<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上商城</title>
<link href="${pageContext.request.contextPath}/css/T2_common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/T2_main.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/context.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript">
	function hotline(fromcity, destination){
		$('#fromcity').val(fromcity);
		$('#tocity').val(destination);
	}
	$(function(){
		//加载最新上架商品
		$('#latestProduct').addClass('loading');
		$('#latestProduct').html('<span style="padding-left:20px;">正在加载...</span>');
		$('#latestProduct').load('/rcm/findIndexProductList',function(){$('#latestProduct').removeClass('loading');});
	});
</script>
</head>
<body>
<div class="T2_wrap">
	<div class="T2_huoche_nav">
	    <div class="logo"><img src="${pageContext.request.contextPath}/images/logo.png"/></div>
	</div>
	<div class="T2_huoche_topbar">
	  <div class="tleft"></div>
	  <div class="tright"></div>
	  <div class="th3">
	  	<!-- 未登录 -->
	  	<c:if test="${sessionScope.currUser == null}">
	  		<span class="dateSpan"><a id="registea" href="regist.jsp">注册&nbsp;</a>|&nbsp;<a href="login"><b>登录</b></a></span>
	  	</c:if>
		<!-- 已登录 -->
		<c:if test="${sessionScope.currUser != null}">
			商品个性推荐
			<span class="dateSpan">欢迎您，${currUser.userName}&nbsp;<a href="logout">登出</a></span>
		</c:if>
	  </div>
	</div>
	<div class="space_08"></div>
</div>

<div class="T2_wrap">
	<div class="space_10"></div>
	<!-- 最新上架商品 -->
	<div class="T2_content T2_ticket">
	<div class="T2_title hrbottom"><h3>商品列表</h3></div>
		<div class="cont clearfix" id="latestProduct">
		
		</div>
	</div>
	<div class="space_20"></div>
	</div>
	<div class="">
		<div class="hotlink clearfix">
			<c:if test="${sessionScope.currUser == null}"><!-- 还未登录 -->
			<form action="login" method="post">
			<table class="loginForm" id="userInfo">
				<tr><td class="formLabel">邮箱</td><td><input type="text" name="username"/></td></tr>
				<tr><td class="formLabel">密码</td><td><input type="password" name="pwd"/></td></tr>
				<tr><td colspan="2" align="center"><input type="reset" class="loginbtn" value="重 置"/>&nbsp;<input type="submit" class="loginbtn" value="登 录"/></td></tr>
				<tr><td colspan="2" align="center"></td></tr>
			</table>
			</form>
			<span>没有帐号？<a id="registea" href="regist.jsp">马上注册&gt;&gt;</a><br/></span><br/>
			</c:if>
			<!-- 已登录 -->
			<c:if test="${sessionScope.currUser != null}">
			<table class="loginForm" id="userInfo">
				<tr><td>欢迎您，${sessionScope.currUser.userName}&nbsp;<a href="logout">登出</a></td></tr>
				<tr><td>商品个性推荐</td></tr>
				<tr><td colspan="2" align="center"></td></tr>
			</table>
			</c:if>
		</div>
	</div>

<div class="T2_wrap">
<div class="bottomdiv"><hr/>网上商城<br/> </div>
</div>

</body>
</html>
