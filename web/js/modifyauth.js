	 function checks(){
      			var param = new Array();
     		    $("input[type='checkbox']:checked").each(function(i,o){ 
    		    if($(this).attr("checked")){ 
                   param +=$(this).val()+","; 
                }   
                });
                
                 alert("param="+param)
                if(param.length==0){
                   param =",";
                 }
                var title=document.getElementById("id").value;
                   $.post("authority.do?method=usertoauth",{
                    id:title,
                    param:param
	            },function(data){
		             var xmlText=$(data).find("message").text();
	                 alert("修改成功！");
		        }
		      );
   }
   
   function GetQueryString(sProp){   
    var re = new RegExp("[&,?]"+sProp + "=([^\\&]*)", "i");
    alert(document.location.search);   
    var a = re.exec(document.location.search);   
    if (a == null)   
        return "";   
    return a[1];   
   } 