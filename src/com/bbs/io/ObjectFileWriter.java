package com.bbs.io;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.LinkedList;
import java.util.List;

import com.bbs.entities.Book;
import com.bbs.entities.User;

public class ObjectFileWriter {
	/**
	 * Root should be changed to absolute path when push the project to net.
	 * Root should end with "/"
	 */
	private static String root = "";

	public static void writeRecommendToFile(User user, List<Book> books) {
		try {
			String path = root + user.getUserId() + "/";
			File file = new File(path);
			if (!file.exists()) {
				file.mkdir();
			}
			FileOutputStream fileOutputStream = new FileOutputStream(path + "recommendList");
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
			int[] bookIds = new int[books.size()];
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
