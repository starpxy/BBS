package com.bbs.dao;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Comment;
import com.bbs.entities.Reservation;
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
		if (user.getPhoneNumber()!=null&&user.getWeChat()!=null) {
			getSession().save(user);
		}
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
		String hql="FROM User WHERE userId="+user.getUserId();
		User user2=(User) getSession().createQuery(hql).list().get(0);
		user2.setRecommendFre(frq);
		getSession().update(user2);
	}
	public List<BorrowedRecord> payState(User user){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="+user.getUserId()+" AND b.status='confirmed'";
		List<BorrowedRecord> list = (List<BorrowedRecord>) getSession().createQuery(hql).list();
		if (list.isEmpty()) {
			return null;
		}
		else{
			return list;
		}
	}
	public boolean adminLogin(User user){
		String hql = "FROM User WHERE phoneNumber='"+user.getPhoneNumber()+"' AND password='"+user.getPassword()+"' AND role='admin'";
		if (getSession().createQuery(hql).list().isEmpty()) {
			return false;
		}
		else{
			return true;
		}
	}
	public List<BookItem> adminInitial(){
		String hql = "FROM BookItem b LEFT OUTER JOIN FETCH b.book";
		List<BookItem> bookItems = getSession().createQuery(hql).list();
		return bookItems;
	}
	public List<User> adminUsers(){
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}
	public List<BorrowedRecord> adminListRecords(){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		Collections.reverse(borrowedRecords);
		return borrowedRecords;
	}
	public List<Reservation> adminListReservations(){
		String hql = "FROM Reservation b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book";
		List<Reservation> reservations = getSession().createQuery(hql).list();
		Collections.reverse(reservations);
		return reservations;
	}
	public List<Comment> adminListComments(){
		String hql = "FROM Comment b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book";
		List<Comment> comments = getSession().createQuery(hql).list();
		Collections.reverse(comments);
		return comments;
	}
	public void paySucceed(String outTradeNumber,int[] records){
		for (int i = 0; i < records.length; i++) {
			String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.borrowedId"+i;
			List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
			if (!borrowedRecords.isEmpty()) {
				BorrowedRecord borrowedRecord = borrowedRecords.get(0);
				borrowedRecord.setStatus("borrowed");
				getSession().save(borrowedRecord);
			}
		}
	}
	public boolean confrimBook(String userId){
		String hql = "FROM BorrowedRecord b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.bookItem c LEFT OUTER JOIN FETCH c.book WHERE b.user.userId="+userId+" AND b.status='unconfirmed'";
		List<BorrowedRecord> borrowedRecords = getSession().createQuery(hql).list();
		System.out.println("in");
		if (!borrowedRecords.isEmpty()) {
			Iterator<BorrowedRecord> iterator = borrowedRecords.iterator();
			while(iterator.hasNext()){
				BorrowedRecord borrowedRecord = iterator.next();
				borrowedRecord.setStatus("confirmed");
				getSession().update(borrowedRecord);
			}
			return true;
 		}
		else{
			return false;
		}
	}
}
