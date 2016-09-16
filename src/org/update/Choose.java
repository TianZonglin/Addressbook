package org.update;
import java.sql.*;   
import java.util.ArrayList;
import java.util.Map;

import org.bean.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class Choose extends ActionSupport{ 
	private static String idt;
	
	public String getIdt(){
		return idt;
	}
	
	public void setIdt(String idt){
		this.idt = idt;
	}
	
	public String execute() throws Exception{
		Map attribute=ActionContext.getContext().getSession();
	
		DbBean db=new DbBean();
        System.out.println(idt);
        ArrayList<String> small = new ArrayList<String>();
        ResultSet rr = null;
        String sql = "select * from book_info where `Id` = '"+idt+"' ";
		try{
			rr = db.executeQuery(sql);
			while(rr.next()){
				for(int i=3;i<=9;i++){
					small.add(rr.getString(i));	
				}

			}
          
		}catch(Exception e){
			e.printStackTrace();
			
		}
		for(int i=0;i<small.size();i++){System.out.println("---"+small.get(i));}
		attribute.put("small",small);
		attribute.put("idnum",idt);
		rr.close();
		db.close();
		return SUCCESS;
			
	}	

}






