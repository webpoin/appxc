<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%request.setCharacterEncoding("gbk");%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="/buyphone/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>
	<div class="confirm">
	 <form action="http://223.223.198.219:8080/mcsmgr/upop/anzipayto.jsp"  method=post>  
		<input type="hidden"  name="subject" value="${subject}">
		<input type="hidden"  name="body" value="${body}">
		<input type="hidden"  name="ordertime" value="${order_time}">
		<input type="hidden"  name="partner" value="${partner}">
		<input type="hidden"  name="out_trade_no" value="${out_trade_no}">
		<input type="hidden"  name="total_fee" value="${money}">
		<input type="hidden"  name="sign" value="${sign}">
		<input type="hidden"  name="name" value="${name}">
		<input type="hidden"  name="notify_url" value="${notify_url}">
		<input type="hidden"  name="return_url" value="${return_url}">
		<input type="hidden"  name="_input_charset" value="${_input_charset}">
		<input type="hidden"  name="sign_type" value="${sign_type}">
		<table>
			<tr>
				
				<td><img src="/images/buy_phone.jpg" alt=""></td>
				<td>${subject}</td>
				<td>单价：<b>${price}</b>元</td>
				<td>数量：${number}</td>
				<td>总价：<strong>${money}</strong>元</td>
			</tr>
		</table>

		
		<div class="confirm_addr">
			<h3>收货地址</h3>
			${province}${city}(${username} 收) <br>
			${county}${address}<br/>
			 手机号：${phone}<br>
			
		</div>
			
		<cite style="text-align: center;"><input type="submit" class="confirm_true" value="立即支付"></cite>
	</form>
</div>



<jsp:include page="/buyphone/footer.jsp" ></jsp:include>
<script src="js/global.js"></script>
