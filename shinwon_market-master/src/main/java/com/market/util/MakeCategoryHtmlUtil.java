package com.market.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.epasscni.util.StringUtil;

public class MakeCategoryHtmlUtil {

    /**
     * <pre>
     * 1. MethodName : makeCategoryHtml
     * 2. ClassName  : MakeCategoryHtmlUtil.java
     * 3. Comment    : 관리자 카테고리 html 생성 
     * 4. 작성자       : DEV_KIMHYOJOONG
     * 5. 작성일       : 2016. 9. 8.
     * </pre>
     *
     * @param list > category List
     * @param level > currLevel Column 명
     * @param idx > categoryIdx Column 명
     * @param name > categoryName Column 명
     * @return
     */
    public static String makeCategoryHtml(List<Map<String, Object>> list, String level, String idx, String name){
        // 카테고리 html구성
        StringBuilder returnString = new StringBuilder();
        
        int prevLevel = 1; // 이전 카테고리 level
        int currLevel = 1; // 현재 카테고리 level
        int categoryIdx = 0; // 카테고리 idx
        String categoryName = ""; // 카테고리 Name
        Map<String, Object> categoryMap = new HashMap<String, Object>(); // 카테고리 정보
        
        for(int i=0; i<list.size(); i++){
            categoryMap = (HashMap<String, Object>)list.get(i);
            currLevel = StringUtil.getInt(categoryMap.get(level));
            categoryIdx = StringUtil.getInt(categoryMap.get(idx));
            categoryName = StringUtil.getString(categoryMap.get(name));

            if(i == 0){ // 카테고리 시작
                returnString.append("<li>");
            }
            
            if(prevLevel == currLevel && i != 0){ // 동일 level
                returnString.append("</li><li class=\"closed\">");
            }else if(prevLevel > currLevel){ // 상위 level
                returnString.append("</li>");
                
                for(int j=0; j<prevLevel-currLevel; j++){
                    returnString.append("</ul></li>");
                }
                
                returnString.append("<li class=\"closed\">");
            }else if(prevLevel < currLevel){ // 하위 level
                returnString.append("<ul><li class=\"closed\">");
            }

            returnString.append("<span class=\"folder\" data-idx=\""+ categoryIdx +"\" data-level=\""+currLevel+"\">"+ categoryName +"</span>");

            if((i+1) == list.size()){ // 카테고리 종료
                returnString.append("</li>");
                
                for(int j=0; j<currLevel-1; j++){
                    returnString.append("</ul></li>");
                }
            }
            
            prevLevel = currLevel;
            categoryMap.clear();
        }
        
        return returnString.toString();
    }
}
