package com.market.mall.pc.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.customer.service.ShoppingGuideBoardService;

/**
 * @PackageName: com.market.mall.pc.customer.service.impl
 * @FileName : ShoppingGuideBoardServiceImpl.java
 * @Date : 2014. 7. 23.
 * @프로그램 설명 : 프론트 > 고객센터 > 쇼핑가이드를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcShoppingGuideBoardService")
public class ShoppingGuideBoardServiceImpl implements ShoppingGuideBoardService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	/**
	* <pre>
	* 1. MethodName : selectShoppingGuideBoardList
	* 2. ClassName  : ShoppingGuideBoardServiceImpl.java
	* 3. Comment    : 쇼핑가이드 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectShoppingGuideBoardList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcShoppingGuideBoard.selectShoppingGuideBoardList", commandMap);
	}

	/**
	* <pre>
	* 1. MethodName : selectShoppingGuideBoardInfo
	* 2. ClassName  : ShoppingGuideBoardServiceImpl.java
	* 3. Comment    : 쇼핑가이드 상세
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectShoppingGuideBoardInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcShoppingGuideBoard.selectShoppingGuideBoardInfo", commandMap);
	}

	
	/**
	* <pre>
	* 1. MethodName : selectProductGuideBoardInfoList
	* 2. ClassName  : ShoppingGuideBoardServiceImpl.java
	* 3. Comment    : 상품가이드 상세 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 23.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductGuideBoardInfoList (Map<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> detailList = defaultDAO.selectList("PcShoppingGuideBoard.selectProductGuideBoardInfoList", commandMap);
		
		commandMap.put("CMM_FLE_TB_NM", "T_BRD_SHG");
		for(int i=0; i<detailList.size(); i++){
			commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(detailList.get(i).get("BRD_SHG_IDX"), ""));
			detailList.get(i).put("fileList",defaultDAO.selectList("Common.selectCommonFileList", commandMap));
		}
        return detailList;
	}
}
