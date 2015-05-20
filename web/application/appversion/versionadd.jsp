<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>web/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>web/js/jquery-json.js"></script>
	<jsp:include page="/web/setop.jsp" />
  <div class="pageContent">
	<form method="post" action="/admin.do?method=versionAdd" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this,dialogAjaxDone);">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>版本号：</label>
				<input type="text" name="version" class="required"/>*如：V1.1.0
				<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>渠道号：</label>
				<input type="text" name="channel" value="1001" readonly="readonly" class="required"/>*渠道号默认
			</div>
			<div class="unit">
				<label>备注：</label>
				<textarea cols="24" rows="2" name="note" class="required"> </textarea>
				<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>上传应用：</label>
      			<input type="file" name="packagename" class="required">*不能含中文名称
      			<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>状态：</label>
				<select name="status">
      				<option value="0">有效</option>
      				<option value="1">无效</option>
      			</select>
			</div>
	   </div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">添加</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
    