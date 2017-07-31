package com.bbs.entities;

import java.util.Date;

public class Book {
	private Integer bookId;
	private String author;
	private String simpleChart;
	private String isbn;
	private String bookTitle;
	private String publisher;
	private String versionNumber;
	private String preface;
	private String directory;
	private String introduction;
	private String type;
	private Integer bookVolume;
	private Float starClass;
	private Integer price = 1;
	private Integer borrowedNum = 0;
	private Integer commentNum = 0;
	private Date updateAt;

	public void setCommentNum(Integer commentNum) {
		this.commentNum = commentNum;
	}

	public Integer getCommentNum() {
		return commentNum;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getPrice() {
		return price;
	}

	public void setBorrowedNum(Integer borrowedNum) {
		this.borrowedNum = borrowedNum;
	}

	public Integer getBorrowedNum() {
		return borrowedNum;
	}

	public void setStarClass(Float starClass) {
		this.starClass = starClass;
	}

	public Float getStarClass() {
		return starClass;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSimpleChart() {
		return simpleChart;
	}

	public void setSimpleChart(String simpleChart) {
		this.simpleChart = simpleChart;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getVersionNumber() {
		return versionNumber;
	}

	public void setVersionNumber(String versionNumber) {
		this.versionNumber = versionNumber;
	}

	public String getPreface() {
		return preface;
	}

	public void setPreface(String preface) {
		this.preface = preface;
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getBookVolume() {
		return bookVolume;
	}

	public void setBookVolume(Integer bookVolume) {
		this.bookVolume = bookVolume;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
