package com.market.mall.am.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.market.mall.am.site.service.O2OStoreListService;
import com.market.mall.dao.CommonDefaultDAO;


@Service("o2oStoreListService")
public class O2OStoreListServiceImpl implements O2OStoreListService{

    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	@Override
	public int selectO2OStoreListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("O2OStore.selectO2OStoreListCount", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectO2OStoreList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("O2OStore.selectO2OStoreList", commandMap);
	}

	@Override
	public int insertO2OStoreBatch(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("O2OStore.insertO2OStoreBatch", commandMap);
	}

	@Override
	public Map<String, Object> selectO2OStoreDetail(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("O2OStore.selectO2OStoreDetail", commandMap);
	}

	@Override
	public int deleteO2OStore(Map<String, Object> param) throws Exception {
		return defaultDAO.delete("O2OStore.deleteO2OStore", param);
	}
	
	@Override
	public int deleteO2OStoreListAll() throws Exception {
	    return defaultDAO.insert("O2OStore.deleteO2OStoreListAll", null);
	}
	
	@Override
	public int updateOperateTime(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.update("O2OStore.updateOperateTime", commandMap);
	}
}
