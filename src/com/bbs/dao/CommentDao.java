package com.bbs.dao;

import java.util.Date;

import com.bbs.entities.Comment;

public class CommentDao extends BaseDao{
	public void createComment(Comment comment){
		comment.setUpdateAt(new Date());
		getSession().saveOrUpdate(comment);
	}
}
