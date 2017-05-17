package com.bbs.dao;

import java.util.List;
import com.bbs.entities.BookItem;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.User;

public class BorrowedRecordDao extends BaseDao{
	public List<BorrowedRecord> checkBorrowedRecord(User user) {
		List<BorrowedRecord> records=null;
		String hql="FROM BorrowedRecord WHERE user.userId="+user.getUserId();
		records=getSession().createQuery(hql).list();
		return records;
	}
	
	public BorrowedRecord createBorrowedRecord(User user, BookItem bookItem){
		//获取用户
		String hql2="FROM User WHERE weChat='"+user.getWeChat()+"'";
		User newUser=(User) getSession().createQuery(hql2).list().get(0);
		//检查是否借书超过两个
		String hql3="FROM BorrowedRecord WHERE status = 'ungranted' AND user.userId="+newUser.getUserId();
		List<BorrowedRecord> records=getSession().createQuery(hql3).list();
		if(records.size()>=2)
			return null;
		else{
			//获取数目
			BorrowedRecord borrowedRecord=new BorrowedRecord();
			String hql1="FROM BookItem WHRER itemId="+bookItem.getItemId();
			BookItem newBookItem=(BookItem) getSession().createQuery(hql1).list().get(0);
			//填充借书单
			borrowedRecord.setBookItem(newBookItem);
			borrowedRecord.setUser(newUser);
			borrowedRecord.setStatus("ungranted");
			getSession().save(borrowedRecord);
			return borrowedRecord;
		}
	}
}
