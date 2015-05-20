<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="/web/setop.jsp" />
<div class="pageContent">
	<form method="post" action="/mymenu.do?method=updatemenu"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
		<c:forEach var="list" items="${list}" varStatus="status">
			<input type="hidden" name="id" value="${list.id}"/>
			<div class="unit">
				<label>菜单名称：</label>
				<input type="text" name="name" value="${list.name}"/>
			</div>
			<div class="unit">
				<label>菜单地址：</label>
				<input type="text" name="url" size="50" value="${list.url}"/>
			</div>
			<div class="divider">divider</div>
		</c:forEach>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

