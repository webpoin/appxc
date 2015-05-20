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
    <form method="post" action="/dic.do?method=updateorder"  class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
	  	<div class="pageFormContent" layoutH="58">
	   <input type="hidden" name="id" value="${list[0].id}" />
		<div class="unit">
				<label>收货人姓名：</label>
				${list[0].username}
      			<input type="hidden"  name="username" value="${list[0].username}">
      			<input type="hidden"  name="number" value="${list[0].number}">
      			<input type="hidden"  name="money" value="${list[0].money}">
      			<input type="hidden"  name="cname" value="${list[0].cname}">
      			<input type="hidden"  name="ordernumber" value="${list[0].ordernumber}">
      			<div id="contentError" ></div>
			</div>
			<div class="unit">
				<label>收货人手机号：</label>
      			${list[0].phone}
      			<input type="hidden"  name="phone"  value="${list[0].phone}" >
      			<div id="contentError" ></div>
			</div>
			
			<div class="unit">
				<label>收货人地址：</label><br>
				${list[0].province}${list[0].city}${list[0].county}${list[0].address}
				<input type="hidden"  name="province"  value="${list[0].province}">
				<input type="hidden"  name="city"  value="${list[0].city}">
				<input type="hidden"  name="county"  value="${list[0].county}"  >
				<input type="hidden"  name="address"  value="${list[0].address}" >
				<div id="contentError" ></div>
			</div>
			
			<div class="unit">
				<label>快递名称：</label>
				<input type="text"  name="expressname">
				<div id="contentError" ></div>
			</div>
		
			<div class="unit">
				<label>物流编号：</label>
				<input type="text"  name="expressnumber">
				<div id="contentError" ></div>
			</div>
			</div>	
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
    