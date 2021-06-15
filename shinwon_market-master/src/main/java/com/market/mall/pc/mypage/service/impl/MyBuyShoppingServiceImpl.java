package com.market.mall.pc.mypage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Admin;
import com.market.mall.model.Code;
import com.market.mall.pc.mypage.service.MyBuyShoppingService;

/**
 * @PackageName: com.market.mall.pc.mypage.service.impl
 * @FileName : MyBuyShoppingServiceImpl.java
 * @Date : 2016. 1. 19.
 * @프로그램 설명 : 내가 구매한 상품 serviceImpl
 * @author DEV_KIMMINHO    
 */
@Service("pcMyBuyShoppingService")
public class MyBuyShoppingServiceImpl implements MyBuyShoppingService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
    * <pre>
    * 1. MethodName : selectProductListCount
    * 2. ClassName : MyBuyShoppingServiceImpl.java
    * 3. Comment : 주문상품 갯수
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception
    {
    	commandMap.put("OST_SEND_END", Code.OST_SEND_END);
    	commandMap.put("OST_FIX", Code.OST_FIX);
        return defaultDAO.selectCount("PcMyBuyShopping.selectProductListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductList
    * 2. ClassName : MyBuyShoppingServiceImpl.java
    * 3. Comment : 주문한 상품 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductList(Map<String, Object> commandMap) throws Exception {
    	commandMap.put("OST_SEND_END", Code.OST_SEND_END);
    	commandMap.put("OST_FIX", Code.OST_FIX);
    	return this.defaultDAO.selectList("PcMyBuyShopping.selectProductList", commandMap);		
	}
}
