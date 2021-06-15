package com.epasscni.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.market.mall.model.JstreeAttributes;

public class DataConvertUtil {
    /**
     * Jstree Data로 변환.
     * 
     * @param dataList
     * @param topMenuAddOrDel
     * @param code
     * @param upperCode
     * @return
     * @author 박종윤
     */
    @SuppressWarnings("unchecked")
    public ArrayList<Map<String, Object>> convertTreeData(List<Map<String,Object>> dataList, boolean topMenuAddOrDel, String id, String upperId, String title, String level) {

        Integer startNum = 1;

        // 가장 상위 data 포함시킬지 여부
        if (topMenuAddOrDel) {
            startNum = 0;
        }

        HashMap<String, Object> nodeMap = new HashMap<String, Object>();
        HashMap<String, Object> item = null;
        String menuId;
        String parentID;

        for (int i = startNum; i < dataList.size(); i++) {
            item = (HashMap<String, Object>) dataList.get(i);
            menuId = String.valueOf(item.get(id));

            if (menuId != null || menuId != "") {
                nodeMap.put(menuId, item); // nodeMap에 모두 담아둠.
            }
        }

        ArrayList<Map<String, Object>> rootNodeList = new ArrayList<Map<String, Object>>();

        for (int i = startNum; i < dataList.size(); i++) {
            item = (HashMap<String, Object>) dataList.get(i);
            parentID = String.valueOf(item.get(upperId));
            menuId = String.valueOf(item.get(id));

            if (Integer.parseInt(parentID) == -1) {
                addAttr(item, id, title, upperId, level);
                rootNodeList.add(item);
            } else {
            	HashMap<String, Object> parentNode = (HashMap<String, Object>) nodeMap.get(parentID);

                if (parentNode == null) {
                    addAttr(item, id, title, upperId, level);
                    rootNodeList.add(item);
                } else {
                    ArrayList<HashMap<String, Object>> childNodes = (ArrayList<HashMap<String, Object>>) parentNode.get("children");

                    if (childNodes == null) {
                        childNodes = new ArrayList<HashMap<String, Object>>();
                        parentNode.put("children", childNodes);
                    }
                    addAttr(item, id, title, upperId, level);
                    childNodes.add(item);
                }
            }
        }

        return rootNodeList;
    }
    
    /**
     * data 속성 추가
     * 
     * @param item
     * @author 박종윤
     */
    private void addAttr(HashMap<String, Object> item, String id, String title, String upperId, String level) {
        JstreeAttributes attr = new JstreeAttributes(String.valueOf(item.get(id)), String.valueOf(item.get(title)), String.valueOf(item.get(upperId)), String.valueOf(item.get(level)));
        item.put("data", String.valueOf(item.get(title)));
        item.put("attr", attr);
    }
}
