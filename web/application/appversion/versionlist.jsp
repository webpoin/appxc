<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   <jsp:include page="/web/setop.jsp" />
   <form id="pagerForm" method="post" action="/admin.do?method=versionList" onsubmit="return validateCallback(this, navTabAjaxDone)">
		<input type="hidden" name="pageNum" value="${pageSupport.currentPageNo}" />
		<input type="hidden" name="numPerPage" value="${pageSupport.pageSize}" />
	</form>
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
				<!--  
					<label>电子券名称：</label>
					<input type="text" name="name" value="${name}"/>
					-->
				</li>
			</ul>
			<div class="subBar">
				<ul>
				<!-- 
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			   <li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>-->
				</ul>
			</div>
		</div>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/web/application/appversion/versionadd.jsp" target="dialog" mask="true" width="600" height="400" title="客户端版本号"><span>添加</span></a></li>
			<li><a class="edit" href="/admin.do?method=versionEdit&id={sid_list}" target="dialog" mask="true" width="600" height="400" title="编辑客户端版本" warn="请选择版本"><span>编辑</span></a></li>
			<li><a class="delete"  href="//admin.do?method=reloadCacheList&type=versionlist" target="ajaxTodo" title="确定要缓存数据加载?" warn="请选择缓存数据加载"><span>缓存数据加载</span></a></li>
			<li class="line">line</li> 
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead align="center">
			<tr>
				<th>序号</th>
				<th>版本号</th>
				<th>渠道号</th>
				<th>时间</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody align="center">
		   	<c:forEach var="list" items="${pageSupport.result}" varStatus="index" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_list" rel="${list.id}">
				 <td><c:out value="${(pageSupport.currentPageNo-1)*pageSupport.pageSize+index.count}"/></td>    
				 <td>${list.version}</td>
				  <td>${list.channel}</td>
				  <td><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				  <td>
					<c:if test="${list.state eq '0'}">有效</c:if>
					<c:if test="${list.state eq '1'}"><font color="red">无效</font></c:if>
				 </td>
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

