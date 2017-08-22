package com.bbs.io;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.bbs.api.entities.UploadResult;
import com.bbs.properties.PathProperty;

public class ImageUploader {

	public static UploadResult upload(HttpServletRequest request, String savePath, String filefield) {
		UploadResult uploadResult = new UploadResult();
		MultiPartRequestWrapper req = (MultiPartRequestWrapper) request;
		File[] files = req.getFiles(filefield);
		String[] filenames = req.getFileNames(filefield);
		int count = 0;
		for (File file : files) {
			try {
				String extName = filenames[count].substring(filenames[count].lastIndexOf(".") + 1);
				if (!extName.equals("jpg") && !extName.equals("png") && !extName.equals("gif")
						&& !extName.equals("jpeg") && !extName.equals("JPG") && !extName.equals("PNG")
						&& !extName.equals("JPEG") && !extName.equals("GIF")) {
					// 格式不符合返回3
					uploadResult.setState(3);
					return uploadResult;
				}
				extName = "." + extName;
				uploadResult.setFileName(savePath + PathProperty.SIGNAL + filenames[count]);
				FileInputStream fileInputStream = new FileInputStream(file);
				File toWrite = new File(PathProperty.BASEPATH + savePath + PathProperty.SIGNAL);
				if (!toWrite.exists()) {
					toWrite.delete();
					toWrite.mkdirs();
				}
				FileOutputStream out = new FileOutputStream(
						PathProperty.BASEPATH + savePath + PathProperty.SIGNAL + filenames[count]);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fileInputStream.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				fileInputStream.close();
				out.flush();
				out.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			count++;
		}
		// 无误返回1
		uploadResult.setState(1);
		return uploadResult;
	}
}