<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <jsp:include page="/web/setop.jsp" />
   <form id="pagerForm" method="post" action="/dic.do?method=recordsList" onsubmit="return validateCallback(this, navTabAjaxDone)">
		<input type="hidden" name="pageNum" value="${pageSupport.currentPageNo}" />
		<input type="hidden" name="numPerPage" value="${pageSupport.pageSize}" />
	</form>
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
				</li>
			</ul>
			<div class="subBar">
				<ul>
				</ul>
			</div>
		</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			
		
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th>序号</th>
				<th>商品名称</th>
				<th>订单号</th>
				<th>数量</th>
				<th>总价</th>
				<th>发货时间</th>
				<th>收货人姓名</th>
				<th>手机号</th>
				<th>地址</th>
				<th>快递名称</th>
				<th>物流编号</th>
			
			</tr>
		</thead>
		<tbody>
		   	<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_list" rel="${list.id}">
				 <td><c:out value="${(pageSupport.currentPageNo-1)*pageSupport.pageSize+index.count}"/></td>
				 <td>${list.cname}</td>   
				 <td>${list.ordernumber}</td> 		 
				 <td>${list.number}</td>
				 <td>${list.money}</td>
				 <td>${list.checkdate}</td>
				 <td>${list.username}</td>
				 <td>${list.phone}</td>
				 <td>${list.province}${list.city}${list.county}${list.address}</td>
				 <td>${list.expressname}</td>
				 <td>${list.expressnumber}</td>
			  </tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="panelBar">
	    <div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<c:if test="${pageSupport.pageSize eq '20'}">
					<option value="20" selected>20</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				<c:if test="${pageSupport.pageSize eq '50'}">
					<option value="20">20</option>
					<option value="50" selected>50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</c:if>
				<c:if test="${pageSupport.pageSize eq '100'}">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100" selected>100</option>
					<option value="200">200</option>
				</c:if>
				<c:if test="${pageSupport.pageSize eq '200'}">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200" >200</option>
				</c:if>
			</select>
			<span>条，共${pageSupport.totalRecordCount}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${pageSupport.totalRecordCount}" numPerPage="${pageSupport.pageSize}" pageNumShown="10" currentPage="${pageSupport.currentPageNo}"></div>
	</div>
</div>

