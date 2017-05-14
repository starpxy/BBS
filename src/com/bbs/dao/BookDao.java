package com.bbs.dao;

import com.bbs.entities.Book;

public class BookDao extends BaseDao{
	public Book bookDetails(Book book){
		String hql="FROM Book WHERE bookId="+book.getBookId();	
		Book newBook=null;
		if(book.getBookId()!=null){
			newBook=(Book) getSession().createQuery(hql).list().get(0);
		}
		else{
			System.out.println("empty bookID");
		}
		return newBook;
		
	}
}
