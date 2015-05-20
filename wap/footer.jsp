<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

	<div class="footer">
		<div class="footer_link">
			<a href="#" class="totop">返回顶部</a>
		</div>
		<div class="footer_copyright">粤ICP备14055158号-2  &copy; 2015 安子支付 </div>

	</div>

	<div class="wechat_download">
		<img src="/wap/images/wechat_download.png" alt="">
	</div>


	<script src="/wap/js/global.js"></script>

	<script>

	$(document).ready(function(){

		var wechat = $('.wechat_download');

		$('body').on('click','a',function(){


			// 非微信关闭
			if( /(\id824001255)|(\.apk)$/.test(this.href) && navigator.userAgent.indexOf("MicroMessenger/")>-1){
				wechat.show();
				return false;
			}
			
		}).on('click',function(){
			wechat.hide();

		});
	
	});



	</script>
</body>
</html>