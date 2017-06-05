package com.bbs.entities;

import java.util.Date;

public class Comment {
	private Integer commentId;
	private User user;
	private Book book;
	private String content;
	private int starClass;
	private String state;
	private Date updateAt;

	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}

	public void setStarClass(int starClass) {
		this.starClass = starClass;
	}

	public int getStarClass() {
		return starClass;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
