package com.bbs.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public class UpgradeDaysCalculatorUtils {
	    private static Map<String,Integer> map;
	    private static List<Map.Entry<String,Integer>> list ;
	    private static void init(){
	    	map=new TreeMap<String,Integer>();
	    	map.put("1", 0);
	    	map.put("4", 60);
	    	map.put("8", 196);
	    	map.put("12", 396);
	    	map.put("18", 816);
	    	map.put("22", 1176);
	    	map.put("26", 1600);
	    	map.put("30", 2088);
	    	map.put("35", 2788);
	    	map.put("38", 3256);
	    	map.put("42", 3936);
	    	map.put("46", 4680);
	    	map.put("52", 5916);
	    	map.put("56", 6820);
	    	map.put("60", 7788);
	    	map.put("65", 9088);
	    	map.put("68", 9916);
	    	map.put("72", 11076);
	    	map.put("76", 12300);
	    	map.put("80", 13588);
	    	map.put("86", 15640);
	    	map.put("90", 17088);
	    	map.put("94", 18600);
	    	map.put("98",20176);
	    	
	    	/**
	    	 * 根据TreeMap的value来进行排序
	    	 */
	    	//这里将map.entrySet()转换成list
	        list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());
	        //然后通过比较器来实现排序
	        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
	            //升序排序
	            public int compare(Entry<String, Integer> o1,
	                    Entry<String, Integer> o2) {
	                return o1.getValue().compareTo(o2.getValue());
	            }
	        });
	    }
	    
		public static int getUpgradeDays(Integer days){
			init();
			int restDays=0;
			for(Map.Entry<String, Integer> set : list){
				if(set.getValue()>=days){
					restDays=set.getValue()-days;
					break;
				}
			}
			return restDays;
		}
		public static String getCurrentLevel(Integer days){
			init();
			String currentLevel=null;
			for(Map.Entry<String, Integer> set: list){
				if(set.getValue()<=days){
					currentLevel=set.getKey();
				}
			}
			return currentLevel;
		}
		
		public static String getNextLevel(Integer days){
			init();
			String nextLevel=null;
			for(Map.Entry<String, Integer> set : list){
				if(set.getValue()>=days){
					nextLevel=set.getKey();
					break;
				}
			}
			return nextLevel;
		}
}
