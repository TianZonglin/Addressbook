<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>

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


<%
Map attribute=ActionContext.getContext().getSession();
String users = (String)attribute.get("username");
System.out.println(users);
    if(users==null) {  
%>  
        <script type="text/javascript" language="javascript">  
            alert("您还没有登录，请登录...");  
            window.document.location.href="../addressbook/index.jsp";  
        </script>   
<%  
    }  
%> 

<%

 
ArrayList<String> data = (ArrayList<String>)attribute.get("data");
 
%>


<script type="text/javascript">

function getExplorer() {
	var explorer = window.navigator.userAgent ;
	 
	if (explorer.indexOf("MSIE") >= 0) {
		alert("ie");
	}else if (explorer.indexOf("Firefox") >= 0) {
		alert("Firefox");
	}else if(explorer.indexOf("Chrome") >= 0){
		alert("Chrome");
	}else if(explorer.indexOf("Opera") >= 0){
		alert("Opera");
	}else if(explorer.indexOf("Safari") >= 0){
		alert("Safari");
	}
}

function transform(){
	alert("XXXXXX");
    var name = $("#name").val();  	
  	var phonenum = $("#phonenum").val();
    var address = $("#address").val();	
  	var workplace = $("#workplace").val();
    var mailaddress = $("#mailaddress").val();
  	var mobilephone = $("#mobilephone").val();
  	var more = $("#more").val();
	alert(name);
	
			
	if(name==""||name==null){name="-";}
	if(phonenum==""||phonenum==null){phonenum="-";}
	if(address==""||address==null){address="-";}
	if(workplace==""||workplace==null){workplace="-";}
	if(mailaddress==""||mailaddress==null){mailaddress="-";}
	if(mobilephone==""||mobilephone==null){mobilephone="-";}
	if(more==""||more==null){more="-";}
	
	var a = encodeURI(name);                   
    	a = encodeURI(a);  //需要通过两次编码       关键代码
    
    var b = encodeURI(phonenum);                   
    	b = encodeURI(b);  //需要通过两次编码       关键代码
    
    var c = encodeURI(address);                    
    	c = encodeURI(c);  //需要通过两次编码       关键代码
    
    var d = encodeURI(workplace);                  
    	d = encodeURI(d);  //需要通过两次编码       关键代码
    
    var e = encodeURI(mailaddress);                  
    	e = encodeURI(e);  //需要通过两次编码       关键代码
    
    var f = encodeURI(mobilephone);                  
    	f = encodeURI(f);  //需要通过两次编码       关键代码
    
    var g = encodeURI(more);                  
    	g = encodeURI(g);  //需要通过两次编码       关键代码

   
   	var explorer = window.navigator.userAgent ;
	 
	if (explorer.indexOf("MSIE") >= 0) {
		alert("ie");
		window.location='add.action?name='+a+'&phonenum='+b+'&address='+c+'&workplace='+d+'&mailaddress='+e+'&mobilephone='+f+'&more='+g;
		alert(window.location);
	}else if (explorer.indexOf("Firefox") >= 0) {
		alert("Firefox");
		window.location='add.action?name='+a+'&phonenum='+b+'&address='+c+'&workplace='+d+'&mailaddress='+e+'&mobilephone='+f+'&more='+g;
		alert(window.location);
	}else if(explorer.indexOf("Chrome") >= 0){
		alert("Chrome");
	}else if(explorer.indexOf("Opera") >= 0){
		alert("Opera");
	}else if(explorer.indexOf("Safari") >= 0){
		alert("Safari");
	}
   
   
   
   
   


}
</script>



  </head>
  
  <body>
 <%@ include file="../header.jsp"%>
<%@ include file="../left.jsp"%>
    <div class="main" >
      		<%@ include file="../middle.jsp"%>
					
      				<div class="page">
      				<div><span class="pagetext"><h3>Current Infomation</h3></span></div>
         <div style="overflow:auto;height:280px">  
         <table cellpadding="0" cellspacing="0" width="100%" align="center" class="tab1"  style="ord-break:break-all;word-wrap:break-word;margin-right:0px;margin-left:0px;"  >
				   
				   <tr style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" align="center" bgcolor="#CFEEF8">	
						<td  class="tab1" style="width:4%"><h3>ID</h3></td>
						<td  class="tab1" style="width:12%"><h3>Name</h3></td>
						<td  class="tab1" style="width:12%"><h3>PhoneNum</h3></td>
						<td  class="tab1" style="width:12%"><h3>Address</h3></td>
						<td  class="tab1" style="width:12%"><h3>WorkPlace</h3></td>
						<td  class="tab1" style="width:12%"><h3>MailAddress</h3></td>
						<td  class="tab1" style="width:12%"><h3>MobilePhone</h3></td>	
						<td  class="tab1" style="width:12%"><h3>More</h3></td>											       		  
				  </tr>
				       <%
				        int p = 0,cnt = 1;				    				        
						for(int i=0;i<data.size()/6;i++){ 				          	         
		               %>
		                   <%if(i%2!=0){ %><tr bgcolor="#CFEEF8">
		                       <td class="tab2" align="center"><%=cnt++%></td>
			                   <%for(int j= 1;j<=6;j++){ %>
						        <td class="tab2" align="center"><%=data.get(p++)%></td>
						 			<!--<a href="update.action?id=  seed.get(field.size()*i)%>">   seed.get(field.size()*i)%></a></td>-->
								 <%} %>
								<td class="tab2" align="center"><a style="color:#750075;" onclick="look( '' )" >详情</a></td> 
							   </tr> 		                   
		                 		                   
		                   <%}else{ %><tr>
		                       <td class="tab2" align="center"><%=cnt++%></td>
			                   <%for(int j= 1;j<=6;j++){ %>
						        <td class="tab2" align="center"><%=data.get(p++)%></td>
						 			<!--<a href="update.action?id=  seed.get(field.size()*i)%>">   seed.get(field.size()*i)%></a></td>-->
								 <%} %>
								
								<td class="tab2" align="center"><a style="color:#750075;" onclick="look('')" >详情</a></td>  
							   </tr> 
							   <%}  %>
					   <%} %> 
				 

			</table>
  </div>
      	<div style="margin-top:20px;"><span style="align:center;font-size:35"><h3>Add Information</h3></span></div>
      	         
      <div style="margin-right:20px;">         
      	  <form action="" method="post" onsubmit="return transform();">      
      	         <table cellpadding="0" cellspacing="0" width="100%" align="center" class="tab1"  style="ord-break:break-all;word-wrap:break-word;width=890px;"  >
				   
				   <tr style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" align="center" bgcolor="#CFEEF8">	
		                <td  class="tab3" style="width:4%" ><h3>>></h3></td>
						<td  class="tab3" style="width:12%" ><h3>Name</h3></td>
						<td  class="tab3" style="width:12%" ><h3>PhoneNum</h3></td>
						<td  class="tab3" style="width:12%" ><h3>Address</h3></td>
						<td  class="tab3" style="width:12%" ><h3>WorkPlace</h3></td>
						<td  class="tab3" style="width:12%" ><h3>MailAddress</h3></td>
						<td  class="tab3" style="width:12%" ><h3>MobilePhone</h3></td>	
						<td  class="tab3" style="width:12%" ><h3>More</h3></td>											       		  
				  </tr>
			      <tr>
			      <td  class="tab3" style="width:4%" bgcolor="#CFEEF8" ><h3>&nbsp;>></h3></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="name" id="name"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="phonenum" id="phonenum"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="address" id="address"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="workplace" id="workplace"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="mailaddress" id="mailaddress"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="mobilephone" id="mobilephone"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%" name="more" id="more"/></td>
				 </tr> 
      			</table>
      		 
      			<div align="center" > <input type="submit" value="提交"  style="margin-top:20px;width:75px;height:30px"/></div>
      		</form> 
      	
      	
      	  	</div>
      	</div>
                        
    </div>
  <%@ include file="../footer.jsp"%>
  </body>
</html>
