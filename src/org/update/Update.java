package org.update;
import java.sql.*;   
import java.util.ArrayList;
import java.util.Map;

import org.bean.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class Update extends ActionSupport{ 
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
	
		if(name.equals("")||name==null){name="-";}
		if(phonenum.equals("")||phonenum==null){phonenum="-";}
		if(address.equals("")||address==null){address="-";}
		if(workplace.equals("")||workplace==null){workplace="-";}
		if(mailaddress.equals("")||mailaddress==null){mailaddress="-";}
		if(mobilephone.equals("")||mobilephone==null){mobilephone="-";}
		if(more.equals("")||mobilephone==null){mobilephone="-";}
		 
			
		String sql = "update `book_info` "
				   + "set `Name` = '"+name+"' "
				   	  + ", `PhoneNum` = '"+phonenum+"'"
				      + ", `Address` = '"+address+"'"
				      + ", `WorkPlace` = '"+workplace+"'"
				      + ", `MailAddress` = '"+mailaddress+"'"
				      + ", `MobilePhn` = '"+mobilephone+"'"
				      + ", `More` = '"+more+"' "
				   + "where `Id` = '"+attribute.get("idnum")+"' " ;
		System.out.println(sql);
		 	  
		String ss = "flush privileges";
		String sqlt="select * from book_info where `User` = '"+attribute.get("username")+"';";
		System.out.println(sqlt);
		ResultSet rs=null;
		ArrayList<String> newdata = new ArrayList<String>(); 
		ArrayList<String> newmark = new ArrayList<String>();
		try{
			db.executeUpdate(sql);
			db.executeUpdate(ss);
			rs=db.executeQuery(sqlt);
            while(rs.next()){
            	newmark.add(rs.getString(1)); 
	           	for(int i=3;i<=8;i++){
	           		newdata.add(rs.getString(i)); 
	           	}
           }
            for(int i=0;i<newdata.size();i++){System.out.println(newdata.get(i));}
		}catch(Exception e){
			e.printStackTrace();
			
		}
		rs.close();
		db.close();
		attribute.put("uptdata",newdata);
		attribute.put("uptmark",newmark);
		return SUCCESS;
			
	}	

}






