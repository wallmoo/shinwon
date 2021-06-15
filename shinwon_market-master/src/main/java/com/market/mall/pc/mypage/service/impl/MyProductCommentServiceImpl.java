package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.mypage.service.MyProductCommentService;
import com.market.mall.pc.mypage.service.MyShoppingService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyProductCommentServiceImpl.java
 * @Date : 2014. 7. 15.
 * @프로그램 설명 : 프론트 > 마이페이지 > 나의 상품평을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcMyProductCommentService")
public class MyProductCommentServiceImpl implements MyProductCommentService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name="orderService")
    private OrderService orderService;
	
	@Resource(name="pcMyShoppingService")
    private MyShoppingService pcMyShoppingService;
	
	@Autowired 
    private FileUpload fileUpload;
	
	/**
	* <pre>
	* 1. MethodName : setOrderState
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 주문 상태값 셋팅
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	*/
	public void setOrderState(Map<String, Object> commandMap){
    	
    	commandMap.put("OST_ORDER", Code.OST_ORDER);
		commandMap.put("OST_PAY_READY", Code.OST_PAY_READY);
		commandMap.put("OST_PAY", Code.OST_PAY);
		commandMap.put("OST_CANCEL_BEFORE_DEPOSIT", Code.OST_CANCEL_BEFORE_DEPOSIT);
		commandMap.put("OST_CANCEL", Code.OST_CANCEL);
		commandMap.put("OST_CANCEL_END", Code.OST_CANCEL_END);
		commandMap.put("OST_SEND_READY", Code.OST_SEND_READY);
		commandMap.put("OST_SEND", Code.OST_SEND);
		commandMap.put("OST_SEND_END", Code.OST_SEND_END);
		commandMap.put("OST_BACK", Code.OST_BACK);
		commandMap.put("OST_BACK_END", Code.OST_BACK_END);
		commandMap.put("OST_SWAP", Code.OST_SWAP);
		commandMap.put("OST_SWAP_READY", Code.OST_SWAP_READY);
		commandMap.put("OST_SWAP_END", Code.OST_SWAP_END);
		commandMap.put("OST_SWAP_CANCEL", Code.OST_SWAP_CANCEL);
		commandMap.put("OST_FIX", Code.OST_FIX);
		commandMap.put("OST_REFUND", Code.OST_REFUND);
		commandMap.put("OST_REFUND_END", Code.OST_REFUND_END);
	    commandMap.put("OST_SWAP_COLLECT_CALL", Code.OST_SWAP_COLLECT_CALL);
	    commandMap.put("OST_SWAP_COLLECT_END", Code.OST_SWAP_COLLECT_END);
	    commandMap.put("OST_BACK_COLLECT_CALL", Code.OST_BACK_COLLECT_CALL);
	    commandMap.put("OST_BACK_COLLECT_END", Code.OST_BACK_COLLECT_END);
		commandMap.put("OST_SWAP_READY_CANCEL", Code.OST_SWAP_READY_CANCEL);
		commandMap.put("OST_SWAP_TARGET_COLLECT_END", Code.OST_SWAP_TARGET_COLLECT_END);
		commandMap.put("OST_BACK_APPROVED", Code.OST_BACK_APPROVED);
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//개별 반품처리 위한 반품관련 주문상태값 리스트
		commandMap.put("OST_SWAP_IGNORE_ARR", Code.OST_SWAP_IGNORE_ARR);//계산시에는 없는 상품으로 쳐야할 주문상태값 리스트
		
		//commandMap.put("OST_SHOPPING_EXCLUDE_ARR", Code.OST_SHOPPING_EXCLUDE_ARR);//마이페이지 주문/배송 조회시 제외할 주문상태값 리스트
		commandMap.put("OST_CANCEL_ARR", Code.OST_CANCEL_ARR);//마이페이지 취소 조회시 주문상태값 리스트
		commandMap.put("OST_SWAP_ARR", Code.OST_SWAP_ARR);//마이페이지 교환 조회시 주문상태값 리스트
		commandMap.put("OST_BACK_ARR", Code.OST_BACK_ARR);//마이페이지 반품 조회시 주문상태값 리스트
    }
	
	/**
	* <pre>
	* 1. MethodName : selectMyWritableProductCommentListCount
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 작성 가능한 상품후기 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyWritableProductCommentListCount (Map<String,Object> commandMap) throws Exception
	{
		this.setOrderState(commandMap);
		return defaultDAO.selectCount("PcMyProductComment.selectMyWritableProductCommentListCount",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMyWritableProductCommentList
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 작성 가능한 상품후기 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMyWritableProductCommentList (Map<String,Object> commandMap) throws Exception
	{
		this.setOrderState(commandMap);
		return defaultDAO.selectList("PcMyProductComment.selectMyWritableProductCommentList", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMyWrittenProductCommentListCount
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 작성한 상품후기 목록 갯수
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 5.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectMyWrittenProductCommentListCount(Map<String, Object> commandMap) throws Exception 
	{
		return defaultDAO.selectCount("PcMyProductComment.selectMyWrittenProductCommentListCount",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectMyWrittenProductCommentList
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 작성한 상품후기 목록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectMyWrittenProductCommentList (Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> returnMap = new HashMap<String, Object>();
	    
		// 작성한 상품후기 목록
	    List<Map<String, Object>> writtenList = defaultDAO.selectList("PcMyProductComment.selectMyWrittenProductCommentList",commandMap);	    
	    
	    // 첨부파일 정보
	    if(writtenList != null){
	    	for(int i=0; i < writtenList.size(); i++){
    			commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV"); 
    		    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(writtenList.get(i).get("PRD_REV_IDX"),""));
    	        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap); 
    	        writtenList.get(i).put("fileList", fileList);
	    	}
	    }
        
        returnMap.put("writtenList", writtenList);
		
		return returnMap;
	}

	/**
	* <pre>
	* 1. MethodName : selectSimpleProductInfo
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 팝업 > 상품관련 간단한 정보 가져오기(상품이미지, 상품명)
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectSimpleProductInfo (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.select("PcMyProductComment.selectSimpleProductInfo", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectProductCommentInfo
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 팝업 > 상품후기 상세정보
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectProductCommentInfo (Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Map<String,Object> productCommentInfoMap = defaultDAO.select("PcMyProductComment.selectProductCommentInfo", commandMap);
		
		// 첨부파일 정보
        commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV"); 
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
        List<Map<String, Object>> fileList = defaultDAO.selectList("Common.selectCommonFileList", commandMap);
        returnMap.put("fileList", fileList);
        returnMap.put("productCommentInfoMap", productCommentInfoMap);
        
        return returnMap;
	}
	
	/**
	* <pre>
	* 1. MethodName : insertProductComment
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 팝업 > 등록
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 6.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertProductComment (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		String requestUri = StringUtil.getString(request.getRequestURI(),"");
		int result = 0;
		
		// PC
		if(requestUri.indexOf("/pc/") >= 0)
		{
			commandMap.put("PRD_REV_CHN_GBN", "P");
		}
		else if(requestUri.indexOf("/mobile/") >= 0)
		{
			commandMap.put("PRD_REV_CHN_GBN", "M");
		}
		
		// 상품평 중복등록 방지
		if(defaultDAO.selectCount("PcMyProductComment.selectProductCommentCount", commandMap) == 0)
		{
			// 상품평등록
			result = defaultDAO.insert("PcMyProductComment.insertProductComment", commandMap);
			
			int PIT_MST_BRK_DWN = 0;		// 포인트 내역(상품후기작성 / 포토후기작성)
			int PIT_MST_PIT = 0;				// 포인트 (상품후기작성시 200P / 포토후기작성시 500P)
			
			if(result > 0)
			{
	            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
	            
	            if(fileList.size() > 0)
	            {
	                int fileSort = 0;
	                
	                commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV");
	                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
	                commandMap.put("CMM_FLE_REG_ID", commandMap.get("PRD_REV_REG_ID"));
	                commandMap.put("fileSizeYn","Y");
	                commandMap.put("makeResize", "Y");	// 리사이즈
	                
	                for(int i = 0;i < fileList.size();i++)
	                {
	                    CommonsMultipartFile file = fileList.get(i);
	                    
	                    if(!file.isEmpty())
	                    {
	                        commandMap.put("CMM_FLE_SORT", ++fileSort);
	                        
	                        // 파일 등록 및 파일 업로드
	                        result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "image", "fileType", "Y"));
	                    }
	                }
	                
	                // 포토후기 작성 포인트 지급 관련
	                PIT_MST_BRK_DWN = Code.PRODUCT_COMMENT_PHOTO_CODE;
	                PIT_MST_PIT = 500;
	            }
	            else
	            {
	            	// 상품후기 작성 포인트 지급 관련
	            	PIT_MST_BRK_DWN = Code.PRODUCT_COMMENT_BASIC_CODE;
	            	PIT_MST_PIT = 200;
	            }
	            
	            commandMap.put("PIT_MST_BRK_DWN", PIT_MST_BRK_DWN);
	            commandMap.put("PIT_MST_PIT", PIT_MST_PIT);
	            
	            if(StringUtil.getInt(commandMap.get("MEM_MST_MEM_GBN"),0) == Code.COMMON_PRI_MEMBER_GRADE)
	            {
	            	// 포인트 적립/차감 관리에 내역 추가
		            result = defaultDAO.insert("PcMyProductComment.insertPoint", commandMap);
		            
		            if(result > 0)
		            {
		            	// 전체 포인트 + 상품 후기 작성 포인트 지급 합산
		            	commandMap.put("MEM_PIT_TOT_PIT", StringUtil.getInt(commandMap.get("MEM_PIT_TOT_PIT"),0) + PIT_MST_PIT);
		            	
		            	// 회원 포인트 관리에 지급 내역 추가
		            	result = defaultDAO.insert("PcMyProductComment.insertPointMember", commandMap);
		            	
		            	// TODO 구매확정처리
		            	int stateModifyCnt = 0;
		            	
		            	// SUB 옵션들까지 모두 구매확정 처리한다.            	
			            List<String> totOrdPrdIdxs = new ArrayList<String>();//선택옵션까지 포함한 전체 상품 idx
			            commandMap.put("ORD_PRD_IDX", StringUtil.getString(commandMap.get("PRD_ORD_PRD_IDX")));
		            	List<Map<String,Object>> prdList = this.pcMyShoppingService.selectOrdPrdAllOptionList(commandMap);
			    		if(!prdList.isEmpty()){
			    			for(Map<String,Object> prd : prdList){
			    				String ORD_PRD_IDX = StringUtil.getString(prd.get("ORD_PRD_IDX"));
			    				int PRD_ORD_PRD_ORD_STATE = StringUtil.getInt(prd.get("ORD_PRD_ORD_STATE"));
			    				//옵션중 하나라도 배송완료 or 구매확정이 아닌 경우 구매확정 불가
			    				if(Code.OST_SEND_END == PRD_ORD_PRD_ORD_STATE || Code.OST_FIX == PRD_ORD_PRD_ORD_STATE){
			    					totOrdPrdIdxs.add(ORD_PRD_IDX);
			    				}else{
			    					String PRD_NM = StringUtil.getString(prd.get("PRD_NM"));
			    					String ORD_PRD_ORD_STATE_NM = StringUtil.getString(prd.get("ORD_PRD_ORD_STATE_NM"));
			    					String PRD_SLT_YN = StringUtil.getString(prd.get("ORD_PRD_SLT_YN"));
			    					String prdTypeStr = "Y".equals(PRD_SLT_YN) ? "선택옵션상품" : "상품";
			    					logger.error(PRD_NM + " "+ prdTypeStr +"이 "+ ORD_PRD_ORD_STATE_NM + " 상태. 반품 불가.");
			    					
			    					stateModifyCnt = -1;
			    					
			    					break;
			    				}
			    			}
			    			
			    			if(stateModifyCnt < 0){
			    				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			    				result = stateModifyCnt;
			    			}else{
			    				Map<String,Object> ordMap = new HashMap<String,Object>();
				            	// 주문번호 가져오기
				            	String ORD_MST_CD = this.defaultDAO.selectStr("PcMyProductComment.selectOrdMstCd", commandMap);
				            	ordMap.put("ORD_MST_CD", ORD_MST_CD);
				            	ordMap.put("ORD_PRD_ORD_STATE", Code.OST_FIX);
				            	
			    				// ORD_PRD_IDX_ARR 이 있는 경우 배열로 변환 후 넘긴다.
					            if(!totOrdPrdIdxs.isEmpty()){
					            	if(totOrdPrdIdxs.size() == 1){
					            		ordMap.put("ORD_PRD_IDX", StringUtil.getString(totOrdPrdIdxs.get(0),""));
					            	}
					            	ordMap.put("ordPrdIdxs", totOrdPrdIdxs);
					            }
					            
				            	this.orderService.updateOrderState(ordMap, request);
			    			}
			    		}
		            }
	            }
	        }
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : updateProductComment
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 프론트 > MY LAND > 쇼핑활동 > 상품후기 > 상품후기 작성 등록/수정 팝업 > 수정
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 25.
	* </pre>
	*
	* @param request
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int updateProductComment (MultipartHttpServletRequest request, Map<String,Object> commandMap) throws Exception
	{
		String requestUri = StringUtil.getString(request.getRequestURI(),"");
		
		// PC
		if(requestUri.indexOf("/pc/") >= 0)
		{
			commandMap.put("PRD_REV_CHN_GBN", "P");
		}
		else if(requestUri.indexOf("/mobile/") >= 0)
		{
			commandMap.put("PRD_REV_CHN_GBN", "M");
		}
		
		// 상품평 수정
		int result = defaultDAO.update("PcMyProductComment.updateProductComment", commandMap);
        
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
        	
        	
        	String removeFileIdxList = StringUtil.getString(commandMap.get("CMM_FLE_IDXs"), "");
        	
        	if(StringUtils.isNotEmpty(removeFileIdxList)) {
        		 String[] rmvFiles = new ObjectMapper().readValue(removeFileIdxList, String[].class);
        		 
        		 for(int i = 0 ; i < rmvFiles.length; i++) {
        			 if(StringUtils.isNotEmpty(rmvFiles[i])) {
        	       		commandMap.put("CMM_FLE_IDX", rmvFiles[i]);
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
        	}
        }
        	
        //파일 insert
        List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
        if(fileList.size() > 0)
        {
        	int fileSort = 0;
            
            commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV");
            commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
            commandMap.put("CMM_FLE_REG_ID", commandMap.get("PRD_REV_UPD_ID"));
            commandMap.put("fileSizeYn","Y");
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
	
	/**
	* <pre>
	* 1. MethodName : selectBanWord
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 등록되어 있는 금칙어
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public String selectBanWord (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectStr("PcMyProductComment.selectBanWord", commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : selectOrderCount
	* 2. ClassName  : MyProductCommentServiceImpl.java
	* 3. Comment    : 본인 주문이 맞는지 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2016. 1. 27.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int selectOrderCount (Map<String,Object> commandMap) throws Exception
	{
		return defaultDAO.selectCount("PcMyProductComment.selectOrderCount", commandMap);
	}
	
}
