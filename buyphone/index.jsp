<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/buyphone/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>

<style>body{background: #fff;}</style>
	<!-- 购买 -->
	<div class="index_buy">
		<img src="/images/index_buy.jpg" alt="">
		<cite>
			<h2><img src="/images/index_buy_tle.png"></h2>
			<p>
				• 智慧在线服务体验 海量合作服务商家<br>
				• 便携移动智能POS 即时收款刷卡到账<br>
				• 高度集成刷卡硬件 金融级别数据加密<br>
				<a href="norm.jsp">技术规格</a>
			</p>
			<strong>2888</strong>元<br>
			<a href="buy.shtml" class="index_buy_btn"><img src="/images/index_buy_btn.png" alt=""></a>
			<a href="buy.shtml" class="index_buy_btn js-check"><img src="/images/index_npm_btn.png" alt=""></a>
			<br>
			<a href="buy.shtml">[移动]</a><a href="buy.shtml">[联通]</a><a href="buy.shtml">[电信]</a><a href="buy.shtml">[全网通]</a><br>
			<a href="product.shtml" style="color:#1bbdff;">安子支付其他产品</a>
		</cite>

	</div>


	<div class="index_pos">
		<img src="/images/index_pos.jpg" alt="">
		<cite><img src="/images/index_pos_cnt.png" alt=""></cite>
	</div>


	<div class="index_prm">
		<img src="/images/index_prm.jpg" alt="">
		<cite>
			<img src="/images/index_prm_cnt.png" alt="">
			<ul>
				<li>
					<img src="/images/index_prm_btn1.png">
					<img src="/images/index_prm_btn1_on.png" class="index_prm_on">
					摄像头
				</li>
				<li>
					<img src="/images/index_prm_btn2.png">
					<img src="/images/index_prm_btn2_on.png" class="index_prm_on">
					刷卡磁头
				</li>
				<li>
					<img src="/images/index_prm_btn3.png">
					<img src="/images/index_prm_btn3_on.png" class="index_prm_on">
					蓝牙
				</li>
			</ul>
		</cite>
	</div>

	
	<div class="index_app">
		<img src="/images/index_app_1.jpg" alt="">
		<!-- <img src="/images/index_app_2.jpg" alt=""> -->
	<!-- 	
		<cite>
			<div class="index_app_slides">
				<ul>
					<li><a href="#"><img src="/images/index_app_slides.jpg" alt=""></a></li>
				</ul>
			</div>

			<ul>
				<li><img src="/images/index_app_btn1.png">
					<strong>移动商城</strong>
					<a href="#">下载</a>
				</li>
				<li><img src="/images/index_app_btn2.png">
					<strong>移动钱包</strong>
					<a href="#">下载</a>
				</li>
				<li><img src="/images/index_app_btn3.png">
					<strong>手机助手</strong>
					<a href="#">下载</a>
				</li>
			</ul>
		</cite>
 -->
	</div>





	<div class="index_prc">
		全国统一价：<em><strong>2888</strong>元</em>
		<a href="buy.shtml">立即购买</a>
	</div>
	
	

	<div style="display:none;" class="dialog_cnt">
		<h3>订单查询</h3>
		<form action="pcselect.shtml" method="post">
			<input type="text" placeholder="| 请输入订单号" name="ordernumber">
			<div style="text-align: center;">
				
				<input type="submit" value="确定">
				<b>关闭</b>

			</div>
			
		</form>
	</div>
	
	
<jsp:include page="/buyphone/footer.jsp" ></jsp:include>

	<script>


		$('.js-check').on('click',function(){
			dialog.html($('.dialog_cnt').html()).open();
			return false;
		});

		dialog.on('click','b',function () {dialog.close();return false;});

		dialog.on('submit','form',function () {

			var form  = $(this);

			$.ajax({
				type: "POST",
				dataType:'json',
				url: form.attr('action'),
				data: form.serialize(), //传值，这里直接传了字符串
				success: function(data) {
					var res = '';
					var json;

					if(data.list1){
						// 已发货
						json = data.list1[0];
res = '发货状态：已发货<br>收货人：'+json.username+'<br>手机号：'+json.phone+'<br>地址：'+json.province+json.city+json.county+json.address+'<br>快递公司：'+json.expressname+'<br>物流编号：'+json.expressnumber;
					} else if(data.list2){
					
						// 未发货
						json = data.list2[0];
res = '发货状态：未发货<br>收货人：'+json.username+'<br>手机号：'+json.phone+'<br>地址：'+json.province+json.city+json.county+json.address;
					}else if(data.list3){
						// 无订单
						res = '未找到相关记录'
					}else{
						// 错误
						res = '查询错误'
					}

					dialog.html(function(){
						return '<h3>订单查询结果</h3><h4>'+res+'</h4><br><b>关闭</b>';
					}).open();
				},
				error:function(){
					// results('服务器繁忙，请稍后再试');
				}
			});

			dialog.close();

			return false;

		});


	</script>