package com.bbs.recommend;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.bbs.entities.Book;

public class BookTerms {
	Book book;

	public BookTerms(Book book) {
		this.book = book;
	}

	public String getISBN() {
		return book.getIsbn();
	}

	public List<String> getTitleTerms() {
		return splitToCnChar(book.getBookTitle());
	}

	public List<String> getPrefaceterms() {
		return splitToCnChar(book.getPreface());
	}

	public List<String> getIntroterms() {
		return splitToCnChar(book.getIntroduction());
	}

	public List<String> getDirTerms() {
		return splitToCnChar(book.getDirectory());
	}

	private ArrayList<String> splitToCnChar(String text) {
		// String encode = "GBK";
		// 预处理
		// 去除空白字符，制表符、换页符
		text = text.replaceAll("\\s*", "");
		// 清除所有符号,只留下字母 数字 汉字 共3类.
		text = text.replaceAll("[\\pP\\p{Punct}]", "");
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> stopwords = getStopWords();
		for (int i = 0; i < text.toCharArray().length - 1; i++) {
			// combine two words together
			char c1 = text.charAt(i);
			char c2 = text.charAt(i + 1);
			String word1 = String.valueOf(c1);
			String word2 = String.valueOf(c2);
			String term = word1 + word2;
			// remove stop words
			if (!stopwords.contains(word1) && !stopwords.contains(word2)) {
				list.add(term);
			}
		}
		return list;
	}

	private ArrayList<String> getStopWords() {
		ArrayList<String> stopwords = new ArrayList<String>();
		stopwords.add("与");
		stopwords.add("的");
		stopwords.add("虽");
		stopwords.add("是");
		stopwords.add("有");
		return stopwords;
	}

}
