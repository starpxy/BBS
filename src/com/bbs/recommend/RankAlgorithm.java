package com.bbs.recommend;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.bbs.entities.Book;

public class RankAlgorithm {

	private Book targetbook = null;
	private final static double TITLE_WEIGHT = 2;
	private final static double RPREFACE_WEIGHT = 1;
	private final static double DIRECTORY_WEIGHT = 1;
	private final static double INTRODUTION_WEIGHT = 1;

	private RankAlgorithm(Book targetbook) {
		this.targetbook = targetbook;
	}

	private RankAlgorithm() {
	}

	public List<Entry<Book, Double>> getRankings(List<Book> books, String type) throws IOException {
		Map<Book, Double> results = new HashMap<Book, Double>();
		List<Map<String, HashMap<String, Double>>> bookvectors = getBookVectors(books, type);
		Map<String, HashMap<String, Double>> booktitlevectors = bookvectors.get(0);
		Map<String, HashMap<String, Double>> bookprefacevectors = bookvectors.get(1);
		Map<String, HashMap<String, Double>> bookdirvectors = bookvectors.get(2);
		Map<String, HashMap<String, Double>> bookintrovectors = bookvectors.get(3);
		for (Book book : books) {
			double titlescore = getSimScore(booktitlevectors.get(targetbook.getIsbn()), booktitlevectors.get(book.getIsbn()));
			double prefacescore = getSimScore(bookprefacevectors.get(targetbook.getIsbn()), bookprefacevectors.get(book.getIsbn()));
			double dirscore = getSimScore(bookdirvectors.get(targetbook.getIsbn()), bookdirvectors.get(book.getIsbn()));
			double introscore = getSimScore(bookintrovectors.get(targetbook.getIsbn()), bookintrovectors.get(book.getIsbn()));
			// System.out.println("titlescore:" + titlescore + "prefacescore:" + titlescore + "dirscore:" + dirscore + "introscore:" + introscore);
			double totalsocre = (TITLE_WEIGHT * titlescore + RPREFACE_WEIGHT * prefacescore + DIRECTORY_WEIGHT * dirscore
					+ INTRODUTION_WEIGHT * introscore) / (TITLE_WEIGHT + RPREFACE_WEIGHT + DIRECTORY_WEIGHT + INTRODUTION_WEIGHT);
			results.put(book, totalsocre);
		}
		List<Map.Entry<Book, Double>> rankings = sortResults(results);
		return rankings;
	}

	private List<Entry<Book, Double>> sortResults(Map<Book, Double> results) {
		List<Map.Entry<Book, Double>> rankings = new ArrayList<Map.Entry<Book, Double>>(results.entrySet());
		Collections.sort(rankings, new Comparator<Map.Entry<Book, Double>>() {
			public int compare(Map.Entry<Book, Double> o1, Map.Entry<Book, Double> o2) {
				if ((o2.getValue() - o1.getValue()) > 0)
					return 1;
				else if ((o2.getValue() - o1.getValue()) == 0)
					return 0;
				else
					return -1;
			}
		});
		return rankings;
	}

	private double getSimScore(HashMap<String, Double> target, HashMap<String, Double> compa) {
		Set<Entry<String, Double>> targetentries = target.entrySet();
		Set<Entry<String, Double>> compaentries = compa.entrySet();
		double above = 0;
		double targetbelow = 0;
		double compabelow = 0;
		for (Entry<String, Double> targetentry : targetentries) {
			targetbelow += targetentry.getValue() * targetentry.getValue();
		}
		for (Entry<String, Double> compaentry : compaentries) {
			compabelow += compaentry.getValue() * compaentry.getValue();
			for (Entry<String, Double> targetentry : targetentries) {
				if (compaentry.getKey().equals(targetentry.getKey())) {
					above += compaentry.getValue() * targetentry.getValue();
				}
			}
		}
		if (targetbelow == 0.0 || compabelow == 0.0) {
			return 0;
		}
		return above / (Math.sqrt(targetbelow) * Math.sqrt(compabelow));
	}

	private List<Map<String, HashMap<String, Double>>> getBookVectors(List<Book> books, String type) throws IOException {
		List<Map<String, HashMap<String, Double>>> booksvectors = new ArrayList<Map<String, HashMap<String, Double>>>();
		int totalnumber = books.size();
		File file = new File("data/" + type + "-" + totalnumber);
		if (!file.exists()) {
			Map<String, List<String>> titlepostlisting = new HashMap<String, List<String>>();
			Map<String, List<String>> prefacepostlisting = new HashMap<String, List<String>>();
			Map<String, List<String>> directorypostlisting = new HashMap<String, List<String>>();
			Map<String, List<String>> intropostlisting = new HashMap<String, List<String>>();
			titlepostlisting = getPostListing(books, 't');
			prefacepostlisting = getPostListing(books, 'p');
			directorypostlisting = getPostListing(books, 'd');
			intropostlisting = getPostListing(books, 'i');
			Map<String, HashMap<String, Double>> booktitlevectors = new HashMap<String, HashMap<String, Double>>();
			Map<String, HashMap<String, Double>> bookprefacevectors = new HashMap<String, HashMap<String, Double>>();
			Map<String, HashMap<String, Double>> bookdirvectors = new HashMap<String, HashMap<String, Double>>();
			Map<String, HashMap<String, Double>> bookintrovectors = new HashMap<String, HashMap<String, Double>>();
			for (Book book : books) {
				BookTerms bt = new BookTerms(book);
				booktitlevectors.put(book.getIsbn(), getTFIDF(bt.getTitleTerms(), totalnumber, titlepostlisting));
				bookprefacevectors.put(book.getIsbn(), getTFIDF(bt.getPrefaceterms(), totalnumber, prefacepostlisting));
				bookdirvectors.put(book.getIsbn(), getTFIDF(bt.getDirTerms(), totalnumber, directorypostlisting));
				bookintrovectors.put(book.getIsbn(), getTFIDF(bt.getIntroterms(), totalnumber, intropostlisting));
			}
			booksvectors.add(booktitlevectors);
			booksvectors.add(bookprefacevectors);
			booksvectors.add(bookdirvectors);
			booksvectors.add(bookintrovectors);
			FileUtils.deleteData(new File("data/"), type);
			FileUtils.writeResults(booksvectors, type + "-" + totalnumber);
		} else {
			booksvectors = FileUtils.readResults(type + "-" + totalnumber);
		}
		return booksvectors;
	}

	private Map<String, List<String>> getPostListing(List<Book> books, char c) {
		Map<String, List<String>> postlisting = new HashMap<String, List<String>>();
		System.out.println(books.size());
		int count = 0;
		for (Book book : books) {
			BookTerms bt = new BookTerms(book);
			List<String> terms = new ArrayList<String>();
			switch (c) {
			case 't':
				terms = bt.getTitleTerms();
				break;
			case 'p':
				terms = bt.getPrefaceterms();
				break;
			case 'd':
				terms = bt.getDirTerms();
				break;
			case 'i':
				terms = bt.getIntroterms();
				break;
			default:
				break;
			}
			for (String term : terms) {
				if (postlisting.containsKey(term)) {
					List<String> values = postlisting.get(term);
					if (!values.contains(book.getIsbn())) {
						values.add(book.getIsbn());
						postlisting.put(term, values);
					}
				} else {
					List<String> values = new ArrayList<String>();
					values.add(book.getIsbn());
					postlisting.put(term, values);
				}
			}
			count++;
		}
		return postlisting;
	}

	private HashMap<String, Double> getTFIDF(List<String> terms, int totalnumber, Map<String, List<String>> postlisting) {
		Map<String, Integer> wordscount = new HashMap<String, Integer>();
		Integer maxfre = 0;
		for (String term : terms) {
			if (wordscount.containsKey(term)) {
				int count = wordscount.get(term);
				count++;
				if (count > maxfre) {
					maxfre = count;
				}
				wordscount.put(term, count);
			} else {
				if (maxfre == 0) {
					maxfre = 1;
				}
				wordscount.put(term, 1);
			}
		}
		HashMap<String, Double> curbook = new HashMap<String, Double>();
		for (String term : terms) {
			double tf = wordscount.get(term) / maxfre;
			double idf = Math.log((2 * totalnumber) / postlisting.get(term).size()) / Math.log(2);
			double tfidf = tf * idf;
			curbook.put(term, tfidf);
		}
		return curbook;
	}

	private static List<Map.Entry<Book, Double>> merge(List<List<Map.Entry<Book, Double>>> lists, List<Map.Entry<Book, Double>> result) {
		if (result == null) {
			result = new ArrayList<Map.Entry<Book, Double>>();
		}
		Iterator<List<Map.Entry<Book, Double>>> iterator = lists.iterator();
		if (lists.isEmpty()) {
			return result;
		}
		while (iterator.hasNext()) {
			List<Map.Entry<Book, Double>> temp = iterator.next();
			if (!temp.isEmpty()) {
				result.add(temp.remove(0));
			} else {
				iterator.remove();
			}
		}
		return merge(lists, result);
	}

	public static List<Map.Entry<Book, Double>> getRecomBookList(Book targetbook, List<Book> books, String type) throws IOException {
		RankAlgorithm ra = new RankAlgorithm(targetbook);
		List<Map.Entry<Book, Double>> rankings = ra.getRankings(books, type);
		return rankings;
	}

	public static List<Map.Entry<Book, Double>> getRecomBookList(List<Book> history_books,List<List<Book>> listBook) throws IOException {
		if (history_books.size() == 0) {
			return null;
		}
		List<List<Map.Entry<Book, Double>>> lists = new ArrayList<List<Map.Entry<Book, Double>>>();
		int count = 0;
		for (Book targetbook : history_books) {
			List<Book> books = listBook.get(count);
			List<Map.Entry<Book, Double>> temprecomlist = RankAlgorithm.getRecomBookList(targetbook, books, targetbook.getType());
			lists.add(temprecomlist);
			count++;
		}
		List<Map.Entry<Book, Double>> rankings = merge(lists, null);
		return rankings;
	}

	/**
	 * 以下为测试代码
	 * 
	 * @param args
	 */
//	public static void main(String[] args) {
//		// this is for testing
//		long start = System.currentTimeMillis();
//		List<Book> history_books = new ArrayList<Book>();
//		List<Book> books = BookModel.search("9787801755094", "人文社科");
//		Book b1 = books.get(0);
//		books = BookModel.search("9787800947155", "经典名著");
//		Book b2 = books.get(0);
//		books = BookModel.search("9787227017325", "小说传记");
//		Book b3 = books.get(0);
//		books = BookModel.search("9787301107492", "成人教育");
//		Book b4 = books.get(0);
//		history_books.add(b1);
//		history_books.add(b2);
//		history_books.add(b3);
//		history_books.add(b4);
//		List<Map.Entry<Book, Double>> rankings = RankAlgorithm.getRecomBookList(history_books);
//		for (Entry<Book, Double> entry : rankings) {
//			System.out.println(entry.getKey().getIsbn() + "=>" + entry.getKey().getTitle() + "=> score:" + entry.getValue());
//		}
//		System.out.println(System.currentTimeMillis() - start);
//	}
}
