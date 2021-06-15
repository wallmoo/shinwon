package com.market.mall.pc.customer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.pc.customer.service.InquiryService;

/**
 * @PackageName: com.market.mall.pc.customer.service.impl
 * @FileName : InquiryServiceImpl.java
 * @Date : 2014. 7. 24.
 * @프로그램 설명 : 프론트 > 고객센터 > 1:1문의를 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcInquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired
	private FileUpload fileUpload;
	
	/**
	* <pre>
	* 1. MethodName : insertInquiry
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 1:1문의 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 24.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertInquiry(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		
		if(commandMap.get("MEM_ADV_MAIL").equals("@")){
			commandMap.put("MEM_ADV_MAIL", "");
		}
		
		int result = defaultDAO.insert("PcInquiry.insertMobileInquiry", commandMap);
		
		if(result > 0){
			
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            
            if(fileList.size() > 0){
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_MEM_ADV");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("MEM_ADV_IDX"), ""));
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("MEM_MST_MEM_ID"));
                commandMap.put("fileSizeYn","Y");
                
                for(int i = 0;i < fileList.size();i++){
                	
                    CommonsMultipartFile file = fileList.get(i);
                    
                    if(!file.isEmpty()){
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
	* 1. MethodName : selectInquiryOrderProductList
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 1:1 문의 등록 주문 상품 리스트
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 8.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInquiryOrderProductList (Map<String, Object> commandMap) throws Exception{
		return defaultDAO.selectList("PcInquiry.selectInquiryOrderProductList",commandMap);
	}
	
	/**
	* <pre>
	* 1. MethodName : getSubCodeList
	* 2. ClassName  : InquiryServiceImpl.java
	* 3. Comment    : 문의유형 하위 카테고리 가져오기 
	* 4. 작성자       : Lee
	* 5. 작성일       : 2016. 1. 7.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public List<Map<String, Object>> getSubCodeList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("PcInquiry.getSubCodeList",commandMap);
	}

}
