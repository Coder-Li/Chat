package org.InterChat.Action;



import javax.servlet.http.HttpServletRequest;


import org.InterChat.dao.Dao;
import org.InterChat.data.User;
import org.apache.struts2.ServletActionContext;


public class Action {
	private User user;
	public User getUser(){
		return user;
	}
	public void setUser(User user){
		this.user = user;
	}
	//注册、添加用户
	public String addUser(){
		boolean result = false;
		String re = "";
		Dao dao = new Dao();
		result = dao.addUser(user);
		if(result){
			re  = "success";
		}
		else{
			re = "fail";
		}
		HttpServletRequest requset = ServletActionContext.getRequest();
		requset.setAttribute("flag1", re);
		return re;
	}
	
	//用户登录
	public String login(){
		boolean result = false;
		Dao dao = new Dao();
		result = dao.login(user);
		if(result){
			HttpServletRequest requset = ServletActionContext.getRequest();
			requset.setAttribute("username", user.getUsername());
			requset.setAttribute("flag10", "yes");
			return "success";
		}
		else{
			return "fail";
		}
		
	}
}
