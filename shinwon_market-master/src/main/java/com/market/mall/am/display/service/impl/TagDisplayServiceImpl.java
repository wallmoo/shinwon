package com.market.mall.am.display.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.am.display.service.TagDisplayService;
import com.market.mall.common.constants.CONTENTS_TYPE_CODE;
import com.market.mall.dao.CommonDefaultDAO;


@Service("tagDisplayService")
public class TagDisplayServiceImpl implements TagDisplayService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<Map<String, Object>> selectTagDisplayCategoryList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("TagDisplay.selectTagDisplayCategoryList", commandMap);
	}
	
	@Override
	public List<Map<String, Object>> selectTagDisplayCategoryCodeList(Map<String, Object> commandMap) throws Exception {
		
		return defaultDAO.selectList("TagDisplay.selectTagDisplayCategoryCodeList", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectTagDisplayList(Map<String, Object> commandMap) throws Exception {

		return defaultDAO.selectList("TagDisplay.selectTagDisplayList", commandMap);
	}

	@Override
	public int insertTagDisplay(Map<String, Object> commandMap) throws Exception {
		
		String idx = StringUtil.getString(commandMap.get("CMN_COM_IDX"), "");
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("TAG_BND_ID", idx);
		
		param.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
		
		defaultDAO.delete("TagDisplay.deleteTagDisplay", param);
		
		String[] TAG_MST_IDs = (String[])commandMap.get("TAG_MST_IDs");
		List<Map<String, Object>> tags = new ArrayList<Map<String, Object>>();
		for(int index = 0; index < TAG_MST_IDs.length; index++) {
			Map<String, Object> tag = new HashMap<String, Object>();
			tag.put("TAG_BND_ID", idx);
			tag.put("TAG_BND_TYPE", CONTENTS_TYPE_CODE.TYPE_DISPLAY);
			tag.put("TAG_MST_ID", TAG_MST_IDs[index]);
			tags.add(tag);
		}
		Map<String, Object> insertParam = new HashMap<String, Object>();
		insertParam.put("arrTAG", tags);
		return defaultDAO.insertObject("TagDisplay.insertTagDisplay", insertParam);
	}
}
