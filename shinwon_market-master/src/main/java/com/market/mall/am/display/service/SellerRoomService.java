package com.market.mall.am.display.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SellerRoomService {

	public Map<String, Object> selectSellerRoomLayoutInfo(Map<String, Object> commandMap) throws Exception;
	
	public int updateSellerRoomLayoutInfo(Map<String, Object> commandMap) throws Exception;
	
	/* 미디어 관리 */
	public int selectSellerMediaCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSellerMediaList(Map<String, Object> commandMap) throws Exception;
	
	public int insertSellerMedia (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    
	public Map<String, Object> selectSellerMediaInfo (Map<String, Object> commandMap) throws Exception;
	
	public int updateSellerMedia (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	/* 룩북관리 */
	public int selectSellerLookBookCount(Map<String, Object> commandMap) throws Exception;
	    
	public List<Map<String, Object>> selectSellerLookBookList(Map<String, Object> commandMap) throws Exception;
	    
	public int insertSellerLookBook (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	    
	public Map<String, Object> selectSellerLookBookInfo (Map<String, Object> commandMap) throws Exception;
	    
	public int updateSellerLookBook (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	public int deleteSellerLookBook(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectTagDisplayCategoryList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectTagDisplayCategoryCodeList(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectTagDisplayList(Map<String, Object> commandMap) throws Exception;
	
	public int insertTagDisplay(Map<String, Object> commandMap) throws Exception;
	
	/* 셀러룸 > 매장관리 */
	public int selectSellerStoreListCount(Map<String, Object> commandMap) throws Exception;
	
	public List<Map<String, Object>> selectSellerStoreList(Map<String, Object> commandMap) throws Exception;
	
	public Map<String, Object> selectSellerStoreInfo(Map<String, Object> commandMap) throws Exception;
	
	public int insertSellerStore(Map<String, Object> commandMap) throws Exception;
	
	public int updateSellerStore(Map<String, Object> commandMap) throws Exception;
	
	public int deleteSellerStore(Map<String, Object> commandMap) throws Exception;
	
	public int searchSallerPickListCount(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> searchSallerPickList(Map<String, Object> commandMap) throws Exception;
	
	public int insertSellerPick( HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectBannerCNTList(Map<String, Object> commandMap) throws Exception;
	public int updateSellerPick( HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	public int selectSellerRommProductDisplayListCount(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectSellerRommProductDisplayList(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectProductCatCodeList(Map<String, Object> commandMap) throws Exception;
	
	public int insertSellerProductDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	public int deleteSellerProductDisplay(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;	
	

	public Map<String, Object> selectSellerProductInfo (Map<String, Object> commandMap) throws Exception;
	
	public int updateProductDisplaySellerOrder( HttpServletRequest request, Map<String, Object> commandMap) throws Exception;
	
	
	
	
	
}
