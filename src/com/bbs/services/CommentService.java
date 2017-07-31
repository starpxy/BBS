package com.bbs.services;

import java.util.List;

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

	public boolean deleteComment(String commentId) {
		return commentDao.deleteComment(commentId);
	}

	public List<Comment> getCommentList() {
		return commentDao.getCommentList();
	}

}
