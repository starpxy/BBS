package com.bbs.dao;

import java.util.List;

import com.bbs.entities.User;


public class UserDao extends BaseDao {
	public boolean login(User user){
		if (user==null) {
			return false;
		}
		String hql = "FROM User WHERE phoneNumber='"+user.getPhoneNumber()+"' and password='"+user.getPassword()+"'";
		List<Object> list = getSession().createQuery(hql).list();
		if (list.size()!=0) {
			return true;
		}
		else {
			return false;
		}
	}
	public void register(User user){
		getSession().saveOrUpdate(user);
	}
}
