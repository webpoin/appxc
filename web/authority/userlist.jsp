<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/web/setop.jsp" />
<form id="pagerForm" method="post" action="main.do?method=userlist" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="${pageSupport.currentPageNo}" />
	<input type="hidden" name="numPerPage" value="${pageSupport.pageSize}" />
</form>
<div class="pageHeader">
	<form ref="pagerForm" onsubmit="return navTabSearch(this);" action="main.do?method=userlist" method="post">
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
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/web/authority/adduser.jsp" target="dialog" mask="true" title="添加用户"><span>添加</span></a></li>
			<li><a class="delete" href="main.do?method=removeuser&id={sid_user}&status=0" target="ajaxTodo" title="确定要注销吗?" warn="请选择用户"><span>注销</span></a></li>
			<li><a class="add" href="main.do?method=removeuser&id={sid_user}&status=1" target="ajaxTodo" title="确定要开通吗?" warn="请选择用户"><span>开通</span></a></li>
			<li><a class="edit" href="authority.do?method=usertoauthlist&id={sid_user}" target="dialog" title="查看权限" warn="请选择用户"><span>查看权限</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">用户ID</th>
				<th width="100">用户账号</th>
				<th width="100">真实姓名</th>
				<th width="100">最后修改时间</th>
				<th width="100">状态</th>
			</tr>
		</thead>
		<tbody>
		   	<c:forEach var="userlist" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_user" rel="${userlist.id}">
				 <td width="100"><c:out value="${userlist.id}"/></td>    
				 <td width="100"><c:out value="${userlist.usercode}"/></td>
				 <td width="100"><c:out value="${userlist.username}"/></td>
				 <td width="100"><fmt:formatDate value="${userlist.lastmodifytime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				 <td width="100"><c:if test="${userlist.status eq 1 }">有效</c:if><c:if test="${userlist.status  eq 0 }">无效</c:if></td>
				
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
