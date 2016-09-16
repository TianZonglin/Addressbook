package org.search;
import java.sql.*;   
import java.util.ArrayList;
import java.util.Map;

import org.bean.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class ComplexSearch extends ActionSupport{ 
	private String name;
	private String phonenum;
	private String address;
	private String workplace;
	private String mailaddress;
	private String mobilephone;
	private String more;

 

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getMailaddress() {
		return mailaddress;
	}

	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getMore() {
		return more;
	}

	public void setMore(String more) {
		this.more = more;
	}
	
	public String execute() throws Exception{
		Map attribute=ActionContext.getContext().getSession();
		
		DbBean db=new DbBean();
		
		ArrayList<String> thing = new ArrayList<String>(); 
		thing.add(name);thing.add(phonenum);thing.add(address);thing.add(workplace);thing.add(mailaddress);thing.add(mobilephone);thing.add(more);
		
		ArrayList<String> head = new ArrayList<String>();
		head.add("Name");head.add("PhoneNum");head.add("Address");head.add("WorkPlace");head.add("MailAddress");head.add("MobilePhn");head.add("More");
		
		if(name.equals("")&&name==null){
			thing.remove(name);head.remove("Name");
			}
		if(phonenum.equals("")&&phonenum==null){
			thing.remove(phonenum);head.remove("PhoneNum");
			}
		if(address.equals("")&&address==null){
			thing.remove(address);head.remove("Address");
			}
		if(workplace.equals("")&&workplace==null){
			thing.remove(workplace);head.remove("WorkPlace");
			}
		if(mailaddress.equals("")&&mailaddress==null){
			thing.remove(mailaddress);head.remove("MailAddress");
			}
		if(mobilephone.equals("")&&mobilephone==null){
			thing.remove(mobilephone);head.remove("MobilePhn");
			}
		if(more.equals("")&&more==null){
			thing.remove(more);head.remove("More");
			}

	
		String sql = "select * from `book_info` where `"+head.get(0)+"` like '%"+thing.get(0)+"%' " ;
		for(int i=1;i<head.size();i++){
			sql += " and `"+head.get(i)+"` like '%"+thing.get(i)+"%'";
		}
		sql += " and `User` = '"+attribute.get("username")+"'" ;
 
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

		attribute.put("moreresult",newdata);
 
		return SUCCESS;
			
	}	

}
 