package org.common;

import java.io.PrintWriter;
import java.net.URLDecoder;  //关键代码
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

 
import org.bean.DbBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
 

public class AllTable extends ActionSupport{
	private String username;
	 

 

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public String execute() throws Exception{
		username = URLDecoder.decode(username , "utf-8");  //关键代码
		System.out.println("AllTable()#####username######-->"+username);

		Map attribute=ActionContext.getContext().getSession();
		DbBean db=new DbBean();
		String sql="select * from book_info where `User` = '"+username+"';";
		ResultSet rs=null;
		ArrayList<String> data = new ArrayList<String>(); 
		ArrayList<String> mark = new ArrayList<String>();
		try{			
			rs=db.executeQuery(sql);
            while(rs.next()){
            	 mark.add(rs.getString(1)); 
            	 for(int i=3;i<=8;i++){
            		 data.add(rs.getString(i)); 
            	 }
            }
           // for(int i=0;i<data.size();i++){System.out.println(data.get(i));}
		}catch(Exception e){
			e.printStackTrace();
			
		}
		rs.close();
		db.close();
		
		attribute.put("data",data);
		attribute.put("mark",mark);
		return SUCCESS;
			
	}	
	
	
	
	

}
