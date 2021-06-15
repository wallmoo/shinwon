package com.market.mall.pc.vendor.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.pc.vendor.service.VendorTopSellerService;

import oracle.sql.CLOB;


@Service("pcVendorTopSellerService")
public class VendorTopSellerServiceImpl implements VendorTopSellerService {
	
    @Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
    
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectTopBannerList (Map<String, Object> commandMap) throws Exception {
    	
 
    	commandMap.put("CMN_COM_IDX", Code.PC_MAIN_TOP_SELLER_BANNER_UP);
    	List<Map<String, Object>> resultList =  defaultDAO.selectList("PcTopSeller.selectTopSellerBannerList", commandMap);
    	
    	for(int i = 0; i < resultList.size(); i++ ) {
    		
    		resultList.get(i).put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
    		
    		
    		List<Map<String, Object>> productList =
    				defaultDAO.selectList("PcTopSeller.selectTopSellerProductList", resultList.get(i));
    
    		
    		List<Map<String, Object>> tagList =
    				defaultDAO.selectList("PcTopSeller.selectTopSellerTagList", resultList.get(i));
    		
    		resultList.get(i).put("topProductList", productList);
    		resultList.get(i).put("TAG_LIST", tagList);
    	}
        
        return resultList;
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectBottomBannerList (Map<String, Object> commandMap) throws Exception {
    	commandMap.put("CMN_COM_IDX", Code.PC_MAIN_TOP_SELLER_BANNER_DOWN);
    	List<Map<String, Object>> resultList =  defaultDAO.selectList("PcTopSeller.selectTopSellerBannerList", commandMap);
    	
    	for(int i = 0; i < resultList.size(); i++ ) {
    		
    		resultList.get(i).put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
    		
    		List<Map<String, Object>> productList =
    				defaultDAO.selectList("PcTopSeller.selectTopSellerProductList", resultList.get(i));
    		
    		
    		List<Map<String, Object>> tagList =
    				defaultDAO.selectList("PcTopSeller.selectTopSellerTagList", resultList.get(i));
    		
    		resultList.get(i).put("bottomProductList", productList);
    		resultList.get(i).put("TAG_LIST", tagList);
    	}
        
        return resultList;
    }
    
    public int selectSellerProductListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PcTopSeller.selectSellerProductListCount", commandMap);
    }
    
    public List<Map<String, Object>> selectSellerProductList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcTopSeller.selectSellerProductList", commandMap);
    }

    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomHomeBannerLIst (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcTopSeller.selectRoomHomeBannerLIst", commandMap);
    	//return defaultDAO.selectList("PcTopSeller.selectSellerPickList", commandMap);
    }
    
    
	
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomHomeBannerWithProductLIst (Map<String, Object> commandMap) throws Exception {
    	
    	
        commandMap.put("THUMBNAIL_SIZE" , Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);
        
    	
    	List<Map<String, Object>> bannerList = defaultDAO.selectList("PcTopSeller.selectRoomHomeBannerLIst", commandMap);
    	for(int i = 0; i < bannerList.size(); i++) {
    		

    		bannerList.get(i).put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST_LARGE);    		
    		
    		List<Map<String, Object>> prdList =	defaultDAO.selectList("PcTopSeller.selectRoomHomeBannerProdLIst", bannerList.get(i));
        	List<Map<String, Object>> colorList = null;
        	try {
        		Map<String, Object> colorParam = new HashMap<String, Object>();
            	colorParam.put("productList", prdList);
        		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
        	} catch (Exception e) {
        		
        	}
        	
    		if(colorList != null) {
    			
    			for(int iIdx = 0 ; iIdx < prdList.size(); iIdx ++ ) {
    				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
    				String targetPrdCD = prdList.get(iIdx).get("PRD_MST_CD").toString();
    				for(int k = 0; k < colorList.size(); k++) {
    					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
    						colorResult.add(colorList.get(k));
    					}
    				}
    				prdList.get(iIdx).put("CNT_PRD_COLOR", colorResult);
    			}
    		}
    		
    		bannerList.get(i).put("products",prdList);
    	}
        return bannerList;
    }
	
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTopBannerTagLIst (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("PcTopSeller.selectTopSellerTagList", commandMap);
    }
    
    @SuppressWarnings("unchecked")
	public Map<String, Object> selectSellerInfo (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PcTopSeller.selectSellerInfo", commandMap);
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomHomeProductList (Map<String, Object> commandMap) throws Exception {
    	
    	List<Map<String, Object>> prodList = defaultDAO.selectList("PcTopSeller.selectRoomHomeProductList", commandMap);
     
        
    	List<Map<String, Object>> colorList = null;
    	try {
    		Map<String, Object> colorParam = new HashMap<String, Object>();
        	colorParam.put("productList", prodList);
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {
    		
    	}
		
		if(colorList != null) {
			
			for(int i = 0 ; i < prodList.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = prodList.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				prodList.get(i).put("CNT_PRD_COLOR", colorResult);
			}
		}
        
		return prodList;
    }
    
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectSellerBrandList (Map<String, Object> commandMap) throws Exception {        
        return defaultDAO.selectList("PcTopSeller.selectSellerBrandList", commandMap);
    }
    

    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellerShopProductList (Map<String, Object> commandMap) throws Exception {
    	
    	List<Map<String, Object>> prodList = defaultDAO.selectList("PcTopSeller.selectSellerShopProductList", commandMap);
     
        
    	List<Map<String, Object>> colorList = null;
    	try {
    		Map<String, Object> colorParam = new HashMap<String, Object>();
        	colorParam.put("productList", prodList);
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {
    		
    	}
		
		if(colorList != null) {
			
			for(int i = 0 ; i < prodList.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = prodList.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				prodList.get(i).put("CNT_PRD_COLOR", colorResult);
			}
		}
        
		return prodList;
    }
    
    
    @SuppressWarnings("unchecked")
    public List<Map<String,Object>> selectSellerpickList (Map<String, Object> commandMap) throws Exception {        
        return defaultDAO.selectList("PcTopSeller.selectSellerpickList", commandMap);
    }
    
    public int selectSellerpickProductListCount (Map<String, Object> commandMap) throws Exception {        
        return defaultDAO.selectCount("PcTopSeller.selectSellerpickProductListCount", commandMap);
    }
    
    @SuppressWarnings("unchecked")
    public Map<String,Object> selectSellerpickInfo (Map<String, Object> commandMap) throws Exception {        
        return defaultDAO.select("PcTopSeller.selectSellerpickInfo", commandMap);
    }
    
    
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellerpickProductList (Map<String, Object> commandMap) throws Exception {
    	
    	List<Map<String, Object>> prodList = defaultDAO.selectList("PcTopSeller.selectSellerpickProductList", commandMap);
     
        
    	List<Map<String, Object>> colorList = null;
    	try {
    		Map<String, Object> colorParam = new HashMap<String, Object>();
        	colorParam.put("productList", prodList);
    		colorList = this.defaultDAO.selectList("Product.selectProductColorListBatch", colorParam);
    	} catch (Exception e) {
    		
    	}
		
		if(colorList != null) {
			
			for(int i = 0 ; i < prodList.size(); i ++ ) {
				List<Map<String, Object>> colorResult = new ArrayList<Map<String,Object>>();
				String targetPrdCD = prodList.get(i).get("PRD_MST_CD").toString();
				for(int k = 0; k < colorList.size(); k++) {
					if(targetPrdCD.equals(colorList.get(k).get("PRD_MST_CD").toString())){
						colorResult.add(colorList.get(k));
					}
				}
				prodList.get(i).put("CNT_PRD_COLOR", colorResult);
			}
		}
        
		return prodList;
    }
    
    
    public int selectSellerShopProductListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("PcTopSeller.selectSellerShopProductListCount", commandMap);
    }
    
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellerLookBookList (Map<String, Object> commandMap) throws Exception {
    	
    	List<Map<String, Object>> lookbookList = defaultDAO.selectList("PcTopSeller.selectSellerLookBookList", commandMap);
     
        
    	for(int i = 0; i < lookbookList.size(); i++) {
    		lookbookList.get(i).put("CMM_FLE_TB_TYPE", commandMap.get("CMM_FLE_TB_TYPE"));
    		
    		List<Map<String, Object>> images = defaultDAO.selectList("PcTopSeller.selectSellerLookBookImages", lookbookList.get(i));
    		
    		lookbookList.get(i).put("IMAGES", images);
    	}
        
		return lookbookList;
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellerSeasonList (Map<String, Object> commandMap) throws Exception {

        
		return defaultDAO.selectList("PcTopSeller.selectSellerSeasonList", commandMap);
    }

    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellerMediaList (Map<String, Object> commandMap) throws Exception {

        
		return defaultDAO.selectList("PcTopSeller.selectSellerMediaList", commandMap);
    }

    @SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectSellerQnaList(Map<String, Object> commandMap) throws Exception {
		
    	List<Map<String, Object>> result =  defaultDAO.selectList("PcTopSeller.selectSellerQnaList", commandMap);
		
		for(int i = 0; i < result.size(); i++) {
			result.get(i).put("BRD_INQ_CONTENTS", StringUtil.clobToStr((CLOB)result.get(i).get("BRD_INQ_CONTENTS")));
			result.get(i).put("BRD_INQ_REPLY_CONTENTS", StringUtil.clobToStr((CLOB)result.get(i).get("BRD_INQ_REPLY_CONTENTS")));
		}
		
		return result;
	}

	@Override
	public int selectSellerQnaListCount(Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.selectCount("PcTopSeller.selectSellerQnaListCount", commandMap);
	}
    @SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> selectSellerQnaInfo(Map<String, Object> commandMap) throws Exception {

    	Map<String, Object> result = defaultDAO.select("PcTopSeller.selectSellerQnaInfo", commandMap); 
		
		result.put("BRD_INQ_CONTENTS", StringUtil.clobToStr((CLOB)result.get("BRD_INQ_CONTENTS")));
		
		return result;
	}

	@Override
	public int insertSellerQna(Map<String, Object> commandMap) throws Exception {

		return defaultDAO.insert("PcTopSeller.insertSellerQna", commandMap);
	}

	@Override
	public int updateSellerQna(Map<String, Object> commandMap) throws Exception {

		return defaultDAO.insert("PcTopSeller.updateSellerQna", commandMap);
	}

	@Override
	public int deleteSellerQna(Map<String, Object> commandMap) throws Exception {

		return defaultDAO.insert("PcTopSeller.deleteSellerQna", commandMap);
	}
    

    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomHomeMainSellerPickLIst (Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.selectList("PcContent.selectSellerPickList", commandMap);
    }	
	
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchArea (Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.selectList("PcContent.selectSearchArea", commandMap);
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSelShpList (Map<String, Object> commandMap) throws Exception {
    	return defaultDAO.selectList("PcContent.selectSelShpList", commandMap);
    }    
    
}
