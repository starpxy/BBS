package com.bbs.services;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.bbs.dao.SettingDao;
import com.bbs.entities.Book;
import com.bbs.entities.BorrowedRecord;
import com.bbs.entities.Reservation;
import com.bbs.entities.Settings;
import com.bbs.entities.User;
import com.bbs.entities.WaitList;
import com.bbs.recommend.RankAlgorithm;

public class SettingService {
	private SettingDao settingDao;

	public SettingDao getSettingDao() {
		return settingDao;
	}

	public void setSettingDao(SettingDao settingDao) {
		this.settingDao = settingDao;
	}

	public Settings showSettings() {
		return settingDao.showSettings();
	}

	public void update(Settings settings) {
		settingDao.update(settings);
	}

	public List<Book> recommendBook(User user) {
		Map<Book, List<Book>> tempBooks = settingDao.recommendBook(user);
		if (tempBooks == null) {
			return null;
		}
		List<Book> historyBooks = new LinkedList<>();
		List<List<Book>> listBook = new LinkedList<>();
		Iterator<Book> iterator = tempBooks.keySet().iterator();
		while (iterator.hasNext()) {
			Book temp = iterator.next();
			historyBooks.add(temp);
			listBook.add(tempBooks.get(temp));
		}
		List<Entry<Book, Double>> temp = null;
		try {
			temp = RankAlgorithm.getRecomBookList(historyBooks, listBook);
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<Book> result = new LinkedList<>();
		if (temp != null) {
			for (Entry<Book, Double> entry : temp) {
				result.add(entry.getKey());
			}
		}
		return result;
	}

	public List<User> selectUsers() {
		return settingDao.selectUsers();
	}

	public void saveUser(User user) {
		settingDao.saveUser(user);
	}

	public List<WaitList> showWaitLists() {
		return settingDao.showWaitList();
	}

	public boolean isBookAva(Book book) {
		return settingDao.isBookAva(book);
	}

	public void changeWaitStatus(WaitList waitList) {
		settingDao.changeWaitStatus(waitList);
	}

	public List<Reservation> showReservations() {
		return settingDao.showReservations();
	}

	public void changeReservationStatus(Reservation reservation) {
		settingDao.changeReserveStatus(reservation);
	}

	public List<BorrowedRecord> showRecordsToReturn() {
		return settingDao.showRecordsToReturn();
	}

	public void changeRecordStatus(BorrowedRecord borrowedRecord) {
		settingDao.changeRecordStatus(borrowedRecord);
	}
}
