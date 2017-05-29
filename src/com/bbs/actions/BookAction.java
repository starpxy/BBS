package com.bbs.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.bbs.entities.Book;
import com.bbs.services.BookService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class BookAction extends BaseAction implements ModelDriven<Book>{
	private static final long serialVersionUID = 1L;
	private Book book;
	private BookService BookService;
	private Map<String,Object> books;
	public void setBooks(Map<String, Object> books) {
		this.books = books;
	}
	public Map<String, Object> getBooks() {
		return books;
	}
	public void setBookService(BookService bookService) {
		this.BookService = bookService;
	}
	public String bookDetails(){
		Book newBook=BookService.bookDetails(book);
		request.put("book", newBook);
		session.put("book", newBook);
		return "bookDetails";
	}
	
	public String bookList() {
		request.put("type", book.getType());
		return "bookList";
	}
	public String listBooks(){
		request.put("type", book.getType());
		List<Book> bookList=BookService.bookList(book);
		books = new HashMap<String,Object>();
		books.put("books", JSONArray.fromObject(bookList));
		System.out.println(JSONArray.fromObject(bookList));
		return "listBooks";
	}
	public void prepareListBooks(){
		this.book = new Book();
	}
	public void prepareBookList() {
		this.book=new Book();
	}
	public void prepareBookDetails(){
		this.book=new Book();
	}
	@Override
	public Book getModel() {
		return book;
	}

}
