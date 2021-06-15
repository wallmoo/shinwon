package com.market.mall.am.vendor.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.am.vendor.service.VendorInqService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;


/**
 * @PackageName: com.sgsplus.etland.am.createboard.service.impl
 * @FileName : ShopInqServiceImpl.java
 * @Date : 2015. 11. 12.
 * @프로그램 설명 : 관리자 > 게시판관리 > 입점업체문의사항를 처리하는 Service Implement Class
 * @author khcho
 */
/**
 * @PackageName: com.market.mall.am.vendor.service.impl
 * @FileName : VendorInqServiceImpl.java
 * @Date : 2016. 8. 25.
 * @프로그램 설명 : 관리자 > 입점업체 관리 > 입점업체 문의사항을 처리하는 Service Implement Class
 * @author DEV_LEESANGWOOK
 */
@Service("vendorInqService")
public class VendorInqServiceImpl implements VendorInqService {
    
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @Resource
	protected Sms sms;
    
    @Autowired 
    private FileUpload fileUpload;
    
	private final static int _LIST_THUMBNAIL_SIZE_ = Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH;

    /**
     * <pre>
     * 1. MethodName : selectVendorInqListCount
     * 2. ClassName  : VendorInqServiceImpl.java
     * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 목록 개수
     * 4. 작성자       : DEV_LEESANGWOOK
     * 5. 작성일       : 2016. 8. 25.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectVendorInqListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("VendorInq.selectVendorInqListCount", commandMap);
    }	

	/**
	 * <pre>
	 * 1. MethodName : selectVendorInqList
	 * 2. ClassName  : VendorInqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 목록
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectVendorInqList(Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("VendorInq.selectVendorInqList",commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : selectVendorInqInfo
	 * 2. ClassName  : VendorInqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 상세정보
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectVendorInqInfo (Map<String, Object> commandMap) throws Exception
	{
	    Map<String, Object> returnMap = new HashMap<String, Object>();
    	commandMap.put("THUMBNAIL_SIZE", _LIST_THUMBNAIL_SIZE_);
	    
	    // 입점업체문의사항 상세정보 
	    Map<String, Object> row = defaultDAO.select("VendorInq.selectVendorInqInfo", commandMap);
	    
	    // 첨부파일 정보
	    commandMap.put("CMM_FLE_TB_NM", "T_SCM_INQ"); 
	    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_INQ_IDX"), ""));
        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
        
	    returnMap.put("fileList", fileList);
	    returnMap.put("row", row);
	    
	    return returnMap;
	}
	
	/**
	 * <pre>
	 * 1. MethodName : updateVendorInq
	 * 2. ClassName  : VendorInqServiceImpl.java
	 * 3. Comment    : 관리자 > 입점업체 관리 > 입점업체 문의사항 답변 등록 / 수정 
	 * 4. 작성자       : DEV_LEESANGWOOK
	 * 5. 작성일       : 2016. 8. 25.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateVendorInq (HttpServletRequest request, Map<String, Object> commandMap) throws Exception
	{
	    Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("SCM_INQ_REPLY_IP", request.getRemoteAddr());
        commandMap.put("SCM_INQ_REPLY_ID", admin.getADM_MST_ID());
        commandMap.put("SCM_INQ_REPLY_NM", admin.getADM_MST_NM());

        // 답변 등록
        int result = defaultDAO.update("VendorInq.updateVendorInq", commandMap); 
	    
//	    if(result > 0)
//	    {
//	    	if(commandMap.get("SHP_INQ_RET_YN").equals("Y"))
//	    	{
//	    		
//	    			String email = StringUtil.getString(commandMap.get("BRD_INQ_EMAIL"),"");
//					
//	    			//메일 주소 있는 경우 메일 발송
//					if(!("").equals(email))
//					{
//						HashMap<String,Object> mailMap = new HashMap<String,Object>();
//						
//						//문의 정보
//						Map<String,Object> brdInqInfo = (Map<String, Object>) this.selectShopInqInfo(commandMap).get("row");
//			    		
//			            //문의유형
//			            String brdInqType = StringUtil.getString(commandMap.get("BRD_INQ_TYPE"), "");
//			            String mailCode = "";
//			            
//			            if(brdInqType.equals("I"))			//입점업체문의사항
//			            {
//			            	mailCode = "MAIL-QA"; 
//			            }
//			            
//			            //이름
//			            String memberName = StringUtil.getString(brdInqInfo.get("BRD_INQ_REG_NM"), "");
//			            memberName = FormatUtil.markingName(memberName);//마킹 처리
//			            
//			    		//-- 필수 항목
//			    		mailMap.put("MAIL_CODE", mailCode);
//			    		mailMap.put("MEMBER_NAME", memberName);
//			    		mailMap.put("MEMBER_EMAIL", email);
//			    		// 브랜드 cd
//			    		String brandCd = StringUtil.getString(brdInqInfo.get("BRD_INQ_BRAND_CD"),"");
//		    			mailMap.put("brandCd", brandCd);
//			    		
//			    		this.sendMail.send(mailMap);	 //이메일 전송
//					}
//				}
//	    	}
	    	
	   // }
	    return result;
	}
	
	/**
    * <pre>
    * 1. MethodName : insertShopInqToEtland
    * 2. ClassName  : ShopInqServiceImpl.java
    * 3. Comment    : 관리자 > 게시판관리 > MarketPlant 문의하기 > 등록
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int insertVendorInqToEtland (MultipartHttpServletRequest request, @RequestParams Map<String,Object> commandMap) throws Exception
    {
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("SCM_INQ_REG_IP", request.getRemoteAddr());
        commandMap.put("SCM_INQ_REG_ID", admin.getADM_MST_ID());
        commandMap.put("SCM_INQ_REG_NM", admin.getADM_MST_NM());
        
        int result = defaultDAO.insert("VendorInq.insertVendorInqToEtland", commandMap);
        
        if(result > 0)
        {
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_SCM_INQ");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_INQ_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", admin.getADM_MST_ID());
                for(int i = 0;i < fileList.size();i++)
                {
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty())
                    {
                        commandMap.put("CMM_FLE_SORT", ++fileSort);
                        
                        // 파일 등록 및 파일 업로드
                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "fileType", "Y"));
                    }
                }
            }
        }
        return result;
    }
    
    /**
    * <pre>
    * 1. MethodName : updateShopInqToEtland
    * 2. ClassName  : ShopInqServiceImpl.java
    * 3. Comment    : 관리자 > 게시판관리 > MarketPlant 문의하기 > 수정
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public int updateVendorInqToEtland (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
    {
    	Admin admin = SessionsAdmin.getSessionAdmin(request);
        commandMap.put("SCM_INQ_UPD_IP", request.getRemoteAddr());
        commandMap.put("SCM_INQ_UPD_ID", admin.getADM_MST_ID());
        
        int result = defaultDAO.update("VendorInq.updateVendorInqToEtland", commandMap);
        String CMM_FLE_SAVE_PATH = "";
        
        //물리적 파일 삭제를 위한 tempList
        List<String> tempRemoveList = new ArrayList<String>();
        		
        if(result > 0)
        {
        	String removeFileIdx = StringUtil.getString(commandMap.get("CMM_FLE_IDX"), "");
        	
        	commandMap.put("CMM_FLE_IDX", removeFileIdx);
        		
        	if(!("").equals(removeFileIdx)){	        		
        		//파일 상세 정보
        		Map<String, Object> row = (Map<String, Object>) defaultDAO.select("Common.selectCommonFileInfo", commandMap);
        		CMM_FLE_SAVE_PATH = StringUtil.getString(row.get("CMM_FLE_SAVE_PATH"), "");
        		
        		 if(row != null && !"".equals(CMM_FLE_SAVE_PATH))
                 {	        			 
                     commandMap.put("CMM_FLE_USE_YN", "N");
                     
                     // 파일 DB 수정
                     defaultDAO.update("Common.deleteCommonFile", commandMap);
                     
                     // 물리적 삭제할 파일 경로에 추가
                     tempRemoveList.add(CMM_FLE_SAVE_PATH);
                 }
        	}
        }
            	
        //파일 insert
        List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        if(fileList.size() > 0)
        {
        	int fileSort = 0;
            
            commandMap.put("CMM_FLE_TB_NM", "T_SCM_INQ");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("SCM_INQ_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("SCM_INQ_UPD_ID"));
            for(int i = 0;i < fileList.size();i++)
            {
                CommonsMultipartFile file = fileList.get(i);
                
                if(!file.isEmpty())
                {
                    commandMap.put("CMM_FLE_SORT", ++fileSort);
                    
                    // 파일 등록 및 파일 업로드
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "mypage", "image", "Y"));
                }
            }
        }
        
        //파일 삭제한 경우에만..
        if(tempRemoveList != null){
        	for(int i=0;i<tempRemoveList.size();i++){
        		fileUpload.delete(tempRemoveList.get(i));
        	}
        }
        
        return result;
    }
	
}
