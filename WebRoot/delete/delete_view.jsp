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
ArrayList<String> mark = (ArrayList<String>)attribute.get("mark");
 
%>


<script type="text/javascript">
function dodelete(str){
	alert(str);
	//var faultAddr = encodeURI(str);                    //关键代码
    //faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码

    window.location.href="delete.action?id="+str;
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
						<td  class="tab1" style="width:12%"><h3>Delete</h3></td>											       		  
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
								<td class="tab2" align="center"><a style="color:red;font-size:12px" onclick="dodelete('<%=mark.get(i) %>')" ><h3>删除</h3></a></td>  
							   </tr> 		                   
		                 		                   
		                   <%}else{ %><tr>
		                       <td class="tab2" align="center"><%=cnt++%></td>
			                   <%for(int j= 1;j<=6;j++){ %>
						        <td class="tab2" align="center"><%=data.get(p++)%></td>
						 			<!--<a href="update.action?id=  seed.get(field.size()*i)%>">   seed.get(field.size()*i)%></a></td>-->
								 <%} %>
								
								<td class="tab2" align="center"><a style="color:#750075;" onclick="look('')" >详情</a></td>
								<td class="tab2" align="center"><a style="color:red;font-size:12px" onclick="dodelete('<%=mark.get(i) %>')" ><h3>删除</h3></a></td>   
							   </tr> 
							   <%}  %>
					   <%} %> 
				 

			</table>
  </div>
  
      	
      	
      	  
      	</div>
                        
    </div>
  <%@ include file="../footer.jsp"%>
  </body>
</html>
