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
   <form method="post" action="/admin.do?method=versionUpdate" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this,dialogAjaxDone);"> 
	   <c:forEach var="list" items="${list}" varStatus="status">
	   <input type="hidden" name="id" value="${list.id}" />
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
      			<label>版本号：</label>
				<input type="text" name="version" class="required" value="${list.version}"/>
				<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>渠道号：</label>
				<input type="text" name="channel" class="required" value="${list.channel}" readonly="readonly"/>
			</div>
			<div class="unit">
			<label>备注：</label>
				<textarea cols="24" rows="2"  name="note" class="required">${list.note}</textarea>
				<div id="nameError" ></div>
			</div>
			<div class="unit">
				<label>安装包：</label>
				<input type="file" name="packagename" value="选择"/>
			</div>
			<div class="unit">
				<label>状态：</label>
				<select name="status">
					<c:if test="${list.state eq '0'}">
	      				<option value="0" selected="selected">有效</option>
	      				<option value="1">无效</option>
      				</c:if>
      				<c:if test="${list.state eq '1'}">
	      				<option value="0">有效</option>
	      				<option value="1" selected="selected">无效</option>
      				</c:if>
      			</select>
			</div>
	   </div>
	   </c:forEach>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset">清空</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
    