package org.delete;
import java.sql.*;   
import java.util.ArrayList;
import java.util.Map;

import org.bean.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class Delete extends ActionSupport{ 
	private static String id;
	
	public String getId(){
		return id;
	}
	
	public void setId(String id){
		this.id = id;
	}
	
	public String execute() throws Exception{
		Map attribute=ActionContext.getContext().getSession();
	
		DbBean db=new DbBean();
        System.out.println(id);
	    String sql="delete  from book_info where `Id` = '"+id+"'";
	    String ss = "flush privileges";
	    
	    ResultSet rs = null;
	    ArrayList<String> del_mark = new ArrayList<String>();
	    ArrayList<String> del_afterdata = new ArrayList<String>();
	    String sqlt = "select * from book_info where `User` = '"+attribute.get("username")+"' ";
		try{
			db.executeUpdate(sql); 
			db.executeUpdate(ss);
			rs=db.executeQuery(sqlt);
            while(rs.next()){
            	 del_mark.add(rs.getString(1)); 
            	 for(int i=3;i<=8;i++){
            		 del_afterdata.add(rs.getString(i)); 
            	 }
            }
          
		}catch(Exception e){
			e.printStackTrace();
			
		}
		rs.close();
		db.close();
 
		attribute.put("del_afterdata",del_afterdata);
		attribute.put("del_mark",del_mark);
		return SUCCESS;
			
	}	

}






