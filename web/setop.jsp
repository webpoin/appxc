<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="com.jmsht.vo.AdminUserInfo"%>
<%
String islogin = AdminUserInfo.isLogin(request);
System.out.println(AdminUserInfo.getUserCode(request)+",islogin:"+islogin);
if(islogin.equals("no")){
%>
 <jsp:forward page="/webindex.shtml" />       
<%}%>
