<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
body{
    background: none repeat scroll 0 0 #fff;
    color: #666;
    font: 12px/150% Arial,Verdana,"宋体";
}
li{
	display: inline-block;
}
.gl-i-wrap{
	font-size:12px;
	margin: 0px 18px 20px 18px;
}
.p-price{
	color:red;
	font-size:16px;
}
.goods-icons-s1{
	color:gray;
}	
.p-desc{
	color:#ffaa71;
	font-weight:bold;
	font-size:10pt;
	width:150px;
	display: block;
	width:200px;/*对宽度的定义,根据情况修改*/
	overflow: hidden;
	white-space: nowrap;
	text-overflow: clip;
}
.p-name{
	font-size:14px;
	font-style:bold;
	width:150px;
	display: block;
	width:200px;/*对宽度的定义,根据情况修改*/
	overflow: hidden;
	white-space: nowrap;
	text-overflow: clip;
}
.goods-icons-s1{
	font-size:14px;
}
.goods-none{
	color:red;
}
</style>
<ul>
	<c:forEach items="${productList }" var="p">
		<li>
			<div class="gl-i-wrap">
				<div class="p-img">
					<a href="detail?pid=${p.id }" target="_blank">
						<img width="200" height="200" data-lazy-img="done" src="${pageContext.request.contextPath}/images/product/${p.picPath}">
					</a>
				</div>
				<div class="p-name"><a href="detail?pid=${p.id }">${p.productName }</a></div>
				<div class="p-price" data-yushou="n" data-sku="1125138">
					<strong>￥${p.price }</strong>
					<%
						Random rdn = new Random();
						int num = rdn.nextInt(1000);
					%>
					<div class="p-icons">
						<c:choose>
							<c:when test="${num + 3 == 0 }">
								<i class="goods-none">
									无货
								</i>
							</c:when>
							<c:otherwise>
								<i class="goods-icons-s1">
									有货，支持货到付款
								</i>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="p-desc">
					<em>${p.describ }</em>
				</div>
				<div class="p-commit"><span>已有<a><%=num %></a>人评价</span></div>
			</div>
		</li>
	</c:forEach>
</ul>