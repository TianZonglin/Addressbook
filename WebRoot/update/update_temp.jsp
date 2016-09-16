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

 
ArrayList<String> small = (ArrayList<String>)attribute.get("small");
 
%>

   
<style type=text/css>  
#runX {  
       visibility:hidden;       
      }  
</style>  
<script type="text/javascript">
function doupdate(str){

	alert(str);
	var faultAddr = encodeURI(str);                    //关键代码
    faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码

    window.location.href="update_temp.action?idt="+str;

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
         <div style="overflow:auto;height:420px">   
   					
   			<form action="update.action" method="post"  >      
      	         <table cellpadding="0" cellspacing="0" width="100%" align="center" class="tab1"  style="ord-break:break-all;word-wrap:break-word;margin-right:0px;margin-left:0px;"  >
				   
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
			      <td  class="tab3" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;width:4%"  bgcolor="#CFEEF8" ><h3>&nbsp;>></h3></td> 
   				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="name" id="name" value="&nbsp;<%=small.get(0) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="phonenum" id="phonenum" value="&nbsp;<%=small.get(1) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="address" id="address" value="&nbsp;<%=small.get(2) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="workplace" id="workplace" value="&nbsp;<%=small.get(3) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="mailaddress" id="mailaddress" value="&nbsp;<%=small.get(4) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="mobilephone" id="mobilephone" value="&nbsp;<%=small.get(5) %>"/></td>
				  <td class="tab3"> <input class="input1" type="text" style="border:0px;width:100%;color:red;" name="more" id="more" value="&nbsp;<%=small.get(6) %>"/></td>
 				 </tr> 
      			</table>
      		 
      			<div align="center" ></br><input type="submit" value="提交"  style="width:75px;height:30px"/></div>
      		</form> 

      		 
  </div>
  
      	
      	
      	  
      	</div>
                        
    </div>
  <%@ include file="../footer.jsp"%>
  </body>
</html>
