package org.add;
import java.sql.*;   
import java.util.ArrayList;
import java.net.URLDecoder; 

 

import java.io.PrintWriter;
import java.net.URLDecoder; //关键代码
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.bean.DbBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
 

public class Add_write extends ActionSupport{
 
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
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		Map attribute=ActionContext.getContext().getSession();
	
		DbBean db=new DbBean();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+name+"   "+phonenum+"   "+address+"   "+workplace+"   "+mailaddress+"   "+mobilephone+"   "+more);
		name = URLDecoder.decode(name , "utf-8");  //关键代码
		phonenum = URLDecoder.decode(phonenum , "utf-8");  //关键代码
		address = URLDecoder.decode(address , "utf-8");  //关键代码
		workplace = URLDecoder.decode(workplace , "utf-8");  //关键代码
		mailaddress = URLDecoder.decode(mailaddress , "utf-8");  //关键代码
		mobilephone = URLDecoder.decode(mobilephone , "utf-8");  //关键代码
		more = URLDecoder.decode(more , "utf-8");  //关键代码
		 
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+name+"   "+phonenum+"   "+address+"   "+workplace+"   "+mailaddress+"   "+mobilephone+"   "+more);

		 
			
		String sql = "insert into book_info(`User`,`Name`,`PhoneNum`,`Address`,`WorkPlace`,`MailAddress`,`MobilePhn`,`More`) "
				   + "values('"+attribute.get("username")+"','"+name+"','"+phonenum+"','"+address+"','"+workplace+"','"+mailaddress+"','"+mobilephone+"','"+more+"') ";	
		System.out.println(sql);
		 	  
		String ss = "flush privileges";
		String sqlt="select * from book_info where `User` = '"+attribute.get("username")+"';";
		System.out.println(sqlt);
		ResultSet rs=null;
		ArrayList<String> newdata = new ArrayList<String>(); 
		try{
			db.executeUpdate(sql);
			db.executeUpdate(ss);
			rs=db.executeQuery(sqlt);
            while(rs.next()){
            	 for(int i=3;i<=8;i++){
            		 newdata.add(rs.getString(i)); 
            	 }
            }
            //for(int i=0;i<newdata.size();i++){System.out.println(newdata.get(i));}
		}catch(Exception e){
			e.printStackTrace();
			
		}
		rs.close();
		db.close();
		attribute.put("newdata",newdata);
		return SUCCESS;
			
	}	

}

