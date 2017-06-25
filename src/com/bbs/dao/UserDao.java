package com.bbs.dao;

import java.util.List;

import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;


public class UserDao extends BaseDao {
	public boolean login(User user){
		if (user==null) {
			return false;
		}
		if (user.getPhoneNumber()==null&&user.getWeChat()!=null) {
			String hql = "FROM User WHERE weChat='"+user.getWeChat()+"'";
			List<Object> list = getSession().createQuery(hql).list();
			if (list.size()!=0) {
				return true;
			}
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
	public User getInfo(User user){
		String hql = "FROM User WHERE phoneNumber='"+user.getPhoneNumber()+"' and password='"+user.getPassword()+"'";
		List<User> list = getSession().createQuery(hql).list();
		if (list.size()!=0) {
			return list.get(0);
		}
		else {
			return null;
		}
	}
	public User getUserInfo(User user){
		String hql = "FROM User WHERE userId="+user.getUserId();
		List<User> list = getSession().createQuery(hql).list();
		if (list.size()!=0) {
			return list.get(0);
		}
		else {
			return null;
		}
	}
	public void changePass(User user){
		String hql="FROM User WHERE userId="+user.getUserId();
		User user2=(User) getSession().createQuery(hql).list().get(0);
		user2.setPassword(user.getPassword());
		getSession().update(user2);
	}
	public void setRecomFreq(User user) {
		int frq=user.getRecommendFre();
		System.out.println(frq+"-----");
		String hql="FROM User WHERE userId="+user.getUserId();
		User user2=(User) getSession().createQuery(hql).list().get(0);
		user2.setRecommendFre(frq);
		System.out.println(user2.getRecommendFre());
		getSession().update(user2);
	}
	public List<BorrowedRecord> payState(User user){
		String hql = "FROM BorrowedRecord user.userId="+user.getUserId()+" AND status='confirmed'";
		List<BorrowedRecord> list = (List<BorrowedRecord>) getSession().createQuery(hql).list();
		if (list.size()==0) {
			return null;
		}
		else{
			return list;
		}
	}
	public String adminLogin(User user){
		String hql = "FROM User WHERE phoneNumber='"+user.getPhoneNumber()+"' AND password='"+user.getPassword()+"' AND role='admin'";
		if (getSession().createQuery(hql).list().isEmpty()) {
			return "fail";
		}
		else{
			return "success";
		}
	}
}
