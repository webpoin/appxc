<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<script type="text/javascript">
	function getMenu(){
	    var count = 0;
		var j = 0;
		for (var i = 0; i < document.getElementsByName("selectFlag").length; i++) {
			if (document.getElementsByName("selectFlag")[i].checked) {
				j = i;
				count++;
			}
		}
		if (count == 0) {
			alert("请选择需要查看的权限！");
			return false;
			
		}
		else if (count > 1) {
			alert("一次只能查看一个权限！");
			return false;
			
		}
		else if (count == 1) {
			  window.open('/web/authority/authtomenulist.jsp?id='+document.getElementsByName("selectFlag")[j].value, '权限对应菜单', 'width=600, height=550, scrollbars=yes')
			                     
		}
		
	}
</script>
<jsp:include page="/web/setop.jsp" />
<form id="pagerForm" method="post" action="authority.do?method=authoritylist" onsubmit="return validateCallback(this, navTabAjaxDone)">
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
			<li><a class="add" href="/web/authority/addauthority.jsp" target="dialog" mask="true" title="添加权限"><span>添加</span></a></li>
			<li><a class="delete" href="authority.do?method=removeauthority&id={sid_user}&status=0" target="ajaxTodo" title="确定要注销吗?" warn="请选择权限"><span>注销</span></a></li>
            <li><a class="edit" href="javascript:void(0)" onclick="getMenu();"><span>查看菜单</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
			    <th width="100">状态</th>  
				<th width="100">权限ID</th>
				<th width="100">权限名称</th>
				<th width="100">权限描述</th>
			</tr>
		</thead>
		<tbody>
		    <c:forEach var="authoritylist" items="${pageSupport.result}" varStatus="status" begin="${pageSupport.currentPageNo*pageSupport.pageSize-pageSupport.pageSize}" end="${pageSupport.currentPageNo*pageSupport.pageSize-1}">
			  <tr target="sid_user" rel="${authoritylist.id}">
			     <td width="100"><input type="checkbox" name="selectFlag" id="selectFlag" value="${authoritylist.id}"></td>
				 <td width="100"><c:out value="${authoritylist.id}"/></td>    
				 <td width="100"><c:out value="${authoritylist.name}"/></td>
				 <td width="100"><c:out value="${authoritylist.description}"/></td>
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
