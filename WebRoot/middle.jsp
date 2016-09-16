<!DOCTYPE HTML>
<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<script type="text/javascript"src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function add(str){
	alert(str);
	var faultAddr = encodeURI(str);                    //关键代码
    faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码

    window.location.href="all.action?username="+faultAddr ;
}
function del(str){
	alert(str);
	var faultAddr = encodeURI(str);                    //关键代码
    faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码

    window.location.href="all_delete.action?username="+faultAddr ;
}

function upt(str){
	alert(str);
	var faultAddr = encodeURI(str);                    //关键代码
    faultAddr = encodeURI(faultAddr);  //需要通过两次编码       关键代码

    window.location.href="all_update.action?username="+faultAddr ;
}
</script>

<%
String thisuser =(String)request.getSession().getAttribute("user");   
%>  
<div style="margin-left:20px;margin-right:20px;">
      			<div id="toolbar">
				<span><a href="/addressbook/first.jsp"  style="float:right;color:#EBEBEB;"><h3>首页</h3></a></span>
				<span><a onclick="add('<%=thisuser%>')" style="color:#EBEBEB;"><h3>添加联系人</h3></a></span>
				<span><a onclick="upt('<%=thisuser%>')" style="color:#EBEBEB;"><h3>修改联系人</h3></a></span>
				<span><a onclick="del('<%=thisuser%>')" style="color:#EBEBEB;"><h3>删除联系人</h3></a></span>
				<span><a href="/addressbook/statictwo.jsp" style="color:#EBEBEB;"><h3>查询联系人</h3></a></span>
				<span><a href="/addressbook/first.jsp"  style="float:left;color:#EBEBEB"><h3>更多</h3></a></span>
				 
			</div>
</div>
 
