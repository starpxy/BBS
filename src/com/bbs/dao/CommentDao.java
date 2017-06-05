package com.bbs.dao;

import java.util.Date;

import com.bbs.entities.Comment;

public class CommentDao extends BaseDao{
	public void makeComment(Comment comment){
		comment.setUpdateAt(new Date());
		System.out.println(comment.getBook().getBookId()+"====="+comment.getUser().getUserId());
		System.out.println(comment.getContent());
		getSession().saveOrUpdate(comment);
		System.out.println("yes");
	}
}
