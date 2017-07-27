package com.bbs.actions;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.bbs.entities.Book;
import com.bbs.entities.Comment;
import com.bbs.entities.User;
import com.bbs.recommend.RankAlgorithm;
import com.bbs.services.BookService;
import com.bbs.services.UserService;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;

public class BookAction extends BaseAction implements ModelDriven<Book>, ServletRequestAware {
	private HttpServletRequest httpServletRequest;
	private static final long serialVersionUID = 1L;
	private Book book;
	private BookService BookService;
	private UserService userService;
	private Map<String, Object> books;

	public void setBooks(Map<String, Object> books) {
		this.books = books;
	}

	public Map<String, Object> getBooks() {
		return books;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setBookService(BookService bookService) {
		this.BookService = bookService;
	}

	public String showComments() {
		List<Comment> list = BookService.showComments(book);
		int count = list.size();
		while (count > 0) {
			list.get(count - 1).setBook(BookService.bookDetails(list.get(count - 1).getBook()));
			count--;
		}
		count = list.size();
		while (count > 0) {
			list.get(count - 1).setUser(userService.getUserInfo(list.get(count - 1).getUser()));
			count--;
		}
		JSONArray jsonArray = JSONArray.fromObject(list);
		books = new HashMap<>();
		books.put("lists", jsonArray.toString());
		return "showComments";
	}

	public String bookDetails() {
		User user = (User) session.get("user");
		if (user==null) {
			return "refused";
		}
		Book newBook = BookService.bookDetails(book);
		request.put("book", newBook);
		session.put("book", newBook);
		request.put("isFavorited", BookService.isFavorited(user, book.getBookId()+""));
		return "bookDetails";
	}

	public String bookSubmit() {
		Book newBook = BookService.bookDetails(book);
		request.put("book", newBook);
		request.put("itemId", httpServletRequest.getParameter("itemId"));
		return "bookSubmit";
	}

	public String bookList() {
		request.put("type", book.getType());
		request.put("status", 1);
		return "bookList";
	}

	public String listBooks() {
		request.put("type", book.getType());
		String p = httpServletRequest.getParameter("page");
		int page = 1;
		if (p!=null) {
			page = Integer.valueOf(p);
		}
		List<Book> bookList = BookService.bookList(book,page);
		books = new HashMap<String, Object>();
		books.put("books", JSONArray.fromObject(bookList));
		return "listBooks";
	}

	public String addBookOld() {
		String isbn = httpServletRequest.getParameter("isbn");
		books = new HashMap<>();
		books.put("state", BookService.addBookOld(isbn));
		return "addBook";
	}

	public String addBookNew() {
		books = new HashMap<>();
		books.put("state", BookService.addBookNew(book));
		return "addBook";
	}

	public String recommendBook() throws IOException {
		Book book = (Book) session.get("book");
		List<Book> list = BookService.bookList(book,-1);
		List<Map.Entry<Book, Double>> temp = RankAlgorithm.getRecomBookList(book, list, book.getType());
		List<Book> result = new LinkedList<>();
		for (Entry<Book, Double> entry : temp) {
			result.add(entry.getKey());
		}
		books = new HashMap<>();
		books.put("books", JSONArray.fromObject(result));
		return "addBook";
	}

	public void prepareAddBookNew() {
		book = new Book();
	}

	public void prepareBookSubmit() {
		this.book = new Book();
	}

	public void prepareShowComments() {
		this.book = new Book();
	}

	public void prepareListBooks() {
		this.book = new Book();
	}

	public void prepareBookList() {
		this.book = new Book();
	}

	public void prepareBookDetails() {
		this.book = new Book();
	}

	@Override
	public Book getModel() {
		return book;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		httpServletRequest = request;
	}

}
