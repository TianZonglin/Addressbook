<%@ page contentType="text/html;charset=gbk" language="java" pageEncoding="UTF-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
 <% String user=(String)request.getSession().getAttribute("user"); 
 
 String url;
url=request.getRequestURI();
 %>



<div class="headerwrap">
    <div class="header" >
         <%if(user==null) {%>
        <a id="various1" href="/addressbook/index.jsp">LOGIN</a><%}else{ %><span style="color:white;" >welcome , </span><span style="color:white;" >${user}</span></a><span style="color:white;" >&nbsp;|&nbsp; </span><a href="/addressbook/index.jsp">注销</a>&nbsp; &nbsp;<%}  %><br /> </div>
</div>
<div style="text-align:center;">
	<input style="width:100%;" type="image" src="/addressbook/image/header.jpg" />
	</div>
<div class="headerwrapz"></div>
<div style="text-align:center;"><div class="headerwrapline"></div></div>