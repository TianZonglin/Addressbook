package org.check;

import java.io.PrintWriter;
import java.net.URLDecoder; //关键代码
import java.sql.ResultSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.bean.DbBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
 

public class CheckLogin extends ActionSupport{
	private String username;
	private String password;
	private String url;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String execute() throws Exception{
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		DbBean db=new DbBean();
		String sql="select * from user where `username` = '"+username+"';";
		ResultSet rs=null;
		try{
		rs=db.executeQuery(sql);
		while(rs.next()){
			writer.write("failure");
			return null;
		}
		    writer.write("success");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return null;
	}
	
	public String checkLogin()throws Exception{
		Map attribute=ActionContext.getContext().getSession();

		
		username = URLDecoder.decode(username , "utf-8");  //关键代码
		System.out.println("checkLogin()#####username######-->"+username);
		System.out.println("checkLogin()#####password######-->"+password);
		
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		DbBean db=new DbBean();
		String sql="select * from user where `username` = '"+username+"' and `password`='"+password+"';";
		ResultSet rs=null;
		try{
		rs=db.executeQuery(sql);
		while(rs.next()){
			attribute.put("username",username);
			writer.write("success");
			return null;
		}
		    writer.write("failure");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return null;
			
	}
	
	

	
	
	public String login()throws Exception{
		System.out.println("login()#####username######-->"+username);
		System.out.println("login()#####password######-->"+password);
		Map attribute=ActionContext.getContext().getSession();
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); 
		
		
		DbBean db=new DbBean();
		String sql="select * from user where `username` = '"+username+"' and `password` = '"+password+"' ;";
		System.out.println(sql);
		ResultSet rs=null;
 
		try{			
			rs=db.executeQuery(sql);
			if(rs.next()){
				attribute.put("user",username);
 
			}else{
				attribute.put("user",null);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		//url=url.substring(8);
		System.out.println("/");
		//request.getRequestDispatcher(url).forward(request,response);

		return SUCCESS;
			
	}	
	
	
	
	

}
