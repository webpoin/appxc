<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/wap/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>

<div class="buy">
	<form action="sendWap.shtml" class="fukrm fukrm-check" method="post">
		<input type="hidden" name="partner" value="000000100000014">
		<input type="hidden" name="tradechannel" value="0">
		<input type="hidden" name="name" value="安子支付">
		<input type="hidden" name="price" value="2880">
		<input type="hidden" name="cname" value="安子手机">
		<input type="hidden" name="body" value="安子手机">

		<fieldset>
			<cite>
				<span>收货人：</span>
				<label><input type="text" name="username" placeholder="请输入收货人姓名" check="required"></label>
			</cite>
			<cite>
				<span>联系电话：</span>
				<label><input type="text" name="phone" placeholder="请输入收货人联系电话" check="required,phone"></label>
			</cite>
			<cite class="js-form-city">
				<span>所在地区：</span>
				<select class="prov" name="province" default="广东" style="width: 60px;"></select>
				<select class="city" name="city" default="深圳市" style="width:60px;"></select>
				<select class="town" name="county" default="南山区" style="width:87px;"></select>
			</cite>
			<cite>
				<span>详细地址：</span>
				<label><input type="text" name="address" placeholder="请输入收货人详细地址" check="required" style="width: 208px;"></label>
			</cite>
 		</fieldset>


		<fieldset>
			<h3>产品详情</h3>

			<div class="buy_das">
				<img src="/wap/images/buy_phone.jpg" alt="">
				<strong>安子手机M8 双卡双待5.0寸智能手机<br>韩国锦湖</strong>
				<span><b id="price">2880</b>元<br>X1</span>
			</div>
		
			<div class="amount">
				<h4>购买数量</h4>
				<label class="js_amount">
					<i>-</i>
					<input type="text" name="number" value="1">
					<i>+</i>
				</label>
			</div>
			

		</fieldset>


		<div class="buy_total">
			合计<strong>￥<b id="price_total">2880</b></strong>
			<input type="submit" value="立即支付">
		</div>

	
	</form>
	
</div>

<jsp:include page="/wap/footer.jsp" ></jsp:include>