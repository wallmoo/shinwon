package com.market.mall.pc.email.service.impl;


import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.email.service.EmailService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
    * @PackageName: com.market.mall.pc.email.service.impl
    * @FileName : EmailServiceImpl.java
    * @Date : 2016. 1. 19.
    * @프로그램 설명 : 회원 이메일 설정
    * @author : DEV_LEEKWANGWOON
 */
@Service("emailService")
public class EmailServiceImpl implements EmailService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
    @Autowired 
    private FileUpload fileUpload;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * 
        * <pre>
        * 1. MethodName : selectMemberEmailInfo
        * 2. ClassName  : EmailServiceImpl.java
        * 3. Comment    : Email 수신거부 회원검색
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 19.
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberEmailInfo(Map<String, Object> commandMap) throws Exception {
   		return this.defaultDAO.select("Email.selectMemberEmailInfo", commandMap);
   	}
    
    
    /**
     * 
        * <pre>
        * 1. MethodName : updateMemberEmailYn
        * 2. ClassName  : EmailServiceImpl.java
        * 3. Comment    : 회원이메일 수신거부 설정
        * 4. 작성자       : DEV_LEEKWANGWOON
        * 5. 작성일       : 2016. 1. 19.
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
     */
	public int updateMemberEmailYn(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.update("Email.updateMemberEmailYn", commandMap);
	}    
    
    
    
}
