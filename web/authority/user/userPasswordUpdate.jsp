<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/web/setop.jsp" />
  <div class="pageContent">
    <form method="post" action="/main.do?method=updatePassword"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>新密码：</label>
				<div style="float:left;"><input type="password" name="newPassword" class="required"/></div>
				<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>重新输入新密码：</label>
				<div style="float:left;"><input type="password" name="reNewPassword" class="required"/></div>
				<div id="nameError" ></div>
			</div>
	   </div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
    