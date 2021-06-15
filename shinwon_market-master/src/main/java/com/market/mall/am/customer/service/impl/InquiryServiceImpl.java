package com.market.mall.am.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.market.mall.am.customer.service.InquiryService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;

/**
 * @PackageName: com.market.mall.am.customer.service.impl
 * @FileName : InquiryServiceImpl.java
 * @Date : 2014. 7. 4.
 * @프로그램 설명 : 관리자 > 고객센터 > 1:1 문의를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource
	protected Sms sms;
    
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH;

	/**
	 * <pre>
	 * 1. MethodName : selectInquiryListCount
	 * 2. ClassName  : InquiryServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록 갯수
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 3. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectInquiryListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Inquiry.selectInquiryListCount", commandMap);
    }	

	/**
	 * <pre>
	 * 1. MethodName : selectInquiryList
	 * 2. ClassName  : InquiryServiceImpl.java
	 * 3. Comment    : 관리자 > 고객센터 > 1:1문의 목록
	 * 4. 작성자       : ejpark
	 * 5. 작성일       : 2014. 3. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInquiryList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Inquiry.selectInquiryList",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectInquiryInfo
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 관리자 > 고객센터 > 1:1문의 상세 정보 
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 4.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectInquiryInfo (Map<String, Object> commandMap) throws Exception
	{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	    
	    // 1:1 문의 상세정보 
	    Map<String, Object> row = defaultDAO.select("Inquiry.selectInquiryInfo", commandMap);
	    
	    // 첨부파일 정보
	    commandMap.put("CMM_FLE_TB_NM", "T_MEM_ADV"); 
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""));
        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
        
	    returnMap.put("fileList", fileList);
	    returnMap.put("row", row);
	    
	    return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateInquiry
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 관리자 > 고객센터 > 1:1문의 답변 등록 / 수정
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 4.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public int updateInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MEM_ADV_UPD_IP", request.getRemoteAddr());
        commandMap.put("MEM_ADV_UPD_ID", admin.getADM_MST_ID());
        
        // 답변 등록
        int result = defaultDAO.update("Inquiry.updateInquiry", commandMap); 
	    
	    if(result > 0)
	    {
	    	if(commandMap.get("MEM_ADV_MAIL_YN").equals("Y"))
	    	{
	    		// 회원 메일 주소 가져오기	    	
		    	//Map<String, Object> dataMap = new HashMap<String, Object>();
		    	//dataMap.put("COMMON_MEMBER_GROUP", Code.COMMON_MEMBER_GROUP);
		    	//dataMap.put("CUST_ID", StringUtil.getString(commandMap.get("MEM_ADV_REG_ID"),""));
				//Map<String, Object> memberInfo = defaultDAO.select("InfoMember.selectMemberInfo",dataMap);
				//if(memberInfo != null){
					//String memberSeq = StringUtil.getString(memberInfo.get("CUST_NO"),"");
					
					//dataMap.put("MEMBER_SEQ", memberSeq);
//					email = StringUtil.getString(memberInfo.get("SEC_EMAIL"),"");
					
					
//					Map<String, Object> crmMemberInfo = crmMember.crmMemberSearch(dataMap);
					
//					if(crmMemberInfo != null){
						
//					}
	    			
	    			String email = StringUtil.getString(commandMap.get("MEM_ADV_EMAIL"),"");
					
	    			//메일 주소 있는 경우 메일 발송
					if(!("").equals(email))
					{
						HashMap<String,Object> mailMap = new HashMap<String,Object>();
						
						//문의 정보
						Map<String,Object> brdInqInfo = (Map<String, Object>) this.selectInquiryInfo(commandMap).get("row");
			    		
			            //문의유형
			            String brdInqType = StringUtil.getString(commandMap.get("MEM_ADV_TYPE"), "");
			            String mailCode = "";
			            
			            if(brdInqType.equals("I"))			//1:1 문의
			            {
			            	mailCode = "MAIL-QA"; 
			            }
			            
			            //이름
			            String memberName = StringUtil.getString(brdInqInfo.get("MEM_ADV_REG_NM"), "");
			            memberName = FormatUtil.markingName(memberName);//마킹 처리
			            
			    		//-- 필수 항목
			    		mailMap.put("MAIL_CODE", mailCode);
			    		mailMap.put("MEMBER_NAME", memberName);
			    		mailMap.put("MEMBER_EMAIL", email);
			    		// 브랜드 cd
			    		String brandCd = StringUtil.getString(brdInqInfo.get("MEM_ADV_BRAND_CD"),"");
		    			mailMap.put("brandCd", brandCd);
			    		
			    		//this.sendMail.send(mailMap);	 //이메일 전송
					}
				}
	    	}
	    	
	   // }
	    return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : insertInquiry
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 관리자 > 고객센터 > 고객상담 등록
	* 4. 작성자       : khcho
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public int insertInquiry (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("MEM_ADV_REG_IP", request.getRemoteAddr());
        commandMap.put("MEM_ADV_REG_ID", admin.getADM_MST_ID());
        
        // 답변 등록
        int result = defaultDAO.insert("Inquiry.insertInquiry", commandMap); 
	     
	    return result;
	}

	@Override
	public int selectInfoMemberVendorInquiryListCount(Map<String, Object> commandMap) throws Exception  {
		// TODO Auto-generated method stub
	   
	    return defaultDAO.selectCount("InfoMember.selectInfoMemberVendorInquiryListCount", commandMap); 
	}

	@Override
	public List<Map<String, Object>> selectInfoMemberVendorInquiryList(Map<String, Object> commandMap) throws Exception  {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("InfoMember.selectInfoMemberVendorInquiryList", commandMap);
	}

	@Override
	public Map<String, Object> selectInfoMemberVendorInquiryDetail(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.select("InfoMember.selectInfoMemberVendorInquiryDetail", commandMap);
	}
	
}
