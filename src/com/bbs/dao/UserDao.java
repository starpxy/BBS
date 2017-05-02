package com.bbs.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bbs.entities.User;

public class UserDao {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	public List<User> getAll(){
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}
	public void register(){
		
	}

}
