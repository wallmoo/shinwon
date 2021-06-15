package com.market.mall.pc.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import sun.misc.BASE64Decoder;

import com.epasscni.common.exception.AccreditationException;
import com.epasscni.common.exception.PcAuthenticationException;
import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.DbCryptoUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Code;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.InfoMemberService;

/**
 * 
 * @PackageName: com.market.mall.pc.member.service.impl
 * @FileName : InfoMemberServiceImpl.java
 * @Date : 2014. 6. 23.
 * @프로그램 설명 : 프론트 > 회원을 처리하는 Service Implement Class
 * @author LJH
 */
@Service("pcInfoMemberService")
public class InfoMemberServiceImpl implements InfoMemberService{

    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
	@Resource(name = "pcCommonService") private CommonService pcCommonService;
    @Resource private Sms sms;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInfo
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 프론트 > 회원 > 회원 상세 정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 23.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectInfoMemberInfo (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
        if(SessionsUser.isLogin(request))
        {
            Map<String, Object> returnMap = new HashMap<String, Object>();
            BASE64Decoder decoder = new BASE64Decoder();
            
            // 비밀번호 Decoding(#BASE 64#)
            String WEB_PWD = new String(decoder.decodeBuffer(StringUtil.getString(commandMap.get("WEB_PWD"), "")));
            
            WEB_PWD = DbCryptoUtil.dbencrypt("table", "hash64", WEB_PWD);
            commandMap.put("WEB_PWD", WEB_PWD);
            
            int passwordCount = defaultDAO.selectCount("PcInfoMember.selectInfoMemberPasswordCount", commandMap);
            if(passwordCount > 0)
            {
                returnMap.put("resultCode", "0");
                returnMap.put("infoMemberInfo", defaultDAO.select("PcInfoMember.selectInfoMemberInfo", commandMap));
                logger.info("=====================================================================================");
                logger.info("resultCode : 0, Message : SUCCESS");
                logger.info("=====================================================================================");
            }
            else
            {
                returnMap.put("resultCode", "-1");
                logger.info("=====================================================================================");
                logger.info("resultCode : -1, Message : 비밀번호 불일치");
                logger.info("=====================================================================================");
            }
            return returnMap;
        }
        else
        {
            throw new PcAuthenticationException();
        }
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectCompanyList
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Commnet		: 프론트 > 회원 > 임직원 인증요청 > 계열사 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 8. 5. 오후 5:59:45
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCompanyList (Map<String, Object> commandMap) throws Exception
    {
    	return defaultDAO.selectList("PcInfoMember.selectCompanyList", commandMap);
    }


    /**
     * 
     * <pre>
     * 1. MethodName	: updateTempPasswordReset
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Commnet		: 프론트 > 회원 > 비밀번호 변경 > 임시비밀번호 발급여부 리셋
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 11. 20. 오후 8:24:03
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public int updateTempPasswordReset (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.update("PcInfoMember.updateTempPasswordReset", commandMap);
    }
}
