<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<jsp:include page="/web/setop.jsp" />
<form id="pagerForm" method="post" action="mymenu.do?method=menulist" onsubmit="return validateCallback(this, navTabAjaxDone)">
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
			<li><a class="add" href="/mymenu.do?method=getmenu" target="dialog" mask="true" title="添加菜单"><span>添加</span></a></li>
			<li><a class="delete" href="mymenu.do?method=modifymenu&id={sid_user}" target="dialog" title="修改菜单" warn="请选择菜单"><span>修改</span></a></li>
            <li><a class="edit" href="mymenu.do?method=removemenu&id={sid_user}" target="ajaxTodo" warn="请选择菜单"><span>注销</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
			    <th width="100">菜单ID</th>  
				<th width="100">父ID</th>
				<th width="100">菜单名称</th>
				<th width="100">菜单地址</th>
				<th width="100">是否有效</th>
			</tr>
		</thead>
		<tbody>
		    <c:forEach var="menulist" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_user" rel="${menulist.id}">
				 <td width="100"><c:out value="${menulist.id}"/></td>    
				 <td width="100"><c:out value="${menulist.pid}"/></td>
				 <td width="100"><c:out value="${menulist.name}"/></td>
				 <td width="200"><c:out value="${menulist.url}"/></td>
				 <td width="100"><c:if test="${menulist.status eq 0 }">有效</c:if><c:if test="${menulist.status  eq 1 }">无效</c:if></td>
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
