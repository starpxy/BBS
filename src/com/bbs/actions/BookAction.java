package com.bbs.actions;

import com.bbs.entities.Book;
import com.bbs.services.BookService;
import com.opensymphony.xwork2.ModelDriven;

public class BookAction extends BaseAction implements ModelDriven<Book>{
	private static final long serialVersionUID = 1L;
	private Book book;
	private BookService BookService;
	public void setBookService(BookService bookService) {
		this.BookService = bookService;
	}
	public String bookDetails(){
		Book newBook=BookService.bookDetails(book);
		request.put("book", newBook);
		return "bookDetails";
	}
	public void prepareBookDetails(){
		this.book=new Book();
	}
	@Override
	public Book getModel() {
		return book;
	}

}
