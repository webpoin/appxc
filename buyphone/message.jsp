<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%
    request.setCharacterEncoding("iso-8859-1");
	String partner = new String(request.getParameter("partner").getBytes("iso-8859-1"),"gbk");
	String sign = request.getParameter("sign");
	String sign_type = request.getParameter("sign_type");
	String trade_no = request.getParameter("trade_no");
	String out_trade_no = request.getParameter("out_trade_no");
	String body = new String(request.getParameter("body").getBytes("iso-8859-1"),"gbk");
	String subject = new String(request.getParameter("subject").getBytes("iso-8859-1"),"gbk");
	String total_fee = request.getParameter("total_fee");
	String trade_status = request.getParameter("trade_status");	
	request.setAttribute("trade_status",trade_status);
%>
 
<jsp:include page="/buyphone/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>
	<div class="confirm">

		<table>
			<tr>
				
				<td><img src="/images/buy_phone.jpg" alt=""></td>
				<td>${subject}</td>
				<td>总价：<strong><%=total_fee %></strong>元</td>
			</tr>
		</table>

	
		<cite style="text-align: center;"></cite>

</div>



<jsp:include page="/buyphone/footer.jsp" ></jsp:include>

	<div style="display:none;">
		<div class="success">
			<h3>订单号：<%=out_trade_no %></h3>
			<h4><img src="images/dialog_success.png" />支付成功</h4>
			<b><a href="index.shtml">继续购买</a></b>
			<b style="background:#acadbc;color:#fff;"><a href="index.shtml">关闭</a></b>
		</div>
		
		<div class="error">
			<h3>订单号：<%=out_trade_no %></h3>
			<h4><img src="images/dialog_error.png" />支付失败</h4>
			<b><a href="index.shtml">继续购买</a></b>
			<b><a href="index.shtml">关闭</a></b>
		</div>

		
	</div>

	<script src="js/global.js"></script>

	<script>

		var success = $('.success').html();
		var error =  $('.error').html();
		var wait =  $('.wait').html();

		//dialog.on('click',function () {dialog.close();return false;});

		<c:if test="${trade_status eq 'TRADE_FINISHED'}"> 
			dialog.html(success).open();
		</c:if>
		<c:if test="${trade_status ne 'TRADE_FINISHED'}"> 
			dialog.html(error).open();
		</c:if>
			

		// 成功
		// dialog.html(wait).open();

	</script>
