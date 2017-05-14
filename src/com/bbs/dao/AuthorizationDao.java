package com.bbs.dao;

import java.util.List;

import com.bbs.api.AuthorizationManager;
import com.bbs.api.NoneCodeException;
import com.bbs.entities.User;

public class AuthorizationDao extends BaseDao{
	public User wechatLogin(AuthorizationManager authorizationManager){
		String hql = null;
		try {
			hql = "FROM User WHERE weChat='"+authorizationManager.getOpenID()+"'";
		} catch (NoneCodeException e) { 
			e.printStackTrace();
		}
		List<User> list = getSession().createQuery(hql).list();
		if (list.size()>0) {
			return list.get(0);
		}
		else {
			User user = new User();
			try {
				user.setWeChat(authorizationManager.getOpenID());
			} catch (NoneCodeException e) {
				e.printStackTrace();
			}
			return user;
		}
	}
	public User getUserInfo(String openId){
		String hql = "FROM User WHERE weChat='"+openId+"'";
		List<User> list = getSession().createQuery(hql).list();
		if (list.size()!=0) {
			return list.get(0);
		}
		else{
			return null;
		}
	}
}
