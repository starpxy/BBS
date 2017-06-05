package com.bbs.services;

import com.bbs.dao.CommentDao;
import com.bbs.entities.Comment;

public class CommentService {
	CommentDao commentDao;
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	public void makeComment(Comment comment){
		commentDao.makeComment(comment);
	}
}
