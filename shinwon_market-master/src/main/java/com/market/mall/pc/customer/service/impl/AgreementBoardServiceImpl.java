package com.market.mall.pc.customer.service.impl;

import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.customer.service.AgreementBoardService;
import com.market.util.StringUtils;


@Service("pcAgreementBoardService")
public class AgreementBoardServiceImpl implements AgreementBoardService {
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectAgreementInfo
	* 2. ClassName  : AgreementBoardServiceImpl.java
	* 3. Comment    : 프론트 이용약관 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAgreementInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcAgreementBoard.selectAgreementInfo", commandMap);
	}
	
	public Map<String, Object> selectAgreementInfo(String agreementCode) throws Exception {
	    Map<String, Object> result  = new HashMap<String, Object>();
	    Map<String,Object> agreementParam = new HashMap<String, Object>();
        agreementParam.put("BRD_AGR_TYPE", agreementCode);
        result = setAgreementContent(selectAgreementInfo(agreementParam));
        return result;
    }
	
	public List<Map<String,Object>> selectAgreementInfoByAgreementIndex(String agreementName) throws Exception {
	    Map<String, Object> agreementParam = new HashMap<String, Object>();
        agreementParam.put("CMN_COM_IDX", agreementName);
        List<Map<String,Object>> agreementList =  defaultDAO.selectList("PcAgreementBoard.selectAgreementInfoByAgreementSiblingIndex", agreementParam);
        return setAgreementContentList(agreementList);
	}
	
	
	public  Map<String, Object> selectAgreementInfoByAgreementTypeName(String agreementName) throws Exception {
		Map<String, Object> result  = new HashMap<String, Object>();
	    Map<String, Object> agreementParam = new HashMap<String, Object>();
        agreementParam.put("CMN_COM_NM", agreementName);
        result = setAgreementContent(defaultDAO.select("PcAgreementBoard.selectAgreementInfoByAgreementTypeName", agreementParam));
        return result;
	}
	private  List<Map<String, Object>> setAgreementContentList( List<Map<String, Object>> result) {
		for(int i=0;i<result.size();i++) {
			Map<String,Object> item = result.get(i);
			if(item.containsKey("BRD_AGR_CONTENTS") && item.get("BRD_AGR_CONTENTS") instanceof Clob){
	            Clob clob = (Clob)item.get("BRD_AGR_CONTENTS");
	            try {
					item.put("BRD_AGR_CONTENTS", StringUtils.clobToString(clob));
				} catch (SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
		}
		return result;
	}
	
	private  Map<String, Object> setAgreementContent( Map<String, Object> result) {
		if(result.containsKey("BRD_AGR_CONTENTS") && result.get("BRD_AGR_CONTENTS") instanceof Clob){
            Clob clob = (Clob)result.get("BRD_AGR_CONTENTS");
            try {
				result.put("BRD_AGR_CONTENTS", StringUtils.clobToString(clob));
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return result;
	}
	public  List<Map<String, Object>> selectAgreementInfoByMemberId(Map<String, Object> commandMap){
		List<Map<String,Object>> list = defaultDAO.selectList("PcAgreementBoard.selectAgreementInfoByMemberId", commandMap);
		return list;
	}
}
