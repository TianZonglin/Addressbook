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
<style type="text/css">
	#logins  #title{font-size:30px;font-family:Microsoft YaHei;text-align:left;}
	#logins  #zhuchequ{width:80px;height:40px;}
	#logins  #zhuchequ :hover{color:rgb(63, 193, 250);}
	#logins  #input{width:122px;height:30px;background:#62a618;border:solid 1px;color:#f8f5ee;font-size:14px;border-radius:5px 5px 5px 5px;}
	#logins  #input:hover{background:rgb(63, 193, 250);}	
	.tab1 { border:1px solid #000000; margin-top:10px;align:center ; }

	.tab2 { border:1px solid #000000; margin-top:10px;}
	.tab3 { border:1px solid #000000; margin-top:0px;align:center ; width:12%;}
</style>
<script type="text/javascript" language="javascript">  
function xx(value){
    var selectedOption=value.options[value.selectedIndex];  
	//alert("快速名字检索");
	//alert(selectedOption.value);
	if(selectedOption.value=="1"){
		document.getElementById('cnta').innerHTML='</br></br>'
		        +'<span style="font-size:15px;color:red;">* 姓名检索，请输入完整或部分姓名</span></br> '
				+'<input name="inputer" id="inputer" style="height:26px;margin-top:5px;"/>'
				+'<input type="submit" style="height:26px;"/>'; 	 
 		document.getElementById('cntb').innerHTML='';
 		document.getElementById('cntc').innerHTML='';
 	}else if(selectedOption.value=="2"){
		document.getElementById('cntb').innerHTML='</br></br>' 
      	              	+'<span style="font-size:15px;color:red;">* 您可以输入相应关键字进行搜索</span></br> '
						+'<span style="font-size:15px;color:red;margin-top:2px;margin-left:0px;" >* 每一项关键字可为空，关键字越少越全面，越多越精确 </span>'                        
						+'<table cellpadding="5" cellspacing="5" border="0" width="300px;"    style="ord-break:break-all;word-wrap:break-word;" >'
      			        +'<tr><td style="border:5;"><span style="font-size:15px;float:right">Name </span></td><td><input type="text" style="width:100%" name="name" id="name"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">PhoneNum </span></td><td><input type="text" style="width:100%" name="phonenum" id="phonenum"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">Address </span></td><td><input type="text" style="width:100%" name="address" id="address"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">WorkPlace </span></td><td><input type="text" style="width:100%" name="workplace" id="workplace"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">MailAddress </span></td><td><input type="text" style="width:100%" name="mailaddress" id="mailaddress"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">MobilePhone </span></td><td><input type="text" style="width:100%" name="mobilephone" id="mobilephone"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">More </span></td><td><input type="text" style="width:100%" name="more" id="more"  /></td></tr>'
				  		+'<tr><td><span style="font-size:15px;float:right">Operation </span></td></td><td><input type="image" style="width:100%" name="more" id="more"  /></td></tr>'
      	              +'</table>'

		document.getElementById('cnta').innerHTML='';
 		document.getElementById('cntc').innerHTML='';
 	}else if(selectedOption.value=="3"){
 		document.getElementById('cnta').innerHTML='';
 		document.getElementById('cntb').innerHTML='';
 		document.getElementById('cntc').innerHTML='</br></br><a style="font-size:15px;float:left;color:red;">* 完 善 中 ... ...</a>';
 	}
}
function yy(){
alert("xxx");
}
</script>






  </head>  
  <body>
 
   <%@ include file="header.jsp"%>
  	<%@ include file="left.jsp"%>
    <div class="main"  >
		<%@ include file="middle.jsp"%>

      				<div style="float:left;margin-left:20px;margin-top:20px;">
      					<select style="height:25px;width:160px;" onclick="xx(this)"> 
      						<option value="err" selected>选择查找方式</option>
      						<option value="1" >简单查询</option>
      						<option value="2" >模糊检索</option>
      						<option value="3" >高级搜索</option>
      					</select>
      					
      				 <div style="align:center;"> 
      				   
      				   <form action="simple.action" method="post" > 
      						<div id="cnta"></div>
      			       </form>				
                     </div>


                     <div style="align:center;margin-left:0px;"> 
      				   <form action="complex.action" method="post" > 
      						<div id="cntb"></div>
      			       </form>	      				 
      				 
      				 
      				<div style="align:center;margin-left:0px;"> 
      				 
      						<div id="cntc"></div>
      			         
      				 
      				 
      				 
      				 </div>
      				

      					
      				</div>
 </div>                       
    </div>
  <%@ include file="footer.jsp"%>
 
 
  </body>
</html>
