package com.bbs.dao;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;

public class CommentDao extends BaseDao {
	public boolean makeComment(Comment comment) {
		comment.setUpdateAt(new Date());
		String hql = "FROM Comment WHERE user.userId=" + comment.getUser().getUserId() + " AND book.bookId=" + comment.getBook().getBookId()
				+ " AND status=0";
		if (getSession().createQuery(hql).list().isEmpty()) {
			getSession().save(comment);
			hql = "FROM Book WHERE bookId="+comment.getBook().getBookId();
			Book book = (Book) getSession().createQuery(hql).list().get(0);
			int commentNum = book.getCommentNum();
			float starClass = book.getStarClass();
			starClass = (starClass*commentNum+comment.getStarClass())/(commentNum+1);
			book.setCommentNum(commentNum+1);
			book.setStarClass(starClass);
			getSession().update(book);
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteComment(String commentId) {
		String hql = "FROM Comment WHERE commentId=" + commentId;
		List<Comment> comments = getSession().createQuery(hql).list();
		if (comments.isEmpty()) {
			return false;
		}
		Comment comment = comments.get(0);
		getSession().delete(comment);
		return true;
	}

	public List<Comment> commentList() {
		String hql = "FROM Comment b LEFT OUTER JOIN FETCH b.user LEFT OUTER JOIN FETCH b.book";
		List<Comment> comments = getSession().createQuery(hql).list();
		Collections.reverse(comments);
		return comments;
	}
}
