package com.market.mall.am.vendor.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.StringUtil;
import com.market.mall.am.vendor.service.VendorLoginManagerService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.model.Admin;

/**
 * @PackageName: com.market.mall.am.vendor.service.impl
 * @FileName : VendorLoginManagerServiceImpl.java
 * @Date : 2016. 8. 26.
 * @프로그램 설명 : 관리자 > 입점업체관리 > 입점상담 업체관리를 처리하는 Controller Class
 * @author DEV_LEESANGWOOK
 */
@Service("vendorLoginManagerService")
public class VendorLoginManagerServiceImpl implements VendorLoginManagerService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource
	protected Mail mail;	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerListCount
	 * 2. ClassName  : VendorLoginManagerServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체관리 목록 개수
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectVendorLoginManagerListCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("VendorLoginManager.selectVendorLoginManagerListCount", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerList
	 * 2. ClassName  : VendorLoginManagerServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체관리 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectVendorLoginManagerList (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectList("VendorLoginManager.selectVendorLoginManagerList", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorLoginManagerInfo
	 * 2. ClassName  : VendorLoginManagerServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectVendorLoginManagerInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("VendorLoginManager.selectVendorLoginManagerInfo", commandMap);
	}
	
	
	/**
     * <pre>
     * 1. MethodName : updateVendorLoginManager
     * 2. ClassName  : VendorLoginManagerServiceImpl.java
     * 3. Comment    : 관리자 > 입점업체관리 > 입점상담 업체 수정
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 26.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateVendorLoginManager (Map<String,Object> commandMap) throws Exception
    {
        return defaultDAO.update("VendorLoginManager.updateVendorLoginManager", commandMap);
    }

    @Override
    public int updateVendorMemTempPw(Map<String, Object> commandMap)
            throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }
}
