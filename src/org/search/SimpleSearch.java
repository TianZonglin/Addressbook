package org.search;
import java.sql.*;   
import java.util.ArrayList;
import java.util.Map;

import org.bean.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class SimpleSearch extends ActionSupport{ 
	private String inputer;
 
	public String getInputer() {
		return inputer;
	}

	public void setInputer(String inputer) {
		this.inputer = inputer;
	}
 
	
	public String execute() throws Exception{
		Map attribute=ActionContext.getContext().getSession();
		
		DbBean db=new DbBean();
	
		String sql = "select * from `book_info` where `Name` like '%"+inputer+"%'  and `User` = '"+attribute.get("username")+"'";
 
		System.out.println(sql);
		ResultSet rs=null;
		ArrayList<String> newdata = new ArrayList<String>(); 
 
 		try{
 
			rs=db.executeQuery(sql);
 
            while(rs.next()){
 
	           	for(int i=3;i<=8;i++){
	           		newdata.add(rs.getString(i)); 
	           	}
           }
            for(int i=0;i<newdata.size();i++){System.out.println(newdata.get(i));} 
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
	    	rs.close();
			db.close();
		}

		attribute.put("result",newdata);
 
		return SUCCESS;
			
	}	

}






