<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://jakarta.apache.org/struts/tags-logic"%> 
<script src="web/js/modifyauth.js" type="text/javascript"></script>
<jsp:include page="/web/setop.jsp" />
<input type="hidden" id="id" value="${id}">
<div class="pageContent">
    <div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="javascript:void(0);" onclick="checks();"><span>修改</span></a></li>
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
    	<c:forEach var="usertoauthlist" items="${usertoauthlist}" varStatus="status">
	      <tr target="sid_user" rel="${usertoauthlist.id}">
				 <td width="100">
				 <c:if test="${usertoauthlist.state eq 0}">
			         <input type="checkbox" name="selectFlag" checked="checked" id="selectFlag" value="${usertoauthlist.id}">
				  </c:if>
				  <c:if test="${usertoauthlist.state ne 0}">
					    <input type="checkbox" name="selectFlag"  id="selectFlag" value="${usertoauthlist.id}">
				  </c:if>
		         </td>    
		         <td width="100"><c:out value="${usertoauthlist.id}"/></td>  
				 <td width="100"><c:out value="${usertoauthlist.name}"/></td>
				 <td width="100"><c:out value="${usertoauthlist.description}"/></td>
		 </tr>
	   </c:forEach>
	 </tbody>
	 </table>
</div>