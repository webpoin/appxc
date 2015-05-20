<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%request.setCharacterEncoding("gbk");%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="/wap/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>
	<div class="buy">
		<form action="http://223.223.198.219:8080/mcsmgr/upop/anzipayto.jsp"  class="fukrm" method=post>  
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

		

			<div class="confirm_man">
				<h2>
					<img src="/wap/images/confirm_man1.png" alt="">收货人
					<span><img src="/wap/images/confirm_man2.png" alt="">${phone}</span>
				</h2>
				<p>收货地址  ${province}${city}${county}${address} </p>
			</div>


			<fieldset>
				<h3>产品详情</h3>

				<div class="buy_das" style="border:none">
					<img src="/wap/images/buy_phone.jpg" alt="">
					<strong>${subject}</strong>
					<span><b id="price">${price}</b>元<br>X${number}</span>
				</div>
			

			</fieldset>


			<div class="buy_total">
				合计<strong>￥<b id="price_total">${money}</b></strong>
				<input type="submit" value="确定支付">
			</div>

		
		</form>
		
	</div>



<jsp:include page="/wap/footer.jsp" ></jsp:include>