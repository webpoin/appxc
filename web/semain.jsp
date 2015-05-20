<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">   
<title></title>

<link href="web/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="web/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="web/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="web/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="web/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="web/js/jquery.cookie.js" type="text/javascript"></script>
<script src="web/js/jquery.validate.js" type="text/javascript"></script>
<script src="web/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="web/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="web/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="web/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="web/chart/raphael.js"></script>
<script type="text/javascript" src="web/chart/g.raphael.js"></script>
<script type="text/javascript" src="web/chart/g.bar.js"></script>
<script type="text/javascript" src="web/chart/g.line.js"></script>
<script type="text/javascript" src="web/chart/g.pie.js"></script>
<script type="text/javascript" src="web/chart/g.dot.js"></script>

<script src="web/js/dwz.core.js" type="text/javascript"></script>
<script src="web/js/dwz.util.date.js" type="text/javascript"></script>
<script src="web/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="web/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="web/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="web/js/dwz.drag.js" type="text/javascript"></script>
<script src="web/js/dwz.tree.js" type="text/javascript"></script>
<script src="web/js/dwz.accordion.js" type="text/javascript"></script>
<script src="web/js/dwz.ui.js" type="text/javascript"></script>
<script src="web/js/dwz.theme.js" type="text/javascript"></script>
<script src="web/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="web/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="web/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="web/js/dwz.navTab.js" type="text/javascript"></script>
<script src="web/js/dwz.tab.js" type="text/javascript"></script>
<script src="web/js/dwz.resize.js" type="text/javascript"></script>
<script src="web/js/dwz.dialog.js" type="text/javascript"></script>
<script src="web/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="web/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="web/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="web/js/dwz.stable.js" type="text/javascript"></script>
<script src="web/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="web/js/dwz.ajax.js" type="text/javascript"></script>
<script src="web/js/dwz.pagination.js" type="text/javascript"></script>
<script src="web/js/dwz.database.js" type="text/javascript"></script>
<script src="web/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="web/js/dwz.effects.js" type="text/javascript"></script>
<script src="web/js/dwz.panel.js" type="text/javascript"></script>
<script src="web/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="web/js/dwz.history.js" type="text/javascript"></script>
<script src="web/js/dwz.combox.js" type="text/javascript"></script>
<script src="web/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="web/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("web/dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
</script>
</head>
<jsp:include page="/web/setop.jsp" />
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="#">标志</a>
				<ul class="nav">
					<li><a href="logout.shtml?ua=7d76ad1ebc12433387120f3d23f04c9bndj30101po" >退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>安子助手</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
				  <div class="accordionHeader">
						<h2><span>Folder</span>系统菜单</h2>
					</div>
				  <div class="accordionContent" id="left"> 
				  <script type="text/javascript">
				   $.ajax({   
				    url: '/mymenu.do?method=getmenubyname&date='+new Date().getTime(), 
				    type:'post', //数据发送方式   
				    dataType:'json', //接受数据格式   
				    error:function(json){
				       },  
				    async: false ,//同步方式  
				    success: function(json){  
				          $("#left").html(getTree(json,0).replaceAll("<ul></ul>","")); 
				           }  
				     }); 
				    function getTree(data,Pid){ 
				        var tree; 
				        if(Pid==0){ 
				            tree = '<ul class="tree treeFolder  collapse">';       
				        }else{ 
				            tree = '<ul>'; 
				        } 
				        for(var i in data){ 
				             if(data[i].Pid == Pid){ 
				                tree += "<li><a href='"+data[i].Url+"' target='navTab' rel='"+data[i].ID+"'>"+data[i].Name+"</a>"; 
				                tree += getTree(data,data[i].ID); 
				                tree += "</li>"; 
				            } 
				        } 
				        return tree+"</ul>"; 
				    } 
				    
				 </script>
		      </div> 
		      </div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">安子助手主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">安子助手主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">欢迎您进入安子助手后台管理系统！	</div>
				</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2013 <a href="#" target="dialog">深圳市金木水火土信息技术有限公司</a></div>
</body>
</html>