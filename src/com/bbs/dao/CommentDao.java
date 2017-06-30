package com.bbs.dao;

import java.util.Date;
import java.util.List;

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
	public boolean deleteComment(String commentId){
		String hql = "FROM Comment WHERE commentId="+commentId;
		List<Comment> comments = getSession().createQuery(hql).list();
		if (comments.isEmpty()) {
			return false;
		}
		Comment comment = comments.get(0);
		getSession().delete(comment);
		return true;
	}
}
