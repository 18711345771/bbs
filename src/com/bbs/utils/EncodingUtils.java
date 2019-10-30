package com.bbs.utils;

import java.io.UnsupportedEncodingException;

public class EncodingUtils {
		public static String convertcode(String str){
			//例如：
			//String str="-27_-112_-76_-27_-82_-119_-24_-66_-119_8__1f746f5b-828d-4855-817d-7a9dc97c07aa_bk";
			String[] charstr=str.split("_");
			//找到最后一个表示字节数组元素个数的字符的下标
			int po=str.indexOf("__");
			char[] acha ={' '};
			acha[0]=str.charAt(po-1);
			String astr=new String(acha);
			po=Integer.parseInt(astr);
			byte[] b_array=new byte[po+1];
			for (int i=0;i<=po;i++){
		            b_array[i]=new Byte(charstr[i]);
		    }
			String name=null;
			try {
				name=new String(b_array,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return name;
		}
}
