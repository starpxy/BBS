package com.bbs.api;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ImageCut {
	/**
	 * ��ȡͼƬ
	 *
	 * @param srcImageFile
	 *            ԭͼƬ��ַ
	 * @param x
	 *            ��ȡʱ��x����
	 * @param y
	 *            ��ȡʱ��y����
	 * @param desWidth
	 *            ��ȡ�Ŀ��
	 * @param desHeight
	 *            ��ȡ�ĸ߶�
	 * @param srcWidth
	 *            ҳ��ͼƬ�Ŀ��
	 * @param srcHeight
	 *            ҳ��ͼƬ�ĸ߶�
	 *
	 */
	public static byte[] imgCut(InputStream input, int x, int y, int desWidth, int desHeight, int srcWidth, int srcHeight) {
		try {
			Image img;
			ImageFilter cropFilter;
			BufferedImage bi = ImageIO.read(input);
			if (srcWidth >= desWidth && srcHeight >= desHeight) {
				Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
				cropFilter = new CropImageFilter(x, y, desWidth, desHeight);
				img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(desWidth, desHeight, BufferedImage.TYPE_INT_RGB);
				Graphics g = tag.getGraphics();
				g.drawImage(img, 0, 0, null);
				g.dispose();
				// ����ļ�
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				ImageIO.write(tag, "JPEG", out);
				return out.toByteArray();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}