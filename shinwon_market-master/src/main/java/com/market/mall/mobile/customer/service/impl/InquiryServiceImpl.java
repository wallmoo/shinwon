package com.market.mall.mobile.customer.service.impl;

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
import com.market.mall.mobile.customer.service.InquiryService;

/**
 * @PackageName: com.market.mall.mobile.customer.service.impl
 * @FileName : InquiryServiceImpl.java
 * @Date : 2016. 2. 15.
 * @프로그램 설명 : 모바일 > 고객센터 > 1:1문의를 처리하는 Service Implement Class
 * @author khcho
 */
@Service("mobileInquiryService")
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
	public int insertInquiry(Map<String, Object> commandMap) throws Exception {
		
		if(commandMap.get("MEM_ADV_MAIL").equals("@")){
			commandMap.put("MEM_ADV_MAIL", "");
		}
		
		int result = defaultDAO.insert("PcInquiry.insertMobileInquiry", commandMap);
		
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
