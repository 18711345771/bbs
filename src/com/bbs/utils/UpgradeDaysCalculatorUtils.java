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
	    	map.put("LV1", 0);
	    	map.put("LV4", 60);
	    	map.put("LV8", 196);
	    	map.put("LV12", 396);
	    	map.put("LV18", 816);
	    	map.put("LV22", 1176);
	    	map.put("LV26", 1600);
	    	map.put("LV30", 2088);
	    	map.put("LV35", 2788);
	    	map.put("LV38", 3256);
	    	map.put("LV42", 3936);
	    	map.put("LV46", 4680);
	    	map.put("LV52", 5916);
	    	map.put("LV56", 6820);
	    	map.put("LV60", 7788);
	    	map.put("LV65", 9088);
	    	map.put("LV68", 9916);
	    	map.put("LV72", 11076);
	    	map.put("LV76", 12300);
	    	map.put("LV80", 13588);
	    	map.put("LV86", 15640);
	    	map.put("LV90", 17088);
	    	map.put("LV94", 18600);
	    	map.put("LV98",20176);
	    	
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
