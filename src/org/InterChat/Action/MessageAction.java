package org.InterChat.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.InterChat.dao.Dao;
import org.InterChat.data.Message;
import org.apache.struts2.ServletActionContext;


public class MessageAction {

	public void messageAction() {
		HttpServletRequest requset = ServletActionContext.getRequest();
		String me = requset.getParameter("message");
		String username = requset.getParameter("username");
		// 保存到数据库
		Dao dao = new Dao();
		if (dao.setMessage(username, me)) {
		} else {
			if (dao.setMessage(username, me)) {
			}
		}
	}
	public void getMessageAction(){
		HttpServletResponse response = ServletActionContext.getResponse();
		Dao dao = new Dao();
		Message me = new Message();
		ArrayList<Message> list_me = new ArrayList<Message>();
		list_me = dao.getMessage();
		StringBuffer sb = new StringBuffer();
		if(!list_me.isEmpty()){
//			for(int i = list_me.size() - 1  ; i >= 0 ; i--){
			for(int i = 0 ; i < list_me.size() ; i++){
				me = list_me.get(i);
				sb.append(me.getFrom_user());
				sb.append("  ");
				sb.append(me.getTime());
				sb.append(" ");
				sb.append(me.getHh()+":"+me.getMm()+":"+me.getSs());
				sb.append("\n");
				sb.append(me.getContent() + "\n");
			}
		}
		try {
			//中文要加的哦！
			response.setCharacterEncoding("utf-8");
			 PrintWriter out = response.getWriter();
			 out.print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
