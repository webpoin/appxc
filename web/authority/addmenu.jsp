<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/web/setop.jsp" />
<div class="pageContent">
	<form method="post" action="/mymenu.do?method=addmenu"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>父菜单：</label>
				<select name="pid" id="pid">
         		<c:forEach var="menu" items="${menu}" varStatus="status">
         		<option value="${menu.id}">${menu.name}</option>
        		</c:forEach>
        		</select>
			</div>
			<div class="unit">
				<label>菜单名称：</label>
				<input type="text" name="name" maxlength="20"/>
			</div>
			<div class="unit">
				<label>菜单地址：</label>
				<input type="text" name="url" maxlength="50"/>
			</div>
			<div class="divider">divider</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">添加</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
