package com.bbs.utils;

import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.apache.commons.lang.StringUtils;
public class CutImageUtils {

	/**
	 * ������ת���� make by dongxh 2017��11��1������3:51:29
	 * 
	 * @param src
	 * @param angel
	 * @return
	 */
	public static Rectangle CalcRotatedSize(Rectangle src, int angel) {
		// if angel is greater than 90 degree, we need to do some conversion
		if (angel >= 90) {
			if (angel / 90 % 2 == 1) {
				int temp = src.height;
				src.height = src.width;
				src.width = temp;
			}
			angel = angel % 90;
		}

		double r = Math.sqrt(src.height * src.height + src.width * src.width) / 2;
		double len = 2 * Math.sin(Math.toRadians(angel) / 2) * r;
		double angel_alpha = (Math.PI - Math.toRadians(angel)) / 2;
		double angel_dalta_width = Math.atan((double) src.height / src.width);
		double angel_dalta_height = Math.atan((double) src.width / src.height);

		int len_dalta_width = (int) (len * Math.cos(Math.PI - angel_alpha - angel_dalta_width));
		int len_dalta_height = (int) (len * Math.cos(Math.PI - angel_alpha - angel_dalta_height));
		int des_width = src.width + len_dalta_width * 2;
		int des_height = src.height + len_dalta_height * 2;
		return new Rectangle(new Dimension(des_width, des_height));
	}

	/**
	 * ����ͼƬ�Ƕ�
	 * make by dongxh 2017��11��1������3:51:08
	 * 
	 * @param src
	 * @param angel
	 * @return
	 */
	public static BufferedImage rotate(Image src, int angel) {
		int src_width = src.getWidth(null);
		int src_height = src.getHeight(null);
		// calculate the new image size
		Rectangle rect_des = CalcRotatedSize(new Rectangle(new Dimension(src_width, src_height)), angel);

		BufferedImage res = null;
		res = new BufferedImage(rect_des.width, rect_des.height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = res.createGraphics();
		// transform
		g2.translate((rect_des.width - src_width) / 2, (rect_des.height - src_height) / 2);
		g2.rotate(Math.toRadians(angel), src_width / 2, src_height / 2);

		g2.drawImage(src, null, null);
		return res;
	}

	/**
	 * ����ͼƬ�ǶȺ�д���ڴ� 
	 * make by dongxh 2017��11��1������4:31:20
	 * 
	 * @param imgFile
	 */
	public static void rotateImage(String imgFile,int angle) {
		try {
			if (StringUtils.isNotBlank(imgFile)) {
				File _img_file_ = new File(imgFile);
				if (_img_file_.exists()) {
					if (angle == 0)
						return;
					BufferedImage src = ImageIO.read(_img_file_);
					BufferedImage des = rotate(src, angle);
					ImageIO.write(des, "jpg", _img_file_);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void cutImage(String filePath, int x, int y, int w, int h, int angle) throws Exception {
		
		//�Ƚ�ͼƬ������ת
		rotateImage(filePath, angle);
		// ����ͨ��ImageIo�еķ���������һ��Image + InputStream���ڴ�
		ImageInputStream iis = ImageIO.createImageInputStream(new FileInputStream(filePath));
		// �ٰ���ָ����ʽ����һ��Reader��Reader����new�ģ�
		Iterator it = ImageIO.getImageReadersByFormatName("jpg");
		ImageReader imagereader = (ImageReader) it.next();
		// ��ͨ��ImageReader�� InputStream
		imagereader.setInput(iis);

		// ���ø���Ȥ��Դ����
		ImageReadParam par = imagereader.getDefaultReadParam();
		par.setSourceRegion(new Rectangle(x, y, w, h));
		// �� reader�õ�BufferImage
		BufferedImage bi = imagereader.read(0, par);

		// ��BuffeerImageд��ͨ��ImageIO
		ImageIO.write(bi, "jpg", new File(filePath));

	}
}
