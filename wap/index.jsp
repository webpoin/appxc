<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/wap/header.jsp" ><jsp:param name="head" value="index" /></jsp:include>


	<!-- 购买 -->
	<div class="index_buy">
		<img src="/wap/images/index_buy.jpg" alt="" class="index_buy_bkg">
		<cite>
			
			<strong>2888</strong>元<br>
			<a href="wapbuy.shtml" class="index_buy_btn"><img src="/wap/images/index_buy_btn.png" alt=""></a>
			<a href="wapbuy.shtml" class="index_buy_btn js-check"><img src="/wap/images/index_npm_btn.png" ></a><br>
			<a href="wapbuy.shtml">[移动]</a><a href="wapbuy.shtml">[联通]</a><a href="wapbuy.shtml">[电信]</a><a href="wapbuy.shtml">[全网通]</a>
			<br><a href="wapproduct.shtml" style="color:#1bbdff;">安子支付其他产品</a>
		</cite>

	</div>



	<div class="index_box"><img src="/wap/images/index_pic2.jpg" alt=""></div>
	<div class="index_box"><img src="/wap/images/index_pic3.jpg" alt=""></div>
	<div class="index_box"><img src="/wap/images/index_pic4.jpg" alt=""></div>

	

	<div class="index_prc">
		全国统一价：<em><strong>2888</strong>元</em>
		<a href="wapbuy.shtml">立即购买</a>
	</div>




	<div style="display:none;" class="dialog_cnt">
		<h3>订单查询</h3>
		<form action="select.shtml" method="post">
			<input type="text" placeholder="| 请输入订单号" name="ordernumber">
			<div style="text-align: center;">
				
				<input type="submit" value="确定">
				<b>关闭</b>

			</div>
			
		</form>
	</div>



<jsp:include page="/wap/footer.jsp" ></jsp:include>

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