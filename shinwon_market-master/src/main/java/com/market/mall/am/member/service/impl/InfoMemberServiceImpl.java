package com.market.mall.am.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @PackageName: com.market.mall.am.member.service.impl
 * @FileName : InfoMemberServiceImpl.java
 * @Date : 2014. 6. 20.
 * @프로그램 설명 : 관리자 > 회원관리 > 회원정보관리를 처리하는 Service Implement Class
 * @author LJH
 */
@Service("infoMemberService")
public class InfoMemberServiceImpl implements InfoMemberService{
    
    @Resource(name="defaultDAO")	private CommonDefaultDAO defaultDAO;
   
    @Resource	private Sms sms;
    
    @Resource   protected Mail mail;	
    
    @Resource(name ="propertiesService") protected EgovPropertyService propertiesService;
    
    @Autowired
    TagService tagService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH;

    /**
     * <pre>
     * 1. MethodName	: selectInfoMemberListCount
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 목록 갯수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:46:45
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInfoMemberListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectInfoMemberListCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectInfoMemberList
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:47:14
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoMemberList(Map<String, Object> commandMap) throws Exception 
    {
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectInfoMemberList",commandMap);
    	for(int i=0;i<list.size();i++) {
    		Map<String,Object> member = list.get(i);
    		String eShopId = StringUtil.getString(member.get("MEM_MST_ERP_ID"));
    		int point = 0;
    		if(!eShopId.isEmpty()) { 
    			member.put("ESHOP_ID", eShopId);
        		Map<String,Object> erpPoint =  ErpRequest.requestMemberPointCheck(member);
        		point = StringUtil.getInt(erpPoint.get("MemberPointCheckResult"));
    		}
    		member.put("ERP_PIT", point);
    	}
        return list; 
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectInfoMemberListExcel
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 엑셀다운로드
     * 4. 작성자			: LHY
     * 5. 작성일			: 2020. 6. 08. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception  
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoMemberListExcel(Map<String, Object> commandMap) throws Exception 
    {
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectInfoMemberListExcel",commandMap);
        /* 통합 포인트 , 임직원 포인트는 DB테이블에서 조회 수정     	
    	for(int i=0;i<list.size();i++) {
    		Map<String,Object> member = list.get(i);
    		String eShopId = StringUtil.getString(member.get("MEM_MST_ERP_ID"));
    		int point = 0;
    		if(!eShopId.isEmpty()) { 
    			member.put("ESHOP_ID", eShopId);
        		Map<String,Object> erpPoint =  ErpRequest.requestMemberPointCheck(member);
        		point = StringUtil.getInt(erpPoint.get("MemberPointCheckResult"));
    		}
    		member.put("ERP_PIT", point);
    	}
    	*/
        return list; 
    }	    
    

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectReviewEvent(Map<String, Object> commandMap) throws Exception 
    {
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectReviewEvent",commandMap);
        return list; 
    }
    
    
    

    /**
     * <pre>
     * 1. MethodName : selectMemberGradeList
     * 2. ClassName  : InfoMemberServiceImpl.java
     * 3. Comment    : 관리자 > 회원관리 > 회원관리 목록 > 검색 조건 - 회원등급 목록
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
 	 public List<Map<String,Object>> selectMemberGradeList (Map<String,Object> commandMap) throws Exception
     {
     	return defaultDAO.selectList("InfoMember.selectMemberGradeList", commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : insertSearchHistory
      * 2. ClassName  : InfoMemberServiceImpl.java
      * 3. Comment    : 관리자 > 회원관리 > 회원현황 목록에서 search클릭 시 history 저장
      * 4. 작성자       : DEV_KIMYEONGJUN
      * 5. 작성일       : 2016. 9. 5.
      * </pre>
      *
      * @param request
      * @param commandMap
      * @throws Exception
      */
      public void insertSearchHistory(HttpServletRequest request,Map<String,Object> commandMap) throws Exception
      {
      	  Admin admin = SessionsAdmin.getSessionAdmin(request);
          commandMap.put("MEM_MST_SEARCH_IP", request.getRemoteAddr());
          commandMap.put("MEM_MST_SEARCH_ID", admin.getADM_MST_ID());
          
      	  defaultDAO.insert("InfoMember.insertSearchHistory",commandMap);
      }  
      
     /**
      * 
      * <pre>
      * 1. MethodName	: selectMemberInfo
      * 2. ClassName	: InfoMemberServiceImpl.java
      * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 보기
      * 4. 작성자			: LeeJongHo
      * 5. 작성일			: 2014. 6. 20. 오후 1:47:34
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
     @SuppressWarnings("unchecked")
     public Map<String, Object> selectMemberInfo(Map<String, Object> commandMap) throws Exception 
     {
    	 Map<String,Object> result = defaultDAO.select("InfoMember.selectMemberInfo",commandMap);
    	 List<Map<String,Object>> tagList = defaultDAO.selectList("Tag.selectUserTagList", commandMap);
         commandMap.put(TAG_MODEL.TAG_BND_ID, commandMap.get("MEM_MST_MEM_ID").toString());
         if(tagList!=null && !tagList.isEmpty()) {
        	 result.put("TAG_LIST",tagList);
         }
    	 List<Map<String,Object>> privilegeList = defaultDAO.selectList("InfoMember.selectInfoMemberPrivilegeList", commandMap);
    	 List<Map<String,Object>> reviewPrivilegeList = new ArrayList<Map<String,Object>>();
    	 Iterator<Map<String,Object>> privilegeIterator = privilegeList.iterator();
    	 while(privilegeIterator.hasNext()){
    		Map<String,Object> privilege = (Map<String,Object>)privilegeIterator.next();
    		String idx = StringUtil.getString(privilege.get("CMN_COM_IDX"));
     		if(Code.REVIEWER_PREVILEGE.equals(idx)) {
     			privilege.put("CHILD", defaultDAO.select("InfoMember.selectInfoMemberPrivilegeChild", privilege));   
     			reviewPrivilegeList.add(privilege);
     		}
     		else {
     			result.put(idx, privilege);
     		}
    	 }
    	 if(reviewPrivilegeList!=null && !reviewPrivilegeList.isEmpty()) {
    		 result.put("PREVILEGE_LIST", reviewPrivilegeList);
         }
    	 
         return result;
     }
     
     /**
     * <pre>
     * 1. MethodName : selectCompMemberInfo
     * 2. ClassName  : InfoMemberServiceImpl.java
     * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 기업회원상세정보
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
 	@SuppressWarnings("unchecked")
 	public Map<String,Object> selectCompMemberInfo (Map<String,Object> commandMap) throws Exception
    {
         return defaultDAO.select("InfoMember.selectCompMemberInfo",commandMap);
    }
 	
    /**
    * <pre>
    * 1. MethodName : selectMemberPrivilegeInfo
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 특정권한 조회 하기 OOTD , 특정리뷰 2개 권한 조회 
    * 4. 작성자       : Lee Han YOung
    * 5. 작성일       : 2020.06.10
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
 	@SuppressWarnings("unchecked")
 	public Map<String,Object> selectMemberPrivilegeInfo (Map<String,Object> commandMap) throws Exception
    {
         return defaultDAO.select("InfoMember.selectMemberPrivilegeInfo",commandMap);
    }
 	
    /**
    * <pre>
    * 1. MethodName : selectMemberPrivilegeList
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 특정리뷰 권한 리스트 조회
    * 4. 작성자       : Lee Han YOung
    * 5. 작성일       : 2020.06.10
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
 	
 	@SuppressWarnings("unchecked")
 	public  List<Map<String,Object>> selectMemberPrivilegeList (Map<String,Object> commandMap) throws Exception
    {
 		
 		 commandMap.put("CMN_COM_IDX_REVIEW" , "3626");
         return defaultDAO.selectList("InfoMember.selectMemberPrivilegeList",commandMap);
    }
 	
 	

    /**
    * <pre>
    * 1. MethodName : updateInfoMember
    * 2. ClassName : InfoMemberServiceImpl.java
    * 3. Comment : 관리자 > 회원관리 > 회원정보 상세 > 회원정보 수정
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public Map<String,Object> updateInfoMember(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	int result = 1;
    	Admin admin = SessionsAdmin.getSessionAdmin(request);

    	commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("MEM_MST_UPD_ID", admin.getADM_MST_ID());
        commandMap.put("ADM_MST_ERP_NO", admin.getADM_MST_ERP_NO());	// 관리자 사번
        
        // 휴면회원 여부
        String RST_YN = StringUtil.getString(commandMap.get("RST_YN"),"");
        
        commandMap.put("MEMBER_TYPE_PRI", Code.COMMON_PRI_MEMBER_GRADE);
		commandMap.put("MEMBER_TYPE_SIMPLE", Code.MEMBER_TYPE_SIMPLE);
		commandMap.put("MEMBER_TYPE_COMP", Code.COMMON_COMP_MEMBER_GRADE);
		
		Map<String,Object> resultMap = defaultDAO.select("InfoMember.selectMemInfo", commandMap);
        

        try
        {
  
        	
        	//int MEM_MST_ERP_ID = StringUtil.getInt(resultMap.get("MEM_MST_ERP_ID"),0);
        	String MEM_MST_ERP_ID = StringUtil.getString(resultMap.get("MEM_MST_ERP_ID"),"0");
        	
        	
        	//int MEM_MST_ERP_ID = 0;
        	
        	// 탈퇴회원 수정 여부 확인 
        	// ERP_ID가 없는 경우 ?? 수정 가능 / 불가능 확인 필요 
        	
        	
        	// 기간계고객코드가 있는경우만 해당
			if(MEM_MST_ERP_ID != "0")
			{
				// 온라인 회원이 아닌경우만 해당
				if("N".equals(StringUtil.getString(resultMap.get("ONLINE_YN"))) && StringUtil.getInt(resultMap.get("MEM_MST_MEM_GBN")) != Code.MEMBER_TYPE_SIMPLE)
				{
					// 회원수정관련 프로시저 호출(ERP)
					Map<String,Object> erpJoinParamMap = new HashMap<String, Object>();
					
					// 회원정보 수정
					commandMap.put("P8E1URCD4",StringUtil.getString(resultMap.get("P8E1URCD4")));
					commandMap.put("erpLinkNm",propertiesService.getString("erp.db.link"));
					
					erpJoinParamMap.put("P_AN8", MEM_MST_ERP_ID);	// 고객번호
					erpJoinParamMap.put("P_E1URCD4", StringUtil.getString(resultMap.get("P8E1URCD4")));		// I/F 구분
					
					// 프로시저 호출 실패 시 에러 관련 처리해야함... rollback
					logger.info("#### R_RESULT ####"+String.valueOf(erpJoinParamMap.get("R_RESULT")));
					logger.info("#### R_SQLERRM ####"+String.valueOf(erpJoinParamMap.get("R_SQLERRM")));
					
					if(!"Y".equals(String.valueOf(erpJoinParamMap.get("R_RESULT"))))
					{
						commandMap.put("result",-99);
						commandMap.put("ERP_ERR_MSG", String.valueOf(erpJoinParamMap.get("R_SQLERRM")));
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
						return commandMap;
					}
				}
			}

			
			// 약관동의 수정
            List<Map<String,Object>> memberAgreeList = defaultDAO.selectList("InfoMember.selectMemberAgreeList", commandMap);
            String MEM_AGR_TRM_CD = "";	// 정보수신코드
            String OLD_TRM_YN = "";	// 기존 정보수신여부
            String NEW_TRM_YN = ""; // 바뀐 정보수신여부
            
            int agreeCnt = 0;
            
            for(int i=0; i < memberAgreeList.size(); i++)
            {
            	MEM_AGR_TRM_CD = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_CD"),"");	
            	OLD_TRM_YN = StringUtil.getString(memberAgreeList.get(i).get("MEM_AGR_TRM_YN"),"");		
            	NEW_TRM_YN = StringUtil.getString(commandMap.get("TRM_YN" + MEM_AGR_TRM_CD),"");	
            	
            	if(! OLD_TRM_YN.equals(NEW_TRM_YN))
            	{
            		commandMap.put("MEM_AGR_TRM_CD", MEM_AGR_TRM_CD);
            		commandMap.put("MEM_AGR_TRM_YN", NEW_TRM_YN);
            		
            		// 약관동의 수정
            		agreeCnt = defaultDAO.update("InfoMember.updateAgreeInfo", commandMap);
            	}
            }
            
            if(agreeCnt > 0)
            {
            	// 약관동의 수정되면 수정한 관리자 정보를 MEM_MST / MEM_RST 테이블에 update
            	if("Y".equals(RST_YN))
            	{
            		defaultDAO.update("InfoMember.updateRstAdminInfo", commandMap);
            	}
            	else if("N".equals(RST_YN))
            	{
            		defaultDAO.update("InfoMember.updateMstAdminInfo", commandMap);
            	}
            }
            
            if("Y".equals(RST_YN))
        	{
        		//휴면회원정보 수정
            	defaultDAO.update("InfoMember.updateInfoRestMember", commandMap);
        	}
        	else if("N".equals(RST_YN))
        	{
        		// 회원정보 수정
            	defaultDAO.update("InfoMember.updateInfoMember", commandMap);
        	}
            


            // 특정권한 정보 : 리뷰어회원 수정
    		if ( "Y".equals( commandMap.get("PRV_PRD_USE") ) ) {
    			
        		List<Map<String,Object>> prvlist = new ArrayList<Map<String,Object>>();
        		
        		System.out.println("=================PRV_PRD_USE=================" + commandMap.get("PRV_PRD_USE") );  
        		System.out.println("=================PRV_PRD_USE=================" + (String[])commandMap.get("PRV_PRD_TYPE") ); 
        		
        		
        		String[] prvPrdType = (String[])commandMap.get("PRV_PRD_TYPE");
        		String[] prvPreIdx  = (String[])commandMap.get("PRV_PRE_IDX");
        		String[] prvExpIdx  = (String[])commandMap.get("PRV_EXP_IDX");
        		String[] prvPrdIdx  = (String[])commandMap.get("PRV_PRD_IDX");
        		String[] prvPrdStDt = (String[])commandMap.get("PRV_PRD_ST_DT");
        		String[] prvPrdEdDt = (String[])commandMap.get("PRV_PRD_ED_DT");

 
        		for(int i=0;i<prvPrdType.length;i++) {
        			Map<String,Object> item = new HashMap<String,Object>();
        			item.put("PRV_PRD_TYPE" , prvPrdType[i]);
        			item.put("PRV_PRE_IDX"  , prvPreIdx[i] );
        			item.put("PRV_EXP_IDX"  , prvExpIdx[i] );
        			item.put("PRV_PRD_IDX"  , prvPrdIdx[i] );
        			item.put("PRV_PRD_ST_DT", prvPrdStDt[i]);
        			item.put("PRV_PRD_ED_DT", prvPrdEdDt[i]);    			
        			prvlist.add(item);    				
        		}
     		
        		// 신규 
        		for(int i=0;i< prvlist.size()  ;i++) {
        			if ( "NEW".equals( prvPrdType[i] )  ) {
            			// 시퀀스 조회 
            			int PreSeqNum =  defaultDAO.selectCount("InfoMember.selectPrivilegeSequence", commandMap);
            			
            			System.out.println("[PreSeqNum] " + PreSeqNum );  
            			
            			commandMap.put("MEM_SPC_PRV_IDX"    , PreSeqNum);
                    	commandMap.put("MEM_SPC_PRV_REG_ID" , admin.getADM_MST_ID());
                    	commandMap.put("CMN_COM_IDX"        , "3626");
                    	commandMap.put("MEM_SPC_PRV_BG_DT"  , prvPrdStDt[i] );
                    	commandMap.put("MEM_SPC_PRV_EXP_DT" , prvPrdEdDt[i] );
                    	defaultDAO.insert("InfoMember.insertInfoMemberPrivilege", commandMap);

                    	commandMap.put("MEM_SPC_PRV_BND_REG_ID" , admin.getADM_MST_ID());
                    	commandMap.put("EVT_MST_IDX" , prvExpIdx[i] );
                    	commandMap.put("PRD_MST_CD"  , prvPrdIdx[i] );                	
                    	defaultDAO.insert("InfoMember.insertInfoMemberPrivilegeBrand", commandMap);				
        				
        			}
        		}
        		
        		
        		// 수정 
        		for(int i=0;i< prvlist.size()  ;i++) {
        			if ( "UPD".equals( prvPrdType[i] )  ) {

            			commandMap.put("MEM_SPC_PRV_IDX"    , prvPreIdx[i]);
                    	commandMap.put("MEM_SPC_PRV_REG_ID" , admin.getADM_MST_ID());
                    	commandMap.put("CMN_COM_IDX"        , "3626");
                    	commandMap.put("MEM_SPC_PRV_BG_DT"  , prvPrdStDt[i] );
                    	commandMap.put("MEM_SPC_PRV_EXP_DT" , prvPrdEdDt[i] );
                    	defaultDAO.update("InfoMember.updateInfoMemberPrivilege", commandMap);

                    	commandMap.put("MEM_SPC_PRV_BND_REG_ID" , admin.getADM_MST_ID());
                    	commandMap.put("EVT_MST_IDX" , prvExpIdx[i] );
                    	commandMap.put("PRD_MST_CD"  , prvPrdIdx[i] );                	
                    	defaultDAO.update("InfoMember.updateInfoMemberPrivilegeBrand", commandMap);				
        				
        			}
        		}
        		
        		//삭제 
        		for(int i=0;i< prvlist.size()  ;i++) {
        			if ( "DEL".equals( prvPrdType[i] )  ) {

            			commandMap.put("MEM_SPC_PRV_IDX"    , prvPreIdx[i]);
                    	commandMap.put("CMN_COM_IDX"        , "3626");

                    	defaultDAO.delete("InfoMember.deleteInfoMemberPrivilegeBrand", commandMap);
                    	defaultDAO.delete("InfoMember.deleteInfoMemberPrivilege", commandMap);
        				
        			}
        		}

    		}
            
            
            
            // 특정권한 정보 : 특정리뷰회원 수정
            if (   "NEW".equals( commandMap.get("PRV_REVIEW_TYPE") )) {
            	
            	commandMap.put("MEM_SPC_PRV_REG_ID" , admin.getADM_MST_ID());
            	commandMap.put("CMN_COM_IDX"        , "3627"                            );
            	commandMap.put("MEM_SPC_PRV_BG_DT"  , commandMap.get("PRV_REVIEW_ST_DT"));
            	commandMap.put("MEM_SPC_PRV_EXP_DT" , commandMap.get("PRV_REVIEW_ED_DT"));
            	
            	defaultDAO.insert("InfoMember.insertInfoMemberPrivilegeOOTD", commandMap);
            	
            }
            else if(  "DEL".equals( commandMap.get("PRV_REVIEW_TYPE") )) {
            	
            	commandMap.put("CMN_COM_IDX"        , "3627");
            	commandMap.put("MEM_SPC_PRV_IDX", commandMap.get("PRV_REVIEW_IDX"));            	
            	defaultDAO.update("InfoMember.deleteInfoMemberPrivilegeOOTD", commandMap);
            
            }
            else if(  "UPD".equals( commandMap.get("PRV_REVIEW_TYPE") )) {
            	
            	commandMap.put("MEM_MST_UPD_ID"     , admin.getADM_MST_ID());
            	commandMap.put("MEM_SPC_PRV_IDX"    , commandMap.get("PRV_REVIEW_IDX"));
            	commandMap.put("CMN_COM_IDX"        , "3627");
            	commandMap.put("MEM_SPC_PRV_BG_DT"  , commandMap.get("PRV_REVIEW_ST_DT"));
            	commandMap.put("MEM_SPC_PRV_EXP_DT" , commandMap.get("PRV_REVIEW_ED_DT"));
            	defaultDAO.update("InfoMember.updateInfoMemberPrivilegeOOTD", commandMap);

            }            

            

            // 특정권한 정보 : 특정OOTD회원 수정
            if (   "NEW".equals( commandMap.get("PRV_OOTD_TYPE") )) {
            	
            	commandMap.put("MEM_SPC_PRV_REG_ID" , admin.getADM_MST_ID());
            	commandMap.put("CMN_COM_IDX"        , "3628");
            	commandMap.put("MEM_SPC_PRV_BG_DT"  , commandMap.get("PRV_OOTD_ST_DT"));
            	commandMap.put("MEM_SPC_PRV_EXP_DT" , commandMap.get("PRV_OOTD_ED_DT"));
            	
            	defaultDAO.insert("InfoMember.insertInfoMemberPrivilegeOOTD", commandMap);
            	
            }
            else if(  "DEL".equals( commandMap.get("PRV_OOTD_TYPE") )) {
            	
            	commandMap.put("CMN_COM_IDX"        , "3628");
            	commandMap.put("MEM_SPC_PRV_IDX", commandMap.get("PRV_OOTD_IDX"));            	
            	defaultDAO.update("InfoMember.deleteInfoMemberPrivilegeOOTD", commandMap);
            
            }
            else if(  "UPD".equals( commandMap.get("PRV_OOTD_TYPE") )) {
            	
            	commandMap.put("MEM_MST_UPD_ID"     , admin.getADM_MST_ID());
            	commandMap.put("MEM_SPC_PRV_IDX"    , commandMap.get("PRV_OOTD_IDX"));
            	commandMap.put("CMN_COM_IDX"        , "3628");
            	commandMap.put("MEM_SPC_PRV_BG_DT"  , commandMap.get("PRV_OOTD_ST_DT"));
            	commandMap.put("MEM_SPC_PRV_EXP_DT" , commandMap.get("PRV_OOTD_ED_DT"));
            	defaultDAO.update("InfoMember.updateInfoMemberPrivilegeOOTD", commandMap);

            }
 
            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        	commandMap.put("result", 00);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return commandMap;
        }
        
        commandMap.put("result",result);
		
		return commandMap;
    }
    
    /**
    * <pre>
    * 1. MethodName : insertErpError
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 회원정보 수정, 직권탈퇴 관련 ERP 프로시져 에러시
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void insertErpError (Map<String,Object> commandMap) throws Exception
	{
		defaultDAO.insert("InfoMember.insertErpError", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : updateMemberTempPw
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원(기업,개인,간편)상세 > 임시 비밀번호 발송
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 11. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public int updateMemberTempPw(HttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	// 임시 비밀번호 생성
    	int cnt = 10;
    	StringBuffer tempPw = new StringBuffer();
    	Random random = new Random();

    	for (int i = 0; i < cnt; i++) 
    	{
	    	if (random.nextBoolean()) 
	    	{
	    		tempPw.append((char) ((int) (random.nextInt(26)) + 97));
	    	} 
	    	else 
	    	{
	    		tempPw.append((random.nextInt(10)));
	    	}
    	}
    	
    	commandMap.put("MEM_MST_TEMP_PW", tempPw.toString());
    	//-- 임시 비밀번호 생성
    	
    	int result = 0;
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        commandMap.put("MEM_MST_UPD_ID", admin.getADM_MST_ID());
        
        // 회원분류(개인,기업,간편)
        int MEM_MST_MEM_GBN = StringUtil.getInt(commandMap.get("MEM_MST_MEM_GBN"),0);
        // 휴면회원여부
        String RST_YN = StringUtil.getString(commandMap.get("RST_YN"),"");
    	
        if("Y".equals(RST_YN))
    	{
        	// 생성된 임시 비밀번호로 수정(휴면회원)
        	result = defaultDAO.update("InfoMember.updateRestMemberTempPw", commandMap);	
    	}
    	else if("N".equals(RST_YN))
    	{
    		// 생성된 임시 비밀번호로 수정(회원)
    		result = defaultDAO.update("InfoMember.updateMemberTempPw", commandMap);	
    	}
    	
    	// sms 및 메일로 임시 비밀번호 발송 
    	if(result > 0)
    	{
    		// 임시 비밀번호를 이메일 또는 LMS로 보낼 회원의 간략한 정보 조회
    		Map<String,Object> sendMap = defaultDAO.select("InfoMember.selectSendMemInfo", commandMap);
    		
    		String userNm = FormatUtil.markingName(StringUtil.getString(sendMap.get("MEM_MST_MEM_NM"),""));	// 수신자 이름
    		
    		// 일반회원, 기업회원일 경우
    		if(MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE || MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE)
    		{
    			//sms 및 메일 발송
    			logger.info("sms 및 메일로 임시 비밀번호가 발송됩니다.");
    			
    			/* sms 발송 시작 */
    			Map<String,Object> smsMap = new HashMap<String,Object>();
    			
    			smsMap.put("TR_PHONE", StringUtil.getString(sendMap.get("MEM_MST_HP"),""));  

    			smsMap.put("TR_NAME", userNm);  		
    			
    			smsMap.put("TR_MSG", StringUtil.getString(propertiesService.getString("app.name"),"")+userNm+"님, 요청하신 임시비밀번호가 메일로 발송되었습니다. 임시비밀번호 유효기간은 4시간입니다. 로그인 후 변경해주세요.");
    			
    			Map<String, Object> resultSmsMap = this.sms.sendLongMessage(smsMap);
    			
    			// sms 결과 코드
    			String resultSmsCode = StringUtil.getString(resultSmsMap.get("resultCode"));
    			
    			logger.info("#################SMS 관련 LOG 시작#######################");
    			logger.info("resultCode : " + resultSmsCode);
    			logger.info("resultMsg : " + StringUtil.getString(resultSmsMap.get("resultMsg")));
    			logger.info("#################SMS 관련 LOG 끝#######################");
    			
    			// sms 발송 실패 시
    			if(Integer.valueOf(resultSmsCode) != 0)
    			{
    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    				result = -2;
    			}
    			/* sms 발송 끝 */
    			// sms 발송 성공 시
    			else
    			{
    				/* 메일 발송 시작 */
        			Map<String,Object> mailMap = new HashMap<String, Object>();
        			
        			// 회신 메일이 없는 경우
        			if("".equals(StringUtil.getString(sendMap.get("MEM_MST_MAIL"),"")))
        			{
        				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        				result = -1;
        			}
        				
        			mailMap.put("MAIL_CODE", "6");	// 이메일 코드
        			mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_MST_MAIL"),""));	//	수신자 이메일
        			mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
        			mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"")+ userNm  + "님, 요청하신 임시 비밀번호 안내드립니다. 로그인 후 변경해 주세요.");	// 메일 제목
        			
        			String loginUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do";
        			
        			StringBuffer resultContent = new StringBuffer();
            		
            		StringUtil.textSumDelimiter(resultContent.append(userNm));
            		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MASK_MEM_MST_MEM_ID") ,"")));
            		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(commandMap.get("MEM_MST_TEMP_PW"),"")));
            		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MEM_MST_TMP_PW_DT") ,"")));
            		StringUtil.textSumDelimiter(resultContent.append(loginUrl));

            		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
            		
            		Map<String,Object> resultMailMap = this.mail.mailSend(mailMap);
            		
            		// mail 결과 코드
            		String resultMailCode = StringUtil.getString(resultMailMap.get("resultCode"));
            		
            		logger.info("#################MAIL 관련 LOG 시작#######################");
        			logger.info("resultCode : " + resultMailCode);
        			logger.info("resultMsg : " + StringUtil.getString(resultMailMap.get("resultMsg")));
        			logger.info("#################MAIL 관련 LOG 끝#######################");
            		
        			// mail 발송 실패 시
        			if(Integer.valueOf(resultMailCode) != 0)
        			{
        				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        				result = -2;
        			}
        			/* 메일 발송 끝 */
    			}
    			
    		}
    		// 간편회원일 경우
    		else if(MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE)
    		{
    			// 메일만 발송
    			logger.info("메일로만 임시 비밀번호가 발송됩니다.");
    			
    			/* 메일 발송 시작 */
    			Map<String,Object> mailMap = new HashMap<String, Object>();
    			
    			// 회신 메일이 없는 경우
    			if("".equals(StringUtil.getString(sendMap.get("MEM_MST_MAIL"),"")))
    			{
    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    				result = -1;
    			}
    			
    			mailMap.put("MAIL_CODE", "6");	// 이메일 코드
    			mailMap.put("MEMBER_EMAIL", StringUtil.getString(sendMap.get("MEM_MST_MAIL"),""));	//	수신자 이메일
    			mailMap.put("MEMBER_NAME", userNm);	//	수신자 이름
    			mailMap.put("EMAIL_TITLE", StringUtil.getString(propertiesService.getString("app.name"),"") + userNm  + "님, 요청하신 임시 비밀번호 안내드립니다. 로그인 후 변경해 주세요.");	// 메일 제목
    			
    			String loginUrl = StringUtil.getString(request.getAttribute("serverSslDomain"), "") + "/pc/manager/login.do";
    			
    			StringBuffer resultContent = new StringBuffer();
        		
        		StringUtil.textSumDelimiter(resultContent.append(userNm));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MASK_MEM_MST_MEM_ID") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(commandMap.get("MEM_MST_TEMP_PW"),"")));
        		StringUtil.textSumDelimiter(resultContent.append(StringUtil.getString(sendMap.get("MEM_MST_TMP_PW_DT") ,"")));
        		StringUtil.textSumDelimiter(resultContent.append(loginUrl));

        		mailMap.put("EMAIL_CONTENTS", resultContent.toString());	// 메일 내용
        		
        		Map<String,Object> resultMailMap = this.mail.mailSend(mailMap);
        		
        		// mail 결과 코드
        		String resultMailCode = StringUtil.getString(resultMailMap.get("resultCode"));
        		
        		logger.info("#################MAIL 관련 LOG 시작#######################");
    			logger.info("resultCode : " + resultMailCode);
    			logger.info("resultMsg : " + StringUtil.getString(resultMailMap.get("resultMsg")));
    			logger.info("#################MAIL 관련 LOG 끝#######################");
        		
    			// mail 발송 실패 시
    			if(Integer.valueOf(resultMailCode) != 0)
    			{
    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    				result = -2;
    			}
    			/* 메일 발송 끝 */
    		}
    	}
    	
    	return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectCheckOrderCount
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 직권탈퇴 > 현재 주문이 있는지 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckOrderCount(Map<String,Object> commandMap) throws Exception
    {
    	// 주문상태
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);	// 배송완료
		commandMap.put("OST_FIX", Code.OST_FIX);	// 구매확정
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);	// 교환완료
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);	// 교환취소
		
		return defaultDAO.selectCount("InfoMember.selectCheckOrderCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectMemberName
     * 2. ClassName  : InfoMemberServiceImpl.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 각 페이지 상단 회원 정보
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 10.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMemberName(Map<String, Object> commandMap) throws Exception 
    {
    	// 회원 상세 정보
    	Map<String, Object> resultMap = defaultDAO.select("InfoMember.selectMemberName",commandMap);
    	
        return resultMap;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberCouponListCount
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 쿠폰보유내역 목록 갯수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 30. 오후 4:25:44
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberCouponListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectMemberCouponListCount",commandMap);
    }
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberUsableCouponCount
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 사용가능한 보유 쿠폰 갯수 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberUsableCouponCount(Map<String, Object> commandMap) throws Exception
    {

        return defaultDAO.selectCount("InfoMember.selectMemberUsableCouponCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberCouponList
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 쿠폰보유내역 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 30. 오후 4:25:56
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberCouponList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("Ecoupon.selectMemberCouponListExcel",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberCouponUseListCount
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 쿠폰사용내역 목록 갯수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 30. 오후 4:25:44
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberCouponUseListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectMemberCouponUseListCount",commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberCouponUseList
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 쿠폰사용내역 목록
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 7. 30. 오후 4:25:56
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberCouponUseList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("InfoMember.selectMemberCouponUseList",commandMap);
    }

    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryListCount
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberInquiryListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectInfoMemberInquiryListCount", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryList
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoMemberInquiryList(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("InfoMember.selectInfoMemberInquiryList", commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryInfo
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectInfoMemberInquiryInfo(Map<String, Object> commandMap) throws Exception
    {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
        // 첨부파일 정보
        commandMap.put("CMM_FLE_TB_NM", "T_BRD_INQ"); 
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("BRD_INQ_IDX"), ""));
        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
        
        returnMap.put("fileList", fileList);
        returnMap.put("row", defaultDAO.select("InfoMember.selectInfoMemberInquiryInfo", commandMap));
        return returnMap;
    }

    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberPointListCount
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 포인트 거래 내역 갯수 
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberPointListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectMemberPointListCount",commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName	: selectMemberPointList
     * 2. ClassName		: InfoMemberServiceImpl.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 포인트 거래 내역 
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 5. 7. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberPointList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("InfoMember.selectMemberPointList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberCartListCount
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 장바구니 내역 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberCartListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectInfoMemberCartListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberCartList
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 장바구니 내역
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoMemberCartList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("InfoMember.selectInfoMemberCartList",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberKeepingListCount
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 키핑상품 내역 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberKeepingListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectInfoMemberKeepingListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberKeepingList
    * 2. ClassName  : InfoMemberServiceImpl.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 키핑상품 내역
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoMemberKeepingList(Map<String, Object> commandMap) throws Exception 
    {
        return defaultDAO.selectList("InfoMember.selectInfoMemberKeepingList",commandMap);
    }
    
    
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInfoExecutivesListExcel(Map<String, Object> commandMap) throws Exception 
    { 
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectInfoExecutivesListExcel",commandMap);
        /* 통합 포인트 , 임직원 포인트는 DB테이블에서 조회 수정     	
    	for(int i=0;i<list.size();i++) {
    		Map<String,Object> member = list.get(i);
    		String eShopId = StringUtil.getString(member.get("MEM_MST_ERP_ID"));
    		int point = 0;
    		if(!eShopId.isEmpty()) { 
    			member.put("ESHOP_ID", eShopId);
        		Map<String,Object> erpPoint =  ErpRequest.requestMemberPointCheck(member);
        		point = StringUtil.getInt(erpPoint.get("MemberPointCheckResult"));
    		}
    		member.put("ERP_PIT", point);
    	}  
    	*/
        return list; 
    }	      
    
    @SuppressWarnings("unchecked")
    public int selectMemberCommentListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectMemberCommentListCount", commandMap);
    }

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberCommentList(Map<String, Object> commandMap) throws Exception 
    { 
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectMemberCommentList",commandMap);
        return list; 
    }	
    
    
    @SuppressWarnings("unchecked")
    public int selectMemberOOTDCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("InfoMember.selectInfoMemberOOTDCount", commandMap);
    }

    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberOOTDList(Map<String, Object> commandMap) throws Exception 
    { 
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectInfoMemberOOTDList",commandMap);
        return list; 
    }	    
    

	@Override
	public int selectInfoMemberLikeProductListCount(Map<String, Object> commandMap) throws Exception  {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("MeberLikeProduct.selectInfoMemberLikeProductListCount",commandMap);
	}

	@Override
	public List<Map<String, Object>> selectInfoMemberLikeProductList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("MeberLikeProduct.selectInfoMemberLikeProductList",commandMap);
	}

	@Override
	public List<Map<String, Object>> infoExecutivesList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("InfoMember.infoExecutivesList",commandMap);
	}

	@Override
	public int infoExecutivesCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("InfoMember.infoExecutivesCount",commandMap);
	}

	@Override
	public int changeNormalMember(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.update("InfoMember.changeNormalMember", commandMap);
	}

	@Override
	public int changeEmployeeMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.update("InfoMember.changeEmployeeMember", commandMap);
	}

	@Override
	public Map<String, Object> selectMemberDeliveryInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		commandMap.put("MEM_DLV_BSC_YN", "Y");
		return defaultDAO.select("InfoMember.selectMemberDeliveryInfo", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectMemberDeliveryList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("InfoMember.selectMemberDeliveryInfo", commandMap);
	}

	@Override
	public List<Map<String, Object>> selectMemberEshop(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("InfoMember.selectMemberEshopList", commandMap);
	}
	
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSellerList(Map<String, Object> commandMap) throws Exception 
    { 
    	List<Map<String,Object>> list = defaultDAO.selectList("InfoMember.selectInfoMemberVendorList",commandMap);
        return list; 
    }

	
    @SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> selectMemberGBNInfo(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("InfoMember.selectMemberGBNInfo",commandMap);
	}	
    

	

}
