package com.bbs.services;

import com.bbs.dao.CommentDao;
import com.bbs.entities.Comment;

public class CommentService {
	CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public boolean makeComment(Comment comment) {
		return commentDao.makeComment(comment);
	}
	public boolean deleteComment(String commentId){
		return commentDao.deleteComment(commentId);
	}
}
