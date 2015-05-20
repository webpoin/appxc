<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<HTML>
<head>
<title>权限对应菜单</title>

<script type="text/javascript" src="/web/js/jquery-1.7.2.min.js"></script> 
 <link rel="StyleSheet" href="/web/js/dtree.css" type="text/css" /> 
      
    <script type="text/javascript" src="/web/js/wtree.js"></script>
   
<script type="text/javascript">   
    tree = new dTree('tree','/web/images/img/system/dept/');//创建一个对象. 
    tree.config.folderLinks=true;
	tree.config.useCookies=false; 
	tree.config.check=true;
    tree.add(0,-1,"太极线后台权限菜单设置"); 
    $.ajax({   
   		  url: '/mymenu.do?method=getmenulist', 
    	  type:'post', //数据发送方式   
          dataType:'xml', //接受数据格式   
          error:function(json){  
             alert( "数据加载错误");  
          },  
    async: false ,//同步方式  
    success: function(xml){  
         $(xml).find("node").each(function(){   
        	 var nodeId=$(this).attr("nodeId");   
       		 var parentId=$(this).attr("parentId");  
        	 var hrefAddress=$(this).attr("hrefAddress");    
        	 var nodeName=$(this).text();  
        	 tree.add(nodeId,parentId,nodeName,hrefAddress,"","","","",false); 
              });  
           }     
     }); 
    check(tree);
   
    function check(tree)
    {
         var title=GetQueryString("id");
         $.ajax({   
   		 url: '/mymenu.do?method=authtomenulist&id='+title, 
    	 type:'post', //数据发送方式   
         dataType:'text', //接受数据格式   
         error:function(json){  
             alert( "数据加载错误");  
         },  
         async: false ,//同步方式  
         success: function(json){   
                   var funcs = eval("("+json+")");
                   document.write(tree);
                   tree.openAll(); 
                   for(var n=0; n<funcs.funcs.length;n++){
                   tree.co(funcs.funcs[n].menudm).checked=true;
	            }
            }  
       }); 
   }
    
   function GetQueryString(sProp)   
   {   
    	var re = new RegExp("[&,?]"+sProp + "=([^\\&]*)", "i");   
    	var a = re.exec(document.location.search);   
    	if (a == null)   
        	return "";   
   	    return a[1];   
   } 
   
function getId()
   {
        var elms = document.all("gaoyang");
        var checkId = new Array(); 
        for(var i = 0 ; i < elms.length ; i++){
        if(elms[i].checked){
            var id =elms[i].value;
            checkId += id+",";
           } 
        }
        var title=GetQueryString("id");
        if(checkId.length==0){
           checkId ="0,";
        }
        $.post("/mymenu.do?method=authtomenu",
        	 {
        	 id:title,
        	 param:checkId
        	 },
        	 function(data){
	    		alert("修改成功!");
	        })
   }
  </SCRIPT>
</HEAD>
<jsp:include page="/web/setop.jsp" />
<BODY >
<input type="button" name="button" value="修改" onclick="getId()"/>
</BODY></HTML>