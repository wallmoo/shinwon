/**
 * @PackageName: com.market.util
 * @FileName : CategoryUtil.java
 * @Date : 2015. 12. 17.
 * @프로그램 설명 : ***** 처리하는 Controller Class
 * @author moon
 */

package com.market.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import com.market.util.model.CategoryIndexName;

/**
 * @PackageName: com.market.util
 * @FileName : CategoryUtil.java
 * @Date : 2015. 12. 17.
 * @프로그램 설명 : ***** 처리하는 Controller Class
 * @author freelsj
 */
public class CategoryUtil {

	private static Pattern columnRegex = Pattern.compile("`");
	private static Pattern rowRegex = Pattern.compile(">");

	public static List<CategoryIndexName> getCategoryIndexNameList(String inputString) {

		List<CategoryIndexName> categoryIndexNameList = new ArrayList<CategoryIndexName>();
		
		if (inputString == null || "".equals(inputString))
			return categoryIndexNameList;

		String[] rowList = rowRegex.split(inputString, 0);
		
		for (String rowString: rowList) {
			
			String[] columnList = columnRegex.split(rowString, 0);
			
			CategoryIndexName categoryIndexName = new CategoryIndexName();
			categoryIndexName.setIndex(columnList[0]);
			categoryIndexName.setName(columnList[1]);
			categoryIndexNameList.add(categoryIndexName);
		}
		
		return categoryIndexNameList;
	}

	public static List<Map<String, Object>> convertCategoryTreeData(List<Map<String, Object>> categoryData){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for(int index = 0; index < categoryData.size(); index++) {
			if(categoryData.get(index).get("PRD_CTG_LEVEL").toString().equals("1")) {
				Map<String, Object> item = categoryData.get(index);
				appendChildCategory(item, categoryData);
				result.add(item);
			}
		}
		return result;
	}
	private static void appendChildCategory(Map<String, Object> parent, List<Map<String, Object>> categoryData) {
		List<Map<String, Object>> child = new ArrayList<Map<String, Object>>();
		for(int index = 0; index < categoryData.size(); index++) {
			String PRD_CTG_UP_IDX = categoryData.get(index).get("PRD_CTG_UP_IDX").toString();
			if(!PRD_CTG_UP_IDX.equals("-1") && PRD_CTG_UP_IDX.equals(parent.get("PRD_CTG_IDX").toString())) {
				Map<String, Object> item = categoryData.get(index); 
				appendChildCategory(item, categoryData);
				child.add(item);
			}
		}
		parent.put("child", child);
	}
/*	public static void main(String[] args) {

		String inputString = "1`TV/음향기기>11`TV>48`106cm 이하";

		List<CategoryIndexName> categoryIndexNameList = CategoryUtil.getCategoryIndexNameList(inputString);

		for (CategoryIndexName categoryIndexName : categoryIndexNameList) {
			System.out.println("categoryIndexName=[" + categoryIndexName.getIndex() + "," + categoryIndexName.getName() + "]");
		}

	}*/
}
