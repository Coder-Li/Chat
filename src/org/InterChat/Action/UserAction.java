package org.InterChat.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.InterChat.dao.Dao;
import org.InterChat.data.User;
import org.apache.struts2.ServletActionContext;

public class UserAction {
	public void getUserInfo() {
		User user = new User();
		HttpServletRequest requset = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String username = requset.getParameter("username");
		Dao dao = new Dao();
		user = dao.getUserInfo(username);
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter pt = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append(user.getUsername() + "," + user.getCity() + ","
					+ user.getSex() + "," + user.getMeCount());
			pt.print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void getUserList() {
		HttpServletResponse response = ServletActionContext.getResponse();
		Dao dao = new Dao();
		ArrayList<String> names = dao.getUserList();
		try {
			PrintWriter pt = response.getWriter();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < names.size(); i++) {
				if (i != 0)
					sb.append(",");
				sb.append(names.get(i));
			}
			if (names.size() != 0)
				pt.print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
