<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/buyphone/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>


<div class="buy">
	<form action="send.shtml" class="fukrm fukrm-check" method="post">
		<input type="hidden" name="partner" value="000000100000014">
		<input type="hidden" name="tradechannel" value="0">
		<input type="hidden" name="name" value="安子支付">
		<input type="hidden" name="price" value="2880">
		<input type="hidden" name="cname" value="安子手机">
		<input type="hidden" name="body" value="安子手机">
		<table>
			<tr>
				
				<td><img src="/images/buy_phone.jpg" alt=""></td>
				<td>安子手机M8 双卡双待5.0寸智能手机</td>
				<td>单价：<b>2880</b>元</td>
				<td>
					<label class="js_amount">
						<i>-</i>
						<input type="text" name="number" value="1">
						<i>+</i>
					</label>
				</td>
				<td>总价：<strong>2880.00</strong>元</td>
			</tr>
		</table>


		<h3>收货地址</h3>
		<fieldset>
			<cite>
				<span>收货人姓名：</span>
				<label><input type="text" name="username" placeholder="请输入收货人姓名" check="required"></label>
			</cite>
			<cite>
				<span>收货人电话：</span>
				<label><input type="text" name="phone" placeholder="请输入收货人联系电话" check="required,phone"></label>
			</cite>
			<cite class="js-form-city">
				<span>所在地区：</span>
				<select class="prov" name="province" default="广东" style="width: 100px;"></select>
				<select class="city" name="city" default="深圳市" style="width:180px;"></select>
				<select class="town" name="county" default="南山区" style="width:250px;"></select>
			</cite>
			<cite>
				<span>详细地址：</span>
				<label><input type="text" name="address" placeholder="请输入收货人详细地址，精确到门牌号" check="required" style="width: 600px;"></label>
			</cite>

		
 		</fieldset>

 		

		<br><br>
		<cite style="text-align: center;"><input type="submit" value="提交订单"></cite>
		<br><br>

	</form>
	
</div>



	
	<div style="display:none;">
		<div class="success">
			<h3>订单号：12847563</h3>
			<h4><img src="/images/dialog_success.png" />支付成功</h4>
			<b>继续购买</b>
			<b style="background:#acadbc;color:#fff;">关闭</b>
		</div>
		<div class="error">
			<h3>订单号：12847563</h3>
			<h4><img src="/images/dialog_error.png" />支付失败</h4>
			<b style="background:#39c663;color:#fff;">重新支付</b>
			<b>关闭</b>
		</div>

		<div class="wait">
			<h3>订单号：12847563</h3>
			<h4>正在支付中...</h4>
			<b style="background:#39c663;color:#fff;">重新支付</b>
			<b>关闭</b>
		</div>
	</div>



<jsp:include page="/buyphone/footer.jsp" ></jsp:include>

	<script>

		var success = $('.success').html();
		var error =  $('.error').html();
		var wait =  $('.wait').html();

		dialog.on('click',function () {dialog.close();return false;});



		// 成功
		// dialog.html(success).open();

		// 成功
		// dialog.html(error).open();

		// 成功
		// dialog.html(wait).open();

	</script>
