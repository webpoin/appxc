<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/buyphone/header.jsp" ><jsp:param name="head" value="about" /></jsp:include>



	<div class="about_ban"><img src="/images/about_ban.jpg" ></div>


	<div class="about_intro">
		<h2>公司简介</h2>
		
		<p>深圳安子便民支付科技有限公司（简称“安子支付”）成立于2004年11月19日，注册资金1亿元，隶属于深圳市安子科技股份有限公司，注册于深圳前海，性质为合资经营企业，是专业从事电子金融专业服务的公司，是国内领先的创新型第三方移动支付品牌企业。 </p>

		<p>安子支付是集移动金融终端产品的研发、生产、销售、商务平台对接、 金融平台清算、金融业务咨询等，以及投资、担保，培训，传媒等为一体的现代化综合性金融服务业运营商，产业涉及金融行业多个领域，业务范围覆盖全国。 </p>

		<p>公司依托专业化的管理团队、科学化的经营模式、先进的科技创新理念，将逐步打造成为国内一流的专业化、规范化、系统化、标准化的综合性金融服务运营企业；致力于金融创新，积极参与银行卡受理环境建设，以数字货币为业务发展核心，依托金融系统清算平台，贴近企业的业务运作和人们生活的各个方面，提供全方位的电子化金融服务环境，服务基本涵盖除现金及线上支付以外 的所有支付领域，为国内持卡客户创造安全、便捷的移动支付务，带动国内金融行业的蓬勃发展，为社会大众提供便利，致力成为国内最具专业的电子金融服务商。</p>

		<h2>我们的产品</h2>
		<p style="text-indent: 0;">为国内持卡客户创造安全、便捷的移动支付务，带动国内金融行业的蓬勃发展，为社会大众提供便利，致力成为国内最具专业的电子金融服务商。</p>


		<div class="about_slides">
			<a href="http://www.anzimall.com" class="active">安子商城</a>
			<a href="#">安子支付app</a>
			<a href="#">安子手机助手app</a>
			<a href="#">安子钱包</a>
		</div>

	</div>


	<div class="about_map">

		<h2>联系我们</h2>
		<p style="text-indent: 0;">如果您希望和安子支付合作或业务合作，请与我们联系</p>
		<div class="about_call">
			<span><img src="images/about_call1.png">技术电话：0755-3301 6895</span>
			<span><img src="images/about_call2.png">传真：0755-3301 6826</span><br>
			<span><img src="images/about_call1.png">客服电话：0755-3301 6895</span><br>
			<span><img src="images/about_call3.png">客服电话：0755-3301 6895</span><br>
			<img src="images/about_call4.png" alt="" class="about_call_erwei">
		</div>



		<div id="map"></div>


	</div>



<jsp:include page="/buyphone/footer.jsp" ></jsp:include>
	
<script type="text/javascript">


	function loadJScript() {
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "http://api.map.baidu.com/api?v=2.0&ak=6MnMg2PV1zdUKf99lHPmfduG&callback=init";
		document.body.appendChild(script);
	}


	function init() {


		var map = new BMap.Map("map");    // 创建Map实例
		var point = new BMap.Point( 113.914894,22.562684); //中点
		map.centerAndZoom(point, 13);  // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));
		map.addControl(new BMap.NavigationControl()); 
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放

		marker = new BMap.Marker(point);
		map.addOverlay(marker);
		marker.openInfoWindow(new BMap.InfoWindow('<h3 style="padding-right:50px;"><a href="#">深圳安子便民支付科技有限公司</a></h3><p>地址：深圳市宝安三区中粮地产大厦22楼<br/>电话：0755-3301 6895 </p>'));
	}  



	window.onload = loadJScript;  //异步加载地图
	

</script>

