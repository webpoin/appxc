<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/web/setop.jsp" />
<div class="pageContent">
	<form method="post" action="/main.do?method=adduser"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>真实姓名：</label>
				<input type="text" size="25" name="username"/>
			</div>
			<div class="unit">
				<label>邮箱：</label>
				<input type="text" size="25" name="email" class="required email"/>用于接收登录授权码
			</div>
			<div class="unit">
				<label>用户帐号：</label>
				<input type="text" size="25" name="usercode"/>*用户登录使用
			</div>
			<div class="unit">
				<label>用户密码：</label>
				<input type="text" size="25" name="code" class="required alphanumeric" minlength="6" maxlength="20"/>
			</div>
			<div class="divider">divider</div>
			<div class="unit">
				<label>用户状态：</label>
				<select name="status" id="status">
					<option value='1'>有效</option>
					<option value='0'>无效</option>
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