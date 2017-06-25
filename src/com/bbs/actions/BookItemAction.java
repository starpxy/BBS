package com.bbs.actions;

import java.util.HashMap;
import java.util.Map;

import com.bbs.entities.BookItem;
import com.bbs.entities.User;
import com.bbs.services.BookItemService;
import com.opensymphony.xwork2.ModelDriven;

public class BookItemAction extends BaseAction implements ModelDriven<BookItem> {

	/**
	 * 
	 */
	private BookItem bookItem;
	private static final long serialVersionUID = 1L;
	private BookItemService bookItemService;
	private Map<String, Object> map;

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public BookItemService getBookItemService() {
		return bookItemService;
	}

	public void setBookItemService(BookItemService bookItemService) {
		this.bookItemService = bookItemService;
	}

	public String ava() {
		User user = (User) session.get("user");
		int i = bookItemService.ava(bookItem, user);
		map = new HashMap<String, Object>();
		map.put("state", i);
		System.out.println(map);
		return "AvaSucceed";
	}

	public void prepareAva() {
		this.bookItem = new BookItem();
	}

	@Override
	public BookItem getModel() {
		return bookItem;
	}
}
