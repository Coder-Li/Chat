package org.InterChat.Action;

import javax.servlet.http.HttpServletRequest;

import org.InterChat.dao.Dao;
import org.apache.struts2.ServletActionContext;

public class LogOutAction {
	public String logOut(){
		Dao dao = new Dao();
		HttpServletRequest requset = ServletActionContext.getRequest();
		dao.lgout(requset.getAttribute("username").toString());
		requset.removeAttribute("username");
		return "success";
	}
}
