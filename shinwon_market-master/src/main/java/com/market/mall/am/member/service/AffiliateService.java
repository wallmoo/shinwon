package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

public interface AffiliateService {
	public int selectInfoAffiliateListCount (Map<String, Object> commandMap) throws Exception;
	public List<Map<String,Object>> selectInfoAffiliateList (Map<String, Object> commandMap) throws Exception;
	public List<Map<String,Object>> selectInfoAffiliateListExcel (Map<String, Object> commandMap) throws Exception;
	public Map<String,Object> selectInfoAffiliateDetail (Map<String, Object> commandMap) throws Exception;
	public int insertAffiliate (Map<String, Object> commandMap) throws Exception;
	public int selectAffiliateNameCount(Map<String, Object> commandMap) throws Exception;
	public void updateAffiliate(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> slectPointList(Map<String, Object> commandMap)throws Exception;
	public int insertAffiliatePoint(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectInfoAffiliatePointList(Map<String, Object> commandMap) throws Exception;
	public int deleteAffiliatePoint(Map<String, Object> commandMap) throws Exception;
	public int updateAffiliatePoint(Map<String, Object> commandMap) throws Exception;
}
