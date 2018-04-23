<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品详情</title>
<link href="${pageContext.request.contextPath}/css/T2_common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/T2_main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script type="text/javascript">
	function hotflower(keyword){
		keyword = encodeURI(encodeURI(keyword));
		window.location.href="hotFlower?key="+keyword;
	}
	
	$(function(){
		$('#history').addClass('loading');
		$('#history').html('<span style="padding-left:20px;">正在加载...</span>');
		$('#history').load('loadHistory',function(){$('#history').removeClass('loading');});
	});
	
	function findCategory(cid){
		window.location.href="viewFlowerByCategory?cid="+cid;
	}
</script>
<style>
.T2_title .tabs li { float:left;padding:1px 5px;margin-right:5px; cursor:pointer; line-height: 35px;}
.retable{border-collapse: collapse; font-size:11pt; border-color: #CCC;}
.retable td{padding-top: 5px; padding-bottom: 5px; border-color: #CCC;}
.stamp{font-size: 10pt;}
.content{margin-left: 50px;}
.item{border-bottom: 1px solid #CCC;padding-bottom: 5px;}
.delprice{color:#FF0000;}
.s-name{color: #ffaa71;font-weight: bold;}
</style>
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
	  	<!-- 未登录 -->
	  	<c:if test="${sessionScope.currUser == null}">
	  		<span class="dateSpan"><a id="registea" href="regist">注册&nbsp;</a>|&nbsp;<a href="login"><b>登录</b></a></span>
	  	</c:if>
		<!-- 已登录 -->
		<c:if test="${sessionScope.currUser != null}">
			<tr><td>商品个性推荐</td></tr>
			<tr><td colspan="2" align="center"></td></tr>
			<span class="dateSpan">欢迎您，${currUser.userName}&nbsp;<a href="logout">登出</a></span>
		</c:if>
	  </div>
	</div>
	<div class="space_08"></div>
</div>

<div class="T2_wrap">
	<div class="maincolumn">
	  
  <!--主面板 -->
  <div class="T2_content T2_ticket">
		<div class="T2_title hrbottom">
			<h3>商品详情</h3>
		</div>
		<div class="cont clearfix" id="hotsale">
			<table border='0' class="retable" width="98%">
				<tr valign="top">
					<td><img width="300" height="300" src="${pageContext.request.contextPath}/images/product/${product.picPath}"/></td>
					<td>
						<div class="search_desc" style="padding-left: 8px;">
							<h3>${product.productName}</h3>
							<p><span class="delprice">￥${product.price}元</span>
							<a href="javascript:addItem(${product.id});" class="buya"><span class="addcart">加入购物车</span></a>
							<p>${product.describ}</p>
						</div>
					</td>
				</tr>
				<tr><td colspan="2"></td></tr>
			</table>
		</div>
	</div>
	
	<div class="space_20"></div>
	</div>
	<div class="sidecolumn">
		<div class="T2_content T2_recent_query">
	    <!-- 右侧菜单栏 -->
		<table class="loginForm">
			<tr><td>欢迎您，${currUser.userName}</td><td><a href="logout">登出</a></td></tr>
			<tr><td><a href="#"></a></td></tr><tr><td></td></tr>
			<tr><td colspan="2" align="center"></td></tr>
		</table>
		</div>
		<div class="space_20"></div>
		<div id="cominfo">
		</div>
		<div class="space_20"></div>
		<div id="history" class="T2_content" style="display: none;">
			
		</div>
	</div>
</div>

<div class="T2_wrap">
<div class="bottomdiv"><hr/>网上商城<br/></div>
</div>

</body>
</html>
