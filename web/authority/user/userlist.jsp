<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

   <jsp:include page="/web/setop.jsp" />
   <form id="pagerForm" method="post" action="/admin.do?method=one181List" onsubmit="return validateCallback(this, navTabAjaxDone)">
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
			<li><a class="edit" href="/web/authority/user/userPasswordUpdate.jsp" target="dialog" mask="true" title="修改密码" warn="请选择"><span>修改密码</span></a></li>
			<li class="line">line</li> 
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="30">序号</th>
				<th width="60">用户名</th>
				<th width="60">真实名字</th>
				<th width="60">用户状态</th>
				<th width="100">注册时间</th>
			</tr>
		</thead>
		<tbody>
		   	<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_list" rel="${list.id}">
				 <td><c:out value="${(pageSupport.currentPageNo-1)*pageSupport.pageSize+index.count}"/></td>    
				 <td><c:out value="${list.UserCode}"/></td>
				 <td><c:out value="${list.UserName}"/></td>
				 <td>有效</td>
				 <td><fmt:formatDate value="${list.LastModifyTime}" pattern="yyyy-MM-dd HH:mm"/></td>
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

