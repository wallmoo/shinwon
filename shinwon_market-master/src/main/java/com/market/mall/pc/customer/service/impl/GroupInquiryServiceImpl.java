package com.market.mall.pc.customer.service.impl;

import java.util.HashMap;
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
import com.market.mall.pc.customer.service.GroupInquiryService;

/**
 * @PackageName: com.market.mall.pc.customer.service.impl
 * @FileName : GroupInquiryServiceImpl.java
 * @Date : 2014. 7. 25.
 * @프로그램 설명 : 프론트 > 고객센터 > 단체주문을 처리하는 Service Implement Class
 * @author kanghk
 */
@Service("pcGroupInquiryService")
public class GroupInquiryServiceImpl implements GroupInquiryService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Autowired
	private FileUpload fileUpload;

	/**
	* <pre>
	* 1. MethodName : insertGroupInquiry
	* 2. ClassName  : GroupInquiryServiceImpl.java
	* 3. Comment    : 단체주문 등록
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertGroupInquiry(MultipartHttpServletRequest request,Map<String, Object> commandMap)	throws Exception {

		int result = defaultDAO.insert("PcGroupInquiry.insertGroupInquiry", commandMap);
		
		if(result > 0)
		{
            List<CommonsMultipartFile> fileList = (List) request.getFiles("file");
            if(fileList.size() > 0)
            {
                int fileSort = 0;
                
                commandMap.put("CMM_FLE_TB_NM", "T_GRP_INQ");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("GRP_INQ_IDX"), ""));
                commandMap.put("CMM_FLE_TB_TYPE", "U");	// 사용자
                commandMap.put("CMM_FLE_REG_ID", commandMap.get("GRP_INQ_REG_ID"));
                commandMap.put("fileSizeYn","Y");
                
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
	* 1. MethodName : selectProductInfo
	* 2. ClassName  : GroupInquiryServiceImpl.java
	* 3. Comment    : 상품코드 확인
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 25.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProductInfo (Map<String, Object> commandMap) throws Exception{
		//상품 정보 가져오기
		return defaultDAO.select("PcGroupInquiry.selectProductInfo", commandMap);
	}

}
