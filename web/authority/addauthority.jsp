<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/web/setop.jsp" />
<div class="pageContent">
	<form method="post" action="/authority.do?method=addauthority"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>权限名称：</label>
				<input type="text" size="25" name="name"/>
			</div>
			<div class="unit">
				<label>权限描述：</label>
				<textarea name="description" rows="5" cols="30"></textarea>
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
