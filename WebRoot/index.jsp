<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>AddressBook</title>
     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 
	<link rel="stylesheet" type="text/css" href="style.css">
 
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

 function checkLogin(){

  	var uname = $("#username").val();
  	var pw = $("#password").val();
  alert(uname);
 alert(pw); 	

  	
  	//alert(uname);
  	//检查输入内容格式
  	if(uname==""||pw=="")
  	{
  		alert("用户名和密码不能为空");
  		return false;
  	}
  	
  	
  	  	var faultAddr = encodeURI(uname);                    //关键代码
       faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码
  	
    var flag = false;
    $.ajax({
		type : "post",
		async:false,
		url : "checklogin.action?username="+faultAddr+"&password="+pw,
		success : function(result) {
			if(result=="failure"){
				alert("用户名或密码错误");
			}else{
				flag = true;
			}
		},
		failure:function(){
		}
     });
  return flag;
  }





</script>



</head>
<body>
 
  <%@ include file="head.jsp"%>
  <div style="margin-left:0px;margin-right:0px;">
   
    <div class="main1" style="height:350px;">
     <image style="margin-top:50px;margin-left:346px; float:left;" src="/addressbook/image/ind2.jpg" >
     
     </image>
    <div  style="width:20%; height:220px; background:gray;float:right;margin-top:50px;margin-left:0px;margin-right:322px;" >
    	<div id="title" style="color:white;margin-top:30px;font-size:15">&nbsp;&nbsp;Address Book Version 1.0  </div></br>
    	<form action="login.action" method="post" onsubmit="return checkLogin();">
        <div class="mima" >
	    	<span style="color:white;margin-bottom:1px;">用户名：</span><input name="username" id="username" class="input" style="border-top:solid 3px #808080;width:140px;border-bottom:solid 3px #E8E8F8;border-left:solid 3px #ABABAB;border-right:solid 3px  #ABABAB;"/></br>
	    </div><div class="mima"  >
	    	<span style="color:white">密码：</span><input name="password" id="password" class="input" style="border-top:solid 3px #808080;width:140px;border-left:solid 3px #ABABAB;border-bottom:solid 3px #E8E8F8;border-right:solid 3px  #ABABAB;"/>
	   	 </div><div class="mima"  >
	   		</br><input type="submit" value="用户登陆" style="width:90px;height:30px" /><!--&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="注册账号"  />
	   	--></div>
		</form>
		
	</div>	
   </div>
</div>	

 
<div style="margin-left:0px;margin-right:0px;">
<div class="wrapx">
    <div style="align:center;margin-bottom:3px;font-size:8;"><span >
    </br> 
     Copyright @ 1999-2014, The Apache Software Foundation </br>   
 Apache Tomcat, Tomcat, Apache, the Apache feather, and the Apache Tomcat project logo are trademarks of the Apache Software Foundation.  
 </span></div>
</div>
</div>

<div class="footerwrapy">
</div>
<div class="footerwrapz">
</div>

  
  </body>
</html>
