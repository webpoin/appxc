<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
String username = "";
if (request.getParameter("username") != null && !request.getParameter("username").equals(""))
	username = request.getParameter("username").trim();
session.removeAttribute("USER_INFO");  //remove session
//System.out.println("Username:"+username);
%>
<html>
<script src="/web/themes/js/jquery-1.4.2.js" type="text/javascript"></script>
  <script language="JavaScript">
<!--
function toLogin()
{
	if(checkData())
	{
		document.frmAction.action ="/sp/SPLogin";
		document.frmAction.submit();
	}
	return false;
}
	//function reloadCode(){
		//$("#authImg").attr("src","authImg?type=adminLoginCode&id="+Math.random());
	//}
	function reloadCode(){
		$("#authImg").attr("src","authImg?type=adminLoginCode&id="+Math.random());
	}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script language="JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}


//-->
</script>
<Script>
function CheckTelcode(object)
{
	//alert("aa"+document.frmAction.username.value);
    var len=document.frmAction.username.value.length;
    if (len==0 )
    {   
       alert("帐号不能为空，请输入！");
       return(false);
    }
    len=document.frmAction.password.value.length;   
    if (len==0 )
    {   
       alert("密码不能为空，请输入！");
       return(false);
    }
	   var i = 0; 
    for(i;i<len;i++)
	{
		if(object.value.charAt(i) == '<')
		{
			alert("不允许输入<符号!");
			return false;
		}
		if(object.value.charAt(i) == '>')
		{
			alert("不允许输入>符号!");
			return false;
		}
		if(object.value.charAt(i) == '/')
		{
			alert("不允许输入/符号!");
			return false;
		}
		if(object.value.charAt(i) == '\\')
		{
			alert("不允许输入\\符号!");
			return false;
		}
		if(object.value.charAt(i) == '\"')
		{
			alert("不允许输入\"符号!");
			return false;
		}
		if(object.value.charAt(i) == ',')
		{
			alert("不允许输入,符号!");
			return false;
		}
		if(object.value.charAt(i) == "'")
		{
			alert("不允许输入单引号!");
			return false;
		}
		if(object.value.charAt(i) == "|")
		{
		alert("不允许输入竖!");
			return false;
		}
		if(object.value.charAt(i) == "%")
		{
		alert("不允许输入百分号!");
			return false;
		}
		if(object.value.charAt(i) == "(")
		{
		alert("不允许输入左括号!");
			return false;
		}
		if(object.value.charAt(i) == ")")
		{
		alert("不允许输入右括号!");
			return false;
		}
		if(object.value.charAt(i) == "=")
		{
		alert("不允许输入=");
			return false;
		}
  		}
    return(true);    
}
</Script>
<style type="text/css">
<!--
.style3 {
	color: #00FFFF;
	text-decoration: underline;
}
.style20 {
	font-weight: bold;
	font-size: 12pt;
}
-->
</style>
<head>
<title>欢迎使用安淘惠.异业联盟.通用积分后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="web/style/ziwuxian.css">
<link href="favicon.ico" rel="shortcut icon" />
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
   <form name=frmAction method=post action="main.shtml">
   <input type="hidden" name="ua" value="${ua}"/>
<div align="center">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr align="center" valign="middle">
      <td class="shou_ye_beijing">
       <div align="right">
   <table>
  <tr>
    <td height="70">
    &nbsp;
    </td>
  </tr>
   </table></div><br><br>

        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
           <td class="shou_ye_001" width="21"></td>
            <td class="shou_ye_002" width="350">&nbsp;</td>
            <td width="90" class="shou_ye_003">&nbsp;</td>
            <td width="82" class="shou_ye_004">&nbsp;</td>
            <td class="shou_ye_005" width="18">&nbsp;</td>
          </tr>
        </table>
        <table width="760" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="shou_ye_006" width="19"></td>
            <td class="shou_ye_beijing_se" align="center">
              <table width="710" border="0" cellspacing="0" cellpadding="0" height="317">
                <tr align="center">
                  <td class="shou_ye_011">
                    <table width="340" border="0" cellspacing="0" cellpadding="0" bordercolor="#3333FF" class="fontt">
                    <tr>
                        <td align="right" class="cont"></td>
                        <td>${username}</td>
                      </tr>
                      <tr>
                        <td width="136" align="right" class="cont" height="42">用户名：</td>
                        <td width="251" >
                          <input type="text" name="username" maxlength="20" title="请输入用户名" value="<%=username%>" size="18" tabindex=1 autocomplete="off"/>
                        </td>
                      </tr>
                      <tr>
                        <td width="136" align="right" class="cont" height="31">密码：</td>
                        <td width="251" >
                          <input type="password" name="password" maxlength="20" title="请输入密码" size="18" tabindex=2 autocomplete="off"/>
                        </td>
                      </tr>                        
                         <tr>
                        <td width="136" align="right" class="cont" height="42" autocomplete="off"/>授权码：</td>
                        <td width="251" >
                          <input name="regimg" type="text" size="18" title="请输入验证码" maxlength="20"/><img src="authImg?type=adminLoginCode" title="点击刷新" id="authImg" onclick="reloadCode();"/>   
                        </td>
                      </tr>
                      
                      <!--@CheckItem@ OPT-TanYi-20030814 修改附加码生成方式，加强安全性-->
                      <tr align="center">
                        <td colspan="2">
                          <table border="0" class="font10" width="183">
                            
                            <tr align="center">
                              <td align="right" width="68">
                               <input type="submit" name="Submit22" title="登录系统" value="登 录" onclick="return CheckTelcode(document.frmAction.username)" class="button" target="mainFrame">
                              </td>
                              <td width="105">
                                <input type=Reset name = "reset" title="点击取消" value = "取 消" class="button" target="mainFrame">
                              </td>

                            </tr>
                            
                            <tr align="center">
                              <td colspan="2" height="34">&nbsp;</td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
            <td width="19" class="shou_ye_007"></td>
          </tr>
        </table>
        <table width="760" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="shou_ye_008">&nbsp;</td>
            <td class="shou_ye_009" align="right">
              <table align="center" border="0" cellspacing="2" cellpadding="0">
                <tr>
                  <td align="center">版权所有&copy;深圳市安子支付科技有限公司</td>
                </tr>
              </table>
            </td>
            <td class="shou_ye_010">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table></div>
  </form>
  
</body>
</html>
