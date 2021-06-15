package com.market.mall.am.marketing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.EcouponService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.marketing.service.impl
 * @FileName : EcouponServiceImpl.java
 * @Date : 
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 쿠폰 관리를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("ecouponService")
public class EcouponServiceImpl implements EcouponService{
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Autowired 
    private FileUpload fileUpload;
    
    @Resource(name="commonService") private CommonService commonService;
    /**
     * <pre>
     * 1. MethodName : selectOnlineCouponListCount
     * 2. ClassName  : EcouponServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
     * 4. 작성자       : 
     * 5. 작성일       : 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public int selectOnlineCouponListCount (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("Ecoupon.selectOnlineCouponListCount", commandMap);
     }
     
          
     /**
     * <pre>
     * 1. MethodName : selectOnlineCouponList
     * 2. ClassName  : EcouponServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
     * 4. 작성자       : 
     * 5. 작성일       : 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectOnlineCouponList (Map<String, Object> commandMap) throws Exception
     {
    	 commandMap.put("CODE", Code.COUPON_TYPE);
         return defaultDAO.selectList("Ecoupon.selectOnlineCouponList", commandMap);
     }
     
     /**
      * <pre>
      * 1. MethodName : selectOnlineCouponNO
      * 2. ClassName  : EcouponServiceImpl.java
      * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
      * 4. 작성자       : 
      * 5. 작성일       : 
      * </pre>
      *
      * @param commandMap
      * @return
      * @throws Exception
      */
      public String selectOnlineCouponNO (Map<String, Object> commandMap) throws Exception
      {
          return defaultDAO.selectStr("Ecoupon.selectOnlineCouponNO",commandMap);
      }
      
      /**
       * <pre>
       * 1. MethodName : selectOnlineCouponNm
       * 2. ClassName  : EcouponServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
       * 4. 작성자       : 
       * 5. 작성일       : 
       * </pre>
       *
       * @param commandMap
       * @return
       * @throws Exception
       */
       public String selectOnlineCouponNm (Map<String, Object> commandMap) throws Exception
       {
           return defaultDAO.selectStr("Ecoupon.selectOnlineCouponNm",commandMap);
       }
      
      /**
       * <pre>
       * 1. MethodName : insertOnlineCoupon
       * 2. ClassName  : EcouponServiceImpl.java
       * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 등록 
       * 4. 작성자       : 
       * 5. 작성일       :
       * </pre>
       *
       * @param request
       * @param commandMap
       * @return
       * @throws Exception
       */
       @SuppressWarnings({ "unchecked", "rawtypes" })
       public int insertOnlineCoupon (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
       {
           int result = 0;
           String CPN_MST_MEM_GRD = StringUtil.getString(commandMap.get("CPN_MST_MEM_GRD"), "");
           String CPN_MST_TGT_GBN = StringUtil.getString(commandMap.get("CPN_MST_TGT_GBN"), "");
           String CPN_MST_MBR_GBN = StringUtil.getString(commandMap.get("CPN_MST_MBR_GBN"), "");
           String CPN_MST_SMP_YN = StringUtil.getString(commandMap.get("CPN_MST_SMP_YN"), "");
           String CPN_MST_NML_YN = StringUtil.getString(commandMap.get("CPN_MST_NML_YN"), "");
           String CPN_MST_ETC_GBN = StringUtil.getString(commandMap.get("CPN_MST_ETC_GBN"), "");
           String CPN_MST_PRM_GBN = StringUtil.getString(commandMap.get("CPN_MST_PRM_GBN"), "");
           int CPN_MST_ISU_CNT = StringUtil.getInt(commandMap.get("CPN_MST_ISU_CNT"), 0);
           
           Admin admin = SessionsAdmin.getSessionAdmin(request);
           String REG_ID = admin.getADM_MST_ID();
           String REG_IP = request.getRemoteAddr();
           
           commandMap.put("CPN_MST_REG_IP", REG_IP);
           commandMap.put("CPN_MST_REG_ID", REG_ID);
           
           String CPN_MST_GBN = StringUtil.getString(commandMap.get("CPN_MST_GBN"), "");
           String CPN_MST_IDX = defaultDAO.selectStr("Ecoupon.selectOnlineCouponNO",commandMap);
           
           commandMap.put("CPN_MST_IDX", CPN_MST_IDX);

    	   commandMap.put("CPN_MST_PTN_SHP_YN", CPN_MST_GBN.equals(Code.CPN_MST_GBN_PROMOTION) ? "Y" : "N");
    	   commandMap.put("CPN_MST_PTN_SHP_RND", "");
    	   if(CPN_MST_PRM_GBN.equals(Code.CPN_MST_PRM_GBN_PROMOTION)) {
    		   commandMap.put("CPN_PTN_SHP_GBN", "F");
    	   }else if(CPN_MST_PRM_GBN.equals(Code.CPN_MST_PRM_GBN_PAPER)) {
    		   commandMap.put("CPN_PTN_SHP_GBN", "R");
    		   commandMap.put("CPN_MST_PTN_SHP_RND", CPN_MST_ISU_CNT);
    	   }else {
    		   commandMap.put("CPN_PTN_SHP_GBN", "");
    	   }
    	   
    	   //타임쿠폰 등록
    	   if(CPN_MST_GBN.equals(Code.CPN_MST_GBN_TIME)){
    	       String jsonList = StringUtil.getString(commandMap.get("jsonData"),"");
    	       
    	       ObjectMapper mapper = new ObjectMapper();
    	       TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>(){};
    	       
    	       List<Map<String,Object>> scheduleList = mapper.readValue(jsonList,typeRef);
    	       
    	       for(int index = 0; index < scheduleList.size(); index++ ){
    	           Map<String, Object> paramMap = new HashMap<String, Object>();
    	           paramMap.put("CPN_MST_IDX", StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""));
    	           paramMap.put("CPN_MST_GBN", CPN_MST_GBN);
    	           
    	           paramMap.put("CPN_SCH_ORDER", StringUtil.getString(scheduleList.get(index).get("CPN_SCH_ORDER"),""));
    	           
    	           String startDT = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ST_DT"),"");
    	           String startHH = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ST_HH"),"");
    	           String startMM = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ST_MM"),"");
    	           paramMap.put("CPN_MST_ISU_ST_DT", startDT);
    	           paramMap.put("CPN_MST_ISU_ST_HH", startHH);
    	           paramMap.put("CPN_MST_ISU_ST_MM", startMM);
    	           
                   String endDT = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ED_DT"),"");
                   String endHH = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ED_HH"),"");
                   String endMM = StringUtil.getString(scheduleList.get(index).get("CPN_MST_ISU_ED_MM"),"");
                   paramMap.put("CPN_MST_ISU_ED_DT", endDT);
                   paramMap.put("CPN_MST_ISU_ED_HH", endHH);
                   paramMap.put("CPN_MST_ISU_ED_MM", endMM);
                   
                   int amount = StringUtil.getInt(scheduleList.get(index).get("CPN_MST_ISU_CNT"));
                   paramMap.put("CPN_MST_ISU_CNT", amount);
                   
                   String liminYN = StringUtil.getString(scheduleList.get(index).get("CPN_MST_LMT_YN"),"");
                   paramMap.put("CPN_MST_LMT_YN", liminYN);
                   
                   defaultDAO.insert("Ecoupon.insertScheduleDetail", paramMap);
                   
    	       }
    	       
    	   }
    	   
    	   
           // 쿠폰 등록
           result = defaultDAO.insert("Ecoupon.insertOnlineCoupon", commandMap);           
           
           if(result > 0){
        	   //쿠폰대상정보
        	   if(CPN_MST_TGT_GBN != ""){
	        	   if(CPN_MST_TGT_GBN.equals(Code.CPN_MST_TGT_GBN_PRD)){	        	   
			        	// 적용상품 등록 
			   	        String [] arrPRD_MST_CD = (String[]) commandMap.get("arrPRD_MST_CD");
			   	        if(arrPRD_MST_CD != null)
			   	        {
			   	        	for ( String PRD_MST_CD : arrPRD_MST_CD )
			   	        	{
			   	        		commandMap.put("PRD_PRD_MST_CD", PRD_MST_CD);
			   	        		result = defaultDAO.insert("Ecoupon.insertProduct",commandMap);
			   	        	}
			   	        }
	        	   }else if(CPN_MST_TGT_GBN.equals(Code.CPN_MST_TGT_GBN_EVT)){
	        		   // 기획전 등록 
	        		   commandMap.put("PRD_PRD_MST_CD", commandMap.get("CPN_MST_PLN_IDX"));
	        		   result = defaultDAO.insert("Ecoupon.insertProduct",commandMap);
	        		   
	        	   }else if(CPN_MST_TGT_GBN.equals(Code.CPN_MST_TGT_GBN_BRD)){	        		   
	        		   // 브랜드 등록 
	        		   String [] arrPRD_BND_IDXs2 = (String[]) commandMap.get("arrPRD_BND_IDXs2");
			   	       if(arrPRD_BND_IDXs2 != null)
			   	       {
			   	    	   for ( String PRD_BND_CDs2 : arrPRD_BND_IDXs2 )
			   	    	   {
			   	    		   commandMap.put("PRD_PRD_MST_CD", PRD_BND_CDs2);
			   	    		   result = defaultDAO.insert("Ecoupon.insertProduct",commandMap);
			   	    	   }
			   	       	}
	        	   }
	           }
        	   
        	   //쿠폰적용제외상품
        	   if(CPN_MST_ETC_GBN != ""){
	        	   
	        	   if(CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_PRD)){	        	   
			        	// 적용상품 등록 
			   	        String [] arrPRD_MST_CD2 = (String[]) commandMap.get("arrPRD_MST_CD2");
			   	        if(arrPRD_MST_CD2 != null)
			   	        {
			   	        	for ( String PRD_MST_CD2 : arrPRD_MST_CD2 )
			   	        	{
			   	        		commandMap.put("PRD_PRD_MST_CD", PRD_MST_CD2);
			   	        		result = defaultDAO.insert("Ecoupon.insertProductEx",commandMap);
			   	        	}
			   	        }
	        	   }else if(CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_CATE)){	      
	        		    // 카테고리 등록 
			   	        String [] arrPRD_CTG_IDX = (String[]) commandMap.get("arrPRD_CTG_IDX");
			   	        if(arrPRD_CTG_IDX != null)
			   	        {
			   	        	for ( String PRD_CTG_IDX : arrPRD_CTG_IDX )
			   	        	{
			   	        		commandMap.put("PRD_PRD_MST_CD", PRD_CTG_IDX);
			   	        		result = defaultDAO.insert("Ecoupon.insertProductEx",commandMap);
			   	        	}
			   	        }
	        		   
	        	   }else if(CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_BRD)){	      
	        		   // 브랜드 등록 
	        		   String [] APPLY_BND_IDXs = (String[]) commandMap.get("arrPRD_BND_IDXs");
			   	       if(APPLY_BND_IDXs != null)
			   	       {
			   	    	   for ( String PRD_BND_CDs : APPLY_BND_IDXs )
			   	    	   {
			   	    		   commandMap.put("PRD_PRD_MST_CD", PRD_BND_CDs);
			   	    		   result = defaultDAO.insert("Ecoupon.insertProductEx",commandMap);
			   	    	   }
			   	       	}
	        	   }else if(CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_PTN)){	 
	        		   // 협력업체 등록 
	        		   String [] arrPRD_VDR_IDXs = (String[]) commandMap.get("arrPRD_VDR_IDXs");
			   	       if(arrPRD_VDR_IDXs != null)
			   	       {
			   	    	   for ( String PRD_VEN_CDs : arrPRD_VDR_IDXs )
			   	    	   {
			   	    		   commandMap.put("PRD_PRD_MST_CD", PRD_VEN_CDs);
			   	    		   result = defaultDAO.insert("Ecoupon.insertProductEx",commandMap);
			   	    	   }
			   	       	}
	        	   }
	           }
        	   
        	   
        	   
        	   //쿠폰대상정보 -> 회원구분/개별회원여부
//               if(CPN_MST_MBR_GBN.equals("A")){
//            	   if(CPN_MST_NML_YN.equals("Y")){
//            		   if(CPN_MST_MEM_GRD != ("")){
//            			   commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);
//            			   commandMap.put("MEM_MST_MEM_GRD", commandMap.get("CPN_MST_MEM_GRD"));
//    	        		   result = defaultDAO.insert("Ecoupon.insertMember",commandMap);
//            		   }else{
//            			   commandMap.put("MEM_MST_MEM_GBN", Code.COMMON_PRI_MEMBER_GRADE);
//                    	   result = defaultDAO.insert("Ecoupon.insertMemberSmp",commandMap);           
//            		   }
//            	   }
//               }
//               //쿠폰대상정보 -> 간편회원사용여부
//               if(CPN_MST_SMP_YN.equals("Y")){
//            	   commandMap.put("MEM_MST_MEM_GBN", Code.MEMBER_TYPE_SIMPLE);
//            	   result = defaultDAO.insert("Ecoupon.insertMemberSmp",commandMap);            		 
//               }
        	   
        	   // 페이퍼 쿠폰 등록시 
        	   if(CPN_MST_GBN.equals(Code.CPN_MST_GBN_PROMOTION) && CPN_MST_PRM_GBN.equals(Code.CPN_MST_PRM_GBN_PAPER)) {
        		   commandMap.put("CPN_MST_IDX", CPN_MST_IDX);
        		   commandMap.put("CPN_PTN_SHP_USE_YN", "Y");
        		   
        		   defaultDAO.insert("Ecoupon.insertOfflineCoupon", commandMap);
        	   }
        	   
           }
           
           return result;
       }
       
       /**
        * <pre>
        * 1. MethodName : selectOnlineCouponListInfo
        * 2. ClassName  : EcouponServiceImpl.java
        * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 상세정보 
        * 4. 작성자       : 
        * 5. 작성일       : 
        * </pre>
        *
        * @param commandMap
        * @return
        * @throws Exception
        */
        public Map<String, Object> selectOnlineCouponListInfo (Map<String, Object> commandMap) throws Exception
        {
           Map<String, Object> returnMap = new HashMap<String, Object>();
           commandMap.put("CPN_MST_IDX", StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""));
           commandMap.put("CMN_COM_UP_IDX", Code.COUPON_TYPE);
           returnMap.put("row", defaultDAO.select("Ecoupon.selectOnlineCouponListInfo", commandMap));
           
           return returnMap;
        }
        
        /**
         * <pre>
         * 1. MethodName : updateOnlineCoupon
         * 2. ClassName  : EcouponServiceImpl.java
         * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 수정 
         * 4. 작성자       : 
         * 5. 작성일       : 
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
         @SuppressWarnings("unchecked")
         public int updateOnlineCoupon (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
         {
             Admin admin = SessionsAdmin.getSessionAdmin(request);
             commandMap.put("CPN_MST_UPD_IP", request.getRemoteAddr());
             commandMap.put("CPN_MST_UPD_ID", admin.getADM_MST_ID());
             
             int result = 0;
             
             // 쿠폰 정보 수정
             result = defaultDAO.update("Ecoupon.updateOnlineCoupon", commandMap);             
             
             return result;
         }
        
        /**
         * <pre>
         * 1. MethodName : updateOnlineCouponStatus
         * 2. ClassName  : EcouponServiceImpl.java
         * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 사용 가능 상태 수정 
         * 4. 작성자       : 이원중
         * 5. 작성일       : 2020-06-09
         * </pre>
         *
         * @param request
         * @param commandMap
         * @return
         * @throws Exception
         */
         public int updateOnlineCouponStatus (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
         {
             Admin admin = SessionsAdmin.getSessionAdmin(request);
             commandMap.put("CPN_MST_UPD_IP", request.getRemoteAddr());
             commandMap.put("CPN_MST_UPD_ID", admin.getADM_MST_ID());
             
             int result = 0;
             
             // 쿠폰 정보 수정
             result = defaultDAO.update("Ecoupon.updateOnlineCouponStatus", commandMap);             
             return result;
         }
         
         /**
          * <pre>
          * 1. MethodName : selectPlanList
          * 2. ClassName : GiftServiceImpl.java
          * 3. Comment : 기획전 목록 가져오기
          * 4. 작성자 : 
          * 5. 작성일 : 
          * </pre>
          *
          * @param commandMap
          * @return
          * @throws Exception
          */
          @SuppressWarnings("unchecked")
          public List<Map<String, Object>> selectPlanList (Map<String, Object> commandMap) throws Exception
          {
          	
              return defaultDAO.selectList("Gift.selectPlanList", commandMap);
          }
          
          /**
           * <pre>
           * 1. MethodName : onlineCouponIssueDetCount
           * 2. ClassName  : EcouponServiceImpl.java
           * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
           * 4. 작성자       : 
           * 5. 작성일       : 
           * </pre>
           *
           * @param commandMap
           * @return
           * @throws Exception
           */
           public int onlineCouponIssueDetCount (Map<String, Object> commandMap) throws Exception
           {
               return defaultDAO.selectCount("Ecoupon.onlineCouponIssueDetCount", commandMap);
           }
          
          /**
           * <pre>
           * 1. MethodName : onlineCouponIssueDetList
           * 2. ClassName  : EcouponServiceImpl.java
           * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
           * 4. 작성자       : 
           * 5. 작성일       : 
           * </pre>
           *
           * @param commandMap
           * @return
           * @throws Exception
           */
           @SuppressWarnings("unchecked")
           public List<Map<String, Object>> onlineCouponIssueDetList (Map<String, Object> commandMap) throws Exception
           {
               return defaultDAO.selectList("Ecoupon.onlineCouponIssueDetList", commandMap);
           }
           
           /**
            * <pre>
            * 1. MethodName : onlineCouponListEditY
            * 2. ClassName  : EcouponServiceImpl.java
            * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
            * 4. 작성자       : 
            * 5. 작성일       : 
            * </pre>
            *
            * @param commandMap
            * @return
            * @throws Exception
            */
            @SuppressWarnings("unchecked")
            public List<Map<String, Object>> onlineCouponListEditY (Map<String, Object> commandMap) throws Exception
            {
            	//commandMap.put("T_CPN_TGT_ETC", "(SELECT CPN.CPN_TGT_CD FROM T_CPN_TGT CPN WHERE CPN.CPN_TGT_GBN = #CPN_MST_TGT_GBN# AND CPN.CPN_MST_IDX = #CPN_MST_IDX# )");
            	//commandMap.put("T_CPN_TGT_ETC", commandMap.get("T_CPN_TGT"));
            	return defaultDAO.selectList("Ecoupon.onlineCouponListEditY", commandMap);
            }
            
            /**
             * <pre>
             * 1. MethodName : onlineCouponListEditY
             * 2. ClassName  : EcouponServiceImpl.java
             * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
             * 4. 작성자       : 
             * 5. 작성일       : 
             * </pre>
             *
             * @param commandMap
             * @return
             * @throws Exception
             */
             @SuppressWarnings("unchecked")
             public List<Map<String, Object>> onlineCouponListEditY_C (Map<String, Object> commandMap) throws Exception
             {   
            	 commandMap.put("T_CPN_TGT_ETC", "T_CPN_TGT");
                 return defaultDAO.selectList("Ecoupon.onlineCouponListEditY_C", commandMap);
             }
             
             /**
              * <pre>
              * 1. MethodName : onlineCouponListEditY
              * 2. ClassName  : EcouponServiceImpl.java
              * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
              * 4. 작성자       : 
              * 5. 작성일       : 
              * </pre>
              *
              * @param commandMap
              * @return
              * @throws Exception
              */
              @SuppressWarnings("unchecked")
              public List<Map<String, Object>> onlineCouponListEditY_D (Map<String, Object> commandMap) throws Exception
              {
            	  commandMap.put("T_CPN_TGT_ETC", "T_CPN_TGT");
                  return defaultDAO.selectList("Ecoupon.onlineCouponListEditY_D", commandMap);
              }
            
            /**
             * <pre>
             * 1. MethodName : onlineCouponListEditY
             * 2. ClassName  : EcouponServiceImpl.java
             * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
             * 4. 작성자       : 
             * 5. 작성일       : 
             * </pre>
             *
             * @param commandMap
             * @return
             * @throws Exception
             */
             @SuppressWarnings("unchecked")
             public List<Map<String, Object>> onlineCouponListEditN (Map<String, Object> commandMap) throws Exception
             {
                 //return defaultDAO.selectList("Ecoupon.onlineCouponListEditN", commandMap);
            	 //commandMap.put("T_CPN_TGT_ETC", commandMap.get("T_CPN_ETC"));
            	 //commandMap.put("T_CPN_TGT_ETC", "(SELECT CPN.CPN_TGT_CD FROM T_CPN_ETC CPN WHERE CPN.CPN_ETC_GBN = #CPN_MST_TGT_GBN# AND CPN.CPN_MST_IDX = #CPN_MST_IDX# )");
             	return defaultDAO.selectList("Ecoupon.onlineCouponListEditN", commandMap);
             }
             
             /**
              * <pre>
              * 1. MethodName : onlineCouponListEditY
              * 2. ClassName  : EcouponServiceImpl.java
              * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
              * 4. 작성자       : 
              * 5. 작성일       : 
              * </pre>
              *
              * @param commandMap
              * @return
              * @throws Exception
              */
              @SuppressWarnings("unchecked")
              public List<Map<String, Object>> onlineCouponListEditN_B (Map<String, Object> commandMap) throws Exception
              {
                  //return defaultDAO.selectList("Ecoupon.onlineCouponListEditN", commandMap);
             	 //commandMap.put("T_CPN_TGT_ETC", commandMap.get("T_CPN_ETC"));
             	 //commandMap.put("T_CPN_TGT_ETC", "(SELECT CPN.CPN_TGT_CD FROM T_CPN_ETC CPN WHERE CPN.CPN_ETC_GBN = #CPN_MST_TGT_GBN# AND CPN.CPN_MST_IDX = #CPN_MST_IDX# )");
              	return defaultDAO.selectList("Ecoupon.onlineCouponListEditN_B", commandMap);
              }
              
              /**
               * <pre>
               * 1. MethodName : onlineCouponListEditY
               * 2. ClassName  : EcouponServiceImpl.java
               * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
               * 4. 작성자       : 
               * 5. 작성일       : 
               * </pre>
               *
               * @param commandMap
               * @return
               * @throws Exception
               */
               @SuppressWarnings("unchecked")
               public List<Map<String, Object>> onlineCouponListEditN_C (Map<String, Object> commandMap) throws Exception
               {
               	return defaultDAO.selectList("Ecoupon.onlineCouponListEditN_C", commandMap);
               }
               
               /**
                * <pre>
                * 1. MethodName : onlineCouponListEditY
                * 2. ClassName  : EcouponServiceImpl.java
                * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
                * 4. 작성자       : 
                * 5. 작성일       : 
                * </pre>
                *
                * @param commandMap
                * @return
                * @throws Exception
                */
                @SuppressWarnings("unchecked")
                public List<Map<String, Object>> onlineCouponListEditN_D (Map<String, Object> commandMap) throws Exception
                {
                	return defaultDAO.selectList("Ecoupon.onlineCouponListEditN_D", commandMap);
                }
                
                /**
                 * <pre>
                 * 1. MethodName : insertOnlineCouponIssue
                 * 2. ClassName  : EcouponServiceImpl.java
                 * 3. Comment    : 관리자 > 프로모션 관리 > 쿠폰 등록(관리자) 
                 * 4. 작성자       : 
                 * 5. 작성일       :
                 * </pre>
                 *
                 * @param request
                 * @param commandMap
                 * @return
                 * @throws Exception
                 */
                 public int insertOnlineCouponIssue (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
                 {
                     int result = 0;
                     commandMap.putIfAbsent("CPN_MEM_ISU_CNL", Code.CPN_MEM_ISU_CNL_ADMIN);
                     // 쿠폰 등록               
          			 String [] arrPRD_MEM_IDXs = (String[]) commandMap.get("arrPRD_MEM_IDXs");
          			 	if(arrPRD_MEM_IDXs != null)
          			   	{
          			   		for ( String MEM_MST_MEM_ID : arrPRD_MEM_IDXs )
          			   	    {
          			   	    	commandMap.put("MEM_MST_MEM_ID", MEM_MST_MEM_ID);
          			   	    	result = defaultDAO.insert("Ecoupon.inserIssue",commandMap);
          			   	    }
          			   	}
          			 	
                     return result;
                 }
 /**
  * <pre>
  * 1. MethodName : selectOfflineCouponPopupCount
  * 2. ClassName  : EcouponServiceImpl.java
  * 3. Comment    : 관리자 > 마케팅 관리 > 제휴쿠폰 팝업 목록 갯수 
  * 4. 작성자       : 
  * 5. 작성일       : 
  * </pre>
  *
  * @param commandMap
  * @return
  * @throws Exception
  */
  public int selectOfflineCouponPopupCount (Map<String, Object> commandMap) throws Exception
  {
      return defaultDAO.selectCount("Ecoupon.offlineCouponPopupCount", commandMap);
  }
  /**
   * <pre>
   * 1. MethodName : selectOfflineCouponPopupList
   * 2. ClassName  : EcouponServiceImpl.java
   * 3. Comment    : 관리자 > 마케팅 관리 > 제휴쿠폰 팝업 목록 
   * 4. 작성자       : 
   * 5. 작성일       : 
   * </pre>
   *
   * @param commandMap
   * @return
   * @throws Exception
   */
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectOfflineCouponPopupList (Map<String, Object> commandMap) throws Exception
   {
   	return defaultDAO.selectList("Ecoupon.offlineCouponPopupList", commandMap);
   }
   /**
    * <pre>
    * 1. MethodName : selectMemberCouponListCount
    * 2. ClassName  : EcouponServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
    * 4. 작성자       : 
    * 5. 작성일       : 
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectMemberCouponListCount (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Ecoupon.selectMemberCouponListCount", commandMap);
    }
                    
                         
    /**
    * <pre>
    * 1. MethodName : selectMemberCouponList
    * 2. ClassName  : EcouponServiceImpl.java
    * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
    * 4. 작성자       : 
    * 5. 작성일       : 
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectMemberCouponList (Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectList("Ecoupon.selectMemberCouponList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectMemberCouponSum
     * 2. ClassName  : EcouponServiceImpl.java
     * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
     * 4. 작성자       : 
     * 5. 작성일       : 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public Map<String, Object> selectMemberCouponSum (Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.select("Ecoupon.selectMemberCouponSum", commandMap);
     }


	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> onlineCouponIssueDetDwnList(Map<String, Object> commandMap) {
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		return defaultDAO.selectList("Ecoupon.onlineCouponIssueDetDwnList", commandMap);
	}


	@Override
	public String selectOnlineCouponGbnNm(Map<String, Object> map) {
		map.put("CODE", Code.COUPON_TYPE);
		String retVal = "";
		try {
			retVal = defaultDAO.selectStr("Ecoupon.selectOnlineCouponGbnNm", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retVal;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectScheduleDetail(Map<String, Object> commandMap) {
		return defaultDAO.selectList("Ecoupon.selectScheduleDetail", commandMap);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> issueUploadCheck(Map<String, Object> commandMap) {
		return defaultDAO.selectList("Ecoupon.issueUploadCheck", commandMap);
	}
    
}