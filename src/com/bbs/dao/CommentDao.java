package com.bbs.dao;

import java.util.Date;

import com.bbs.entities.Comment;

public class CommentDao extends BaseDao{
	public boolean makeComment(Comment comment){
		comment.setUpdateAt(new Date());
		String hql = "FROM Comment WHERE user.userId="+comment.getUser().getUserId()+" AND book.bookId="+comment.getBook().getBookId()+" AND state='unselected'";
		if (getSession().createQuery(hql).list().isEmpty()) {
			getSession().save(comment);
			return true;
		}
		else{
			return false;
		}
	}
}
