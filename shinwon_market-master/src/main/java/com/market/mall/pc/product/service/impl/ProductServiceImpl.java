package com.market.mall.pc.product.service.impl;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.common.exception.TransactionException;
import com.epasscni.util.CsvUtil;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.FileUpload;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.UploadFile;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.product.service.ProductService;
import com.market.mall.pc.tag.service.TagService;
import com.market.util.ObjectToJsonUtil;

import egovframework.rte.fdl.property.EgovPropertyService;
import oracle.sql.CLOB;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;
	
	@Resource(name = "propertiesService") 
	protected EgovPropertyService propertiesService;
	
    @Autowired 
    private FileUpload fileUpload;
    
    @Autowired
	ServletContext servletContext;
    
    @Autowired
    TagService tagService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
 
     @SuppressWarnings("unchecked")
    public int insertPrw(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.insert("Product.insertPrw", commandMap);		
	}
    
    //상품상세 배너 정보
    public Map<String, Object> selectProductBannerInfo(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.select("Product.selectProductBannerInfo", commandMap);
    }
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductCategoryInfo
   	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  카테고리명
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductCategoryInfo(Map<String, Object> commandMap) throws Exception {
   		return this.defaultDAO.select("Product.selectProductCategoryInfo", commandMap);
   	}
    
	/**
	 * <pre>
	 * 1. MethodName : selectRegularStore
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 로그인한 사용자의 선호매장 정보 
   	 * 4. 작성자       : DEV_SONGJEONGEUN
   	 * 5. 작성일       : 2015. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectRegularStore(Map<String, Object> commandMap) throws Exception{
   		return this.defaultDAO.select("Product.selectRegularStore", commandMap);
   	}
    
    
    /**
	 * <pre>
	 * 1. MethodName : selectProduct
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  정보
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProduct(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectProductInfo", commandMap);		
	}
    
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTogetherProduct(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectTogetherProduct", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductExist
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품 존재여부 확인
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public int selectProductExist(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectCount("Product.selectProductExist", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductOptionList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  상품옵션
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductOptionList(Map<String, Object> commandMap) throws Exception {
    	
    	return this.defaultDAO.selectList("Product.selectProductMallOptionList", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductImageList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  상품이미지
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductImageList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductImageList", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductImageOneSizeList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세 사이즈 고정값에 대한 이미지 리스트 - 모바일용
   	 * 4. 작성자       : DEV_SONGJEONGEUN
   	 * 5. 작성일       : 2015. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductImageOneSizeList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductImageOneSizeList", commandMap);
    }
    
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductRelatedList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  연관상품목록
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductRelatedList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductRelatedList", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductActivityList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세 Activity 목록
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductActivityList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductActivityList", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectPlanOngoingList
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 진행중인 기획전 목록 
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanOngoingList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectPlanOngoingList", commandMap);		
	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectNotiGuideInfo
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  고시정보
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectNotiGuideInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectNotiGuideInfo", commandMap);		
	} 
    
    /**
	 * <pre>
	 * 1. MethodName : selectShippingGuideInfo
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  배송/반품/교환안내
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectShippingGuideInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectShippingGuideInfo", commandMap);		
	} 
    
    /**
	 * <pre>
	 * 1. MethodName : selectAsGuideInfo
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세   AS 안내
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectAsGuideInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectAsGuideInfo", commandMap);		
	} 
    
    @SuppressWarnings("unchecked")
    public int selectErpCodeCount(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectCount("Product.selectErpCodeCount", commandMap);		
	} 
    /**
	 * <pre>
	 * 1. MethodName : selectWashGuideInfo
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세 세탁 및 취급방법 안내 
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 19.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectWashGuideInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectWashGuideInfo", commandMap);		
	} 
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductCoupon
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   적용쿠폰
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductCoupon(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectProductCoupon", commandMap);		
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductTechInfoList
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   상품기술정보
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductTechInfoList(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.selectList("Product.selectProductTechInfoList", commandMap);		
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductPriceInfo
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   미리계산하기
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductPriceInfo(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectProductPriceInfo", commandMap);		
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductCouponList
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   상품 적용 가능 쿠폰 목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductCouponList(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.selectList("Product.selectProductCouponList", commandMap);		
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductReputation
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   전체 평점
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductReputation(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectProductReputation", commandMap);		
   	}
    
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductRevStar
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세 - 색상/사이즈 만족도 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 19.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductRevStar(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectProductRevStar", commandMap);		
   	}
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectReputationList
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   상품평 목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 18.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectReputationList(Map<String, Object> commandMap) throws Exception {
    	if( StringUtil.isNullToString(commandMap.get("REPUTATION_ORDER_BY")).equals("") ){
        	commandMap.put("REPUTATION_ORDER_BY", "PRD_REV_REG_DT DESC");
    	}
    	List<Map<String,Object>> revList = this.defaultDAO.selectList("Product.selectReputationList", commandMap);
    	
    	for(int index=0; index < revList.size(); index++){
    	    Map<String, Object> paramMap = new HashMap<String, Object>();
    	    String idx = StringUtil.getString(revList.get(index).get("PRD_REV_IDX"));
    	    paramMap.put("PRD_REV_IDX", idx);
    	    paramMap.put("CMM_FLE_TB_NM", "T_PRD_REV");
    	    paramMap.put("CMM_FLE_TB_PK", idx);
    	    
    	    List<Map<String, Object>> fileList = this.defaultDAO.selectList("Common.selectCommonFileList", paramMap);
    	    revList.get(index).put("fileList", fileList);
    	}
       	return revList;	
   	}
    
	/**
	 * <pre>
	 * 1. MethodName : selectReputationList
	 * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : 상품상세   QNA 목록 개수
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 18.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectQnaListCount(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("Product.selectQnaListCount", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectReputationList
	 * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : 상품상세   QNA 목록 
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 18.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList( Map<String, Object> commandMap) throws Exception {
		List<Map<String, Object>> result = this.defaultDAO.selectList("Product.selectQnaList", commandMap);
		for(int i = 0; i < result.size(); i++) {
			result.get(i).put("BRD_INQ_CONTENTS", StringUtil.clobToStr((CLOB)result.get(i).get("BRD_INQ_CONTENTS")));
			result.get(i).put("BRD_INQ_REPLY_CONTENTS", StringUtil.clobToStr((CLOB)result.get(i).get("BRD_INQ_REPLY_CONTENTS")));

		}
		
		return result;
	}
	

    /**
    * <pre>
    * 1. MethodName : insertReputation
    * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : 상품평 쓰기
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 21.
    * </pre>
    *
    * @param request
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int insertReputation (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception
    {
    
    	int result = defaultDAO.insert("Product.insertReputation", commandMap);
        
        if(result > 0)
        {
        	List<CommonsMultipartFile> fileList = (List) request.getFiles("upload");
            if(fileList.size() > 0)
            {
                CommonsMultipartFile file = fileList.get(0);
                if(!file.isEmpty())
                {
                    // 파일 등록 및 파일 업로드
                    commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV");
                    commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
                    commandMap.put("CMM_FLE_SORT", 1);
                    commandMap.put("CMM_FLE_REG_ID", commandMap.get("MEM_MST_MEM_ID"));
                    commandMap.put("CMN_FLE_ALT_TXT", "");
                    result = defaultDAO.insert("Common.insertCommonFile", fileUpload.execute(commandMap, file, "board", "image", "Y"));

                    if(result > 0)
                    {
                        return result;
                    }
                    else
                    {
                        throw new TransactionException("파일 등록 중 오류가 발생하였습니다.");
                    }
                }
            }
        }

    	return result;
    }
    
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductSizeGuide
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품상세   사이즈 조견표
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 21.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductSizeGuide(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectProductSizeGuide", commandMap);		
   	}
    
    /**
	 * <pre>
	 * 1. MethodName : selectCategoryPath
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  상단 카테고리 경로
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCategoryPath(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectCategoryPath", commandMap);		
	}
    

    /**
	 * <pre>
	 * 1. MethodName : selectBrandCategoryPath
	 * 2. ClassName  : ProductServiceImpl.java
   	 * 3. Comment    : 상품상세  상단 카테고리 경로, 이전 화면 정보를 찾을 수 없는 경우.
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrandCategoryPath(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectBrandCategoryPath", commandMap);		
	}
    
	/**
	 * <pre>
	 * 1. MethodName : insertQna
	 * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : Qna작성
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 22.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertQna(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("Product.insertQna", commandMap);
	}
	
	/**
	 * <pre>
	 * 1. MethodName : deleteQna
	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품 QnA 삭제 
     * 4. 작성자       : DEV_SONGJEONGEUN
     * 5. 작성일       : 2015. 7. 20.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int deleteQna(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.delete("Product.deleteQna", commandMap);
	}
	
    /**
   	 * <pre>
   	 * 1. MethodName : selectQnaInfo
   	 * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : 상품 QnA 상세 
     * 4. 작성자       : DEV_SONGJEONGEUN
     * 5. 작성일       : 2015. 7. 20.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectQnaInfo(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectQnaInfo", commandMap);		
   	}
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectQnaSimpleInfo(Map<String, Object> commandMap) throws Exception {
    	Map<String, Object> result = this.defaultDAO.select("Product.selectQnaSimpleInfo", commandMap);
    	
    	result.put("BRD_INQ_CONTENTS", StringUtil.clobToStr((CLOB)result.get("BRD_INQ_CONTENTS")));
       	return 	result;
   	}
    
	
	/**
	 * <pre>
	 * 1. MethodName : updateQna
	 * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : Qna 수정
	 * 4. 작성자       : DEV_SONGJEONGEUN
	 * 5. 작성일       : 2015. 7. 20.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateQna(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("Product.updateQna", commandMap);
	}
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateProductReadCnt
	 * 2. ClassName  : ProductServiceImpl.java
	 * 3. Comment    : 상품 조회수 업데이트 
	 * 4. 작성자       : DEV_SONGJEONGEUN
	 * 5. 작성일       : 2015. 5. 26.
	 * </pre>
	 * 
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateProductReadCnt(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.insert("Product.updateProductReadCnt", commandMap);
	}
	
    /**
    * <pre>
    * 1. MethodName : selectProductOptionMstList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품에 속한 옵션 마스터 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductOptionMstList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductOptionMstList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductOptionDtlList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품에 속한 옵션 상세 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductOptionDtlList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductOptionDtlList", commandMap);		
	}
    
    /**
     * <pre>
     * 1. MethodName : selectProductPlanList
     * 2. ClassName : ProductListServiceImpl.java
     * 3. Comment : 상품에 속한 기획전 리스트
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 12. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectProductPlanList(Map<String, Object> commandMap) throws Exception {
 		
     	return this.defaultDAO.selectList("Product.selectProductPlanList", commandMap);		
 	}
     
     /**
    * <pre>
    * 1. MethodName : selectProductOptionMstEstCount
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 필수옵션 등록 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductOptionMstEstCount(Map<String, Object> commandMap) throws Exception
     {
         return defaultDAO.selectCount("Product.selectProductOptionMstEstCount",commandMap);
     }
    
    /**
    * <pre>
    * 1. MethodName : selectProductNewListList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : E메거진 상퓸뉴스
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductEmagazineList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductEmagazineList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductNfiInfoList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품고시정보 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductNfiInfoList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectproductNotificationInfo", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductRevListCount
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품평 갯수 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectReputationListCount(Map<String, Object> commandMap) throws Exception
    {
        return defaultDAO.selectCount("Product.selectReputationListCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectProductKingerList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품 고객체험단 리뷰
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductKingerList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductKingerList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductLastCategoryPath
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품에 속한 마지막 카테고리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductLastCategoryPath(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectProductLastCategoryPath", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductTimeSaleInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 타임세일 내역
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductTimeSaleInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectProductTimeSaleInfo", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectMainTimeSaleInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 타임세일 메인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMainTimeSaleInfo(Map<String, Object> commandMap) throws Exception {
    	//return this.defaultDAO.select("Product.selectMainTimeSaleInfo", commandMap);	
        return null;
	}
    
    /**
    * <pre>
    * 1. MethodName : selectMainOneDayInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 원데이특가 메인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectMainOneDayInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectMainOneDayInfo", commandMap);
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductEmagazineRevList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 상품 E메거진 상품리뷰
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductEmagazineRevList(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.selectList("Product.selectProductEmagazineRevList", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectProductOneDayInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 원데이특가 내역
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectProductOneDayInfo(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectProductOneDayInfo", commandMap);		
	}
    
    /**
    * <pre>
    * 1. MethodName : selectSearchProductCount
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 팝업 상품검색 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectSearchProductCount(Map<String, Object> commandMap) throws Exception
    {
    	//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
    	String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
    	String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
    	
    	if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgIdx)){
    		commandMap.put("searchCategoryYn", "Y");
    	}

        return defaultDAO.selectCount("Product.selectSearchProductCount",commandMap);
    }
    
    /**
    * <pre>
    * 1. MethodName : selectSearchProductList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 팝업 상품검색 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectSearchProductList(Map<String, Object> commandMap) throws Exception 
    {
    	commandMap.put("IMG_THUMBNAIL_SIZE", Code.PRODUCT_THUMBNAIL_IMAGE_WIDTH);
    	
    	commandMap.put("onlineShopCode", Code.ONLINE_SHOP_CODE);
    	
    	//카테고리 하나라도 선택되어있으면 searchCategoryYn이 Y
    	String searchPrdCtgEnv = StringUtil.getString(commandMap.get("searchPrdCtgEnv"),"");
    	String searchPrdCtgBrand = StringUtil.getString(commandMap.get("searchPrdCtgBrand"),"");
    	String searchPrdCtgIdx = StringUtil.getString(commandMap.get("searchPrdCtgIdx"),"");
    	
    	if(!("").equals(searchPrdCtgEnv) || !("").equals(searchPrdCtgBrand) || !("").equals(searchPrdCtgIdx)){
    		commandMap.put("searchCategoryYn", "Y");
    	}
    	
    	List<Map<String, Object>> resultList = null;
    	
    	resultList = defaultDAO.selectList("Product.selectSearchProductList",commandMap);
    	
        return resultList;
    }
    
    /**
    * <pre>
    * 1. MethodName : selectOptionDetailInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 겟잇나우 매장검색 - 상품에 대한 옵션 상세
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 13.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectOptionDetailInfo(Map<String, Object> commandMap) throws Exception 
    {
    	return this.defaultDAO.selectList("Product.selectOptionDetailInfo", commandMap);		
    }
    
    /**
    * <pre>
    * 1. MethodName : selectErpShpCodeList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 옵션 기간계 코드로 재고가 있는 erp매장코드 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 13.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectErpShpCodeList(Map<String, Object> commandMap) throws Exception 
    {
    	return new ArrayList<Map<String, Object>>();		
    }
    
    /**
    * <pre>
    * 1. MethodName : selectErpDirShpCodeList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 옵션 기간계 코드 재고 유무 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public int selectErpShpCodeCount(Map<String, Object> commandMap) throws Exception 
    {
    	return 0;		
    }
    
    /**
    * <pre>
    * 1. MethodName : selectStoreList
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 매장코드로 지점 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectStoreList(Map<String, Object> commandMap) throws Exception 
    {
    	return this.defaultDAO.selectList("Product.selectStoreList", commandMap);		
    }
    
    /**
    * <pre>
    * 1. MethodName : selectStoreCount
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 매장코드로 지점 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectStoreCount(Map<String, Object> commandMap) throws Exception
    {
    	return this.defaultDAO.selectCount("Product.selectStoreCount", commandMap);		
    }
    
    /**
    * <pre>
    * 1. MethodName : selectGetItNowShopInfo
    * 2. ClassName : ProductServiceImpl.java
    * 3. Comment : 매장 받는 시간 정보
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectGetItNowShopInfo(Map<String, Object> commandMap) throws Exception 
    {
    	return this.defaultDAO.selectList("Product.selectGetItNowShopInfo", commandMap);
    }
    
	/**
	* <pre>
	* 1. MethodName : insertEstProduct
	* 2. ClassName : ProductServiceImpl.java
	* 3. Comment : 가격흥정 등록
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 1. 19.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	public int insertEstProduct (Map<String, Object> commandMap) throws Exception
	{
		int result = 0;
		
		//견적코드 가져오기
		String ESM_MST_CD = defaultDAO.selectStr("Product.selectEstimateManagementMasterCd", commandMap);
		
		commandMap.put("ESM_MST_CD", ESM_MST_CD);
		
		result = defaultDAO.insert("Product.insertEstimateManagement", commandMap);
		
		if(result > 0){
			commandMap.put("PRD_MST_CD", commandMap.get("PRD_MST_CD"));
	    	commandMap.put("ESM_PRD_WSH_PRICE", commandMap.get("ESM_MST_ESM_TOT_PRICE"));
	    	commandMap.put("ESM_PRD_PCH_IDX", -1);
	    	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
			commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
			commandMap.put("OPT_DTL_IDX", commandMap.get("OPT_DTL_IDXs"));
			commandMap.put("ESM_PRD_CNT", StringUtil.getInt(commandMap.get("REQUEST_CNT"), 1));
	    	
	    	result =  defaultDAO.insert("Product.insertEstimateProduct", commandMap);
		}
		
		return result;
	}
	
	/**
	* <pre>
	* 1. MethodName : selectStoreInfo
	* 2. ClassName : ProductServiceImpl.java
	* 3. Comment : 픽업매장 상세정보 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 2. 22.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectStoreInfo(Map<String, Object> commandMap) throws Exception {
       	return this.defaultDAO.select("Product.selectStoreInfo", commandMap);		
   	}
	
	/**
	* <pre>
	* 1. MethodName : selectProductLngDivCardNm
	* 2. ClassName : ProductServiceImpl.java
	* 3. Comment : 장기할부 안내 
	* 4. 작성자 : DEV_KIMMINHO
	* 5. 작성일 : 2016. 4. 1.
	* </pre>
	*
	* @param commandMap
	* @return
	* @throws Exception
	*/
	@SuppressWarnings("unchecked")
    public Map<String, Object> selectProductLngDivCardNm(Map<String, Object> commandMap) throws Exception {
    	return this.defaultDAO.select("Product.selectProductLngDivCardNm", commandMap);		
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductOptionMustList(Map<String, Object> commandMap) throws Exception {
	    return this.defaultDAO.selectList("Product.selectProductOptionMustList",commandMap);
	}
    
	//추가혜택 정보
	public List<Map<String, Object>> selectBenefitList(Map<String, Object> commandMap) throws Exception {
	    
	    List<Map<String, Object>> result = this.defaultDAO.selectList("Product.selectBenefitList",commandMap); 
	    
	    for(int index=0; index < result.size(); index++){
	        Map<String, Object> paramMap = new HashMap<String, Object>();
	        List<Map<String, Object>> detailList = new ArrayList<Map<String, Object>>();
	        
	        String bnfidx = StringUtil.getString(result.get(index).get("BNF_MST_IDX"));
	        
	        paramMap.put("BNF_MST_IDX", bnfidx);
	        detailList = this.defaultDAO.selectList("Product.selectBenefitDetailList",paramMap); 
	        
	        result.get(index).put("detailList", detailList);
	    }
	    
	    return result;
	}
	
	//마이핏 정보
	public List<Map<String,Object>> selectMyFitInfo (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectList("Product.selectMyFitInfo", commandMap);
	}
	
	//마이핏 샘플 이미지 정보
	public String selectMyFitSampleImage (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectStr("Product.selectMyFitSampleImage", commandMap);
	}
	
	public int insertMyFitInfo (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.insert("Product.insertMyFitInfo", commandMap);
	}

	public int updateMyFitInfo (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.update("Product.updateMyFitInfo", commandMap);
	}
	
	//포토리뷰 목록 갯수
	public int selectPhotoRevListCount (Map<String, Object> commandMap) throws Exception {
	    return defaultDAO.selectCount("Product.selectPhotoRevListCount", commandMap);
	}
	
	//포토리뷰 목록
    public List<Map<String,Object>> selectPhotoRevList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Product.selectPhotoRevList", commandMap);
    }
    
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPhotoRevLimitList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Product.selectPhotoRevLimitList", commandMap);
    }
    @SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPhotoRevLimitAllList (Map<String, Object> commandMap) throws Exception {
    	
    	List<Map<String, Object>> rtList = defaultDAO.selectList("Product.selectPhotoRevLimitAllList", commandMap);
    	
    	
    	for(int i = 0 ; i < rtList.size(); i++) {
    		
    		List<Map<String, Object>> imgList = defaultDAO.selectList("Product.selectPhotoAllList", rtList.get(i));
    		rtList.get(i).put("PRD_REV_CONTENTS", StringUtil.clobToStr((CLOB)rtList.get(i).get("PRD_REV_CONTENTS")));	
    		rtList.get(i).put("IMAGES", imgList);
    	}
    	
        return rtList;
    }
    
    //필수옵션 리스트
    public List<Map<String,Object>> selectProductMustOptionList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Product.selectProductMustOptionList", commandMap);
    }
    
    //추가옵션 리스트
    public List<Map<String,Object>> selectProductAddOptionList (Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectList("Product.selectProductAddOptionList", commandMap);
    }
    
    public List<Map<String, Object>> selectProductGroupInfo (Map<String, Object> commandMap) throws Exception {
        
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        
        List<Map<String, Object>> productGroupCodeList = defaultDAO.selectList("Product.selectProductGroupList", commandMap);
        
        for(int index=0; index < productGroupCodeList.size(); index++){
            Map<String, Object> paramMap = new HashMap<String, Object>();
            Map<String, Object> productGroupMap = new HashMap<String, Object>();
            
            String subProductCode = StringUtil.getString(productGroupCodeList.get(index).get("SUB_PRD_MST_CD"),"");
            paramMap.put("PRD_MST_CD", subProductCode);
            //상품 상세 정보
            Map<String, Object> productGroupInfo= defaultDAO.select("Product.selectProductGroupInfo", paramMap);
            
            //상품 필수 옵션 정보
            List<Map<String, Object>> mustOptionList = defaultDAO.selectList("Product.selectProductMustOptionList", paramMap);
            
            //상품 추가 옵션 정보
            List<Map<String, Object>> addOptionList = defaultDAO.selectList("Product.selectProductAddOptionList", paramMap);

            productGroupMap.put("productGroupInfo", productGroupInfo);
            productGroupMap.put("mustOptionList", mustOptionList);
            productGroupMap.put("addOptionList", addOptionList);
            
            resultList.add(productGroupMap);
        }

        return resultList;
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectProductRevList(Map<String, Object> commandMap) throws Exception {

		Map<String, Object> imgParam = new HashMap<String, Object>();
		imgParam.put("PRD_PRD_MST_CD", commandMap.get("PRD_PRD_MST_CD"));
		
		List<Map<String, Object>> rstData = defaultDAO.selectList("Product.selectProductRevList", commandMap);
		for(int i=0; i < rstData.size(); i++){
			Map<String,Object> reviewItem = rstData.get(i);
			if(reviewItem.containsKey("PRD_REV_CONTENTS") && reviewItem.get("PRD_REV_CONTENTS") instanceof CLOB) {
				reviewItem.put("PRD_REV_CONTENTS", StringUtil.clobToStr((CLOB)reviewItem.get("PRD_REV_CONTENTS")));
			}
			
			if(Integer.parseInt(reviewItem.get("CMM_FLE_CNT").toString()) > 0 ) {
				reviewItem.put("IMAGES", defaultDAO.selectList("Product.selectPhotoRevList", imgParam));
			}
		}
		return rstData;
	}

	@Override
	public int selectProductRevListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("Product.selectProductRevListCount", commandMap);
	}
	@Override
	public void deleteProductRevInfo(Map<String, Object> commandMap) throws Exception {
		defaultDAO.delete("Product.deleteProductRevInfo", commandMap);
	}

	@SuppressWarnings("unchecked")
    @Override
	public int insertProductByFile(CommonsMultipartFile file) throws Exception {
		Map<String,Object> tagParam = new HashMap<String,Object>();
		tagParam.put(TAG_MODEL.TAG_GRP_ID, "f5bf6a00-4845-4c4b-ab99-6a9643844395");
		
		Calendar c = Calendar.getInstance();
		String year = ""+c.get(Calendar.YEAR);
		String month = String.format("%02d", (c.get(Calendar.MONTH)+1));
		String day = String.format("%02d", (c.get(Calendar.DAY_OF_MONTH)));
		String appendPath = "/editor/"+year+"/"+month+"/"+day;
		String cdnUrl = propertiesService.getString("cdn.protocol")+propertiesService.getString("cdn.domain");
		
		
        List<Map<String, Object>> selectedTagList= tagService.selectTagGroupWithTagListById(tagParam);
		String[] CONST_CSV_HEADER = {"STYLE_NO","TAG_STYLE_NO","SEASON_YEAR"}; 
		CsvUtil csvUtil = new CsvUtil();
		List<Map<String,Object>> rawDataList = new ArrayList<Map<String,Object>>();
		String fileExt = StringUtil.getString(FilenameUtils.getExtension(file.getOriginalFilename())); 
		if("csv".equals(fileExt)) {
			rawDataList = csvUtil.csvParse(file, CONST_CSV_HEADER);
		} else if("xls".equals(fileExt)||"xlsx".equals(fileExt)) {
			rawDataList = ExcelUtil.excelRead(file, CONST_CSV_HEADER);
		}
		int result = 0;
		for(int index = 0;index<rawDataList.size();index++) {
			Map<String,Object> row = rawDataList.get(index);
			Map<String,Object> prefixParam = new HashMap<String,Object>();
			String rowStyleNo = StringUtil.getString(row.get(CONST_CSV_HEADER[0]));
			String rowTagStyleNo = StringUtil.getString(row.get(CONST_CSV_HEADER[1]));
			prefixParam.put("PRD_MST_ERP_CD", rowStyleNo);
			int count = defaultDAO.selectCount("Product.selectErpCodeCount", prefixParam);
			if(count>0) {continue;}
			
			String PRD_MST_NFI_INF1 = "";
			String PRD_MST_NFI_INF2 = "";
			String PRD_MST_NFI_INF3 = "";
			String PRD_MST_NFI_INF5 = "";
			String PRD_MST_PC_DTL_DSC = "";
			String PRD_MST_MB_DTL_DSC = "";
			List<String> editorImageUrlList = new ArrayList<String>();
			
			int colorChangeCount = 0;
			int productImageCount = 0;
			Map<String,Object> prdMstCdMap = new HashMap<String,Object>();
			prdMstCdMap.put("SET_PRD_MST_CD", "S");
			String PRD_MST_CD = defaultDAO.selectStr("BasicProduct.selectBasicProductMasterCd", prdMstCdMap);
			
			if(rowStyleNo==null || rowStyleNo.isEmpty()) { break; }
			Map<String,Object> erpData = ErpRequest.requestProductMaster2WithDetail(rowStyleNo);
			List<Map<String,Object>> masterList = (List<Map<String,Object>>)erpData.get("masterList");
			List<Map<String,Object>> detailList = (List<Map<String,Object>>)erpData.get("detailList");
			if(masterList==null || masterList.size()<=0) { continue; }
			
			
			setCategoryByStyleNo(rowStyleNo,PRD_MST_CD);
			//마스터 입력
			String lastColor = "";
			int PRD_MST_SEL_CNT = 0;
			Map<String,Object> master = masterList.get(0);
			mappingErpToProductMaster(master);
			for(int detailIndex = 0; detailIndex<detailList.size(); detailIndex++) {
				Map<String,Object> detail = detailList.get(detailIndex);
				String delemeter = (detailIndex>0 && detailList.size()-1!=detailIndex)?", ":"";
				if(detail.containsKey("COLORATION_GB")) {
					PRD_MST_NFI_INF1 = PRD_MST_NFI_INF1+ "["+StringUtil.getString(detail.get("COLORATION_GB"))+"] ";
				}
				if(detail.containsKey("MATR_NAME")) {
					PRD_MST_NFI_INF1 = PRD_MST_NFI_INF1+ StringUtil.getString(detail.get("MATR_NAME"));
				}
				if(detail.containsKey("MIXRATE")) {
					PRD_MST_NFI_INF1 = PRD_MST_NFI_INF1+ StringUtil.getString(detail.get("MIXRATE"))+delemeter;
				}
			}
			
			for(int masterIndex=0; masterIndex<masterList.size();masterIndex++) {
				Map<String,Object> masterInfo = masterList.get(masterIndex);
				int qty = StringUtil.getInt(masterInfo.get("STOCK_QTY"));
				String color = "";
				if(masterInfo.containsKey("COLOR_CODE") && !lastColor.equals(masterInfo.get("COLOR_CODE"))) {
					Map<String,Object> colorMap = new HashMap<String,Object>();
					color = StringUtil.getString(masterInfo.get("COLOR_CODE"));
					PRD_MST_NFI_INF2 = PRD_MST_NFI_INF2 + color+" , ";
					/* /nas/cdn/attach/editor/2020/06/18/f3045f5d-7226-489a-9e82-a443ebdaf38a.png */
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_ZZ.jpg");
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_M.jpg");
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_2.jpg");
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_3.jpg");
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_4.jpg");
					editorImageUrlList.add("http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+lastColor+"_5.jpg");
					String uploadedImage = "";
					for(int i=0;i<editorImageUrlList.size();i++) {
						String editorImageUrl = editorImageUrlList.get(i);
						uploadedImage = StringUtil.getString(downloadDetailImage(editorImageUrl,cdnUrl,appendPath));
						if(!"".equals(uploadedImage)) {
							PRD_MST_PC_DTL_DSC =  PRD_MST_PC_DTL_DSC+"<img src=\""+uploadedImage+"\" title=\"상세이미지\">";
							PRD_MST_MB_DTL_DSC =  PRD_MST_MB_DTL_DSC+"<img src=\""+uploadedImage+"\" title=\"상세이미지\">";
						}
					}
					colorMap.put("CMN_COM_IDX", color);
					colorMap.put("PRD_MST_CD", PRD_MST_CD);
					colorMap.put("OPT_STK_CNT", 0);
					colorMap.put("UP_COM_OPT_IDX", -1);
					colorMap.put("CMM_OPT_USE_YN", "Y");
					colorMap.put("PRD_CMM_TYPE", "C");
					lastColor = color;
					defaultDAO.insert("BasicProduct.insertProductMustOptionColorByFile", colorMap);
					
					String classificationImageUrl = "http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0, 2) +"/" +rowTagStyleNo.substring(0, 9)+"/" +rowTagStyleNo.substring(0, 9)+"_"+lastColor+"_ZZ.jpg";
					List<String> imageSpecificationList = new ArrayList<String>();
					// 디폴트 2:3
					imageSpecificationList.add("_B");
					if(classifyImageType(classificationImageUrl)) {
						//정비율
						master.put("PRD_MST_IMG_DPL", "R");
						imageSpecificationList.add("_ZZ");
						imageSpecificationList.add("_B");
						imageSpecificationList.add("_2");
						imageSpecificationList.add("_3");
						imageSpecificationList.add("_4");
						imageSpecificationList.add("_5");
					}
					else {
						master.put("PRD_MST_IMG_DPL", "S");
						imageSpecificationList.add("_M");
						imageSpecificationList.add("_3");
						imageSpecificationList.add("_2");
						imageSpecificationList.add("_4");
						imageSpecificationList.add("_5");
					}
					for(int i=0;i<imageSpecificationList.size();i++) {
						String thumbnailImage = "http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0, 2) +"/" +rowTagStyleNo.substring(0, 9)+"/" +rowTagStyleNo.substring(0, 9)+"_"+lastColor+imageSpecificationList.get(i)+".jpg";
						downloadImage(thumbnailImage,PRD_MST_CD,productImageCount++);
					}
					colorChangeCount = colorChangeCount+1;
				}
				if(masterInfo.containsKey("SIZE_CODE")) {
					String size = StringUtil.getString(masterInfo.get("SIZE_CODE"));
					PRD_MST_NFI_INF3 = PRD_MST_NFI_INF3 + size+" , ";
					Map<String,Object> sizeMap = new HashMap<String,Object>();
					sizeMap.put("PRD_MST_CD", rowStyleNo);
					sizeMap.put("PRD_CMM_TYPE", "S");
					sizeMap.put("CMM_OPT_USE_YN", "Y");
					sizeMap.put("OPT_STK_CNT", qty);
					sizeMap.put("UP_COM_OPT_IDX", lastColor);
					sizeMap.put("CMM_OPT_NM", size);
					sizeMap.put("PRD_MST_CD", PRD_MST_CD);
					defaultDAO.insert("BasicProduct.insertProductMustOptionSizeByFile", sizeMap);
				}
				PRD_MST_SEL_CNT = PRD_MST_SEL_CNT + qty;
				PRD_MST_NFI_INF5 = StringUtil.getString(master.get("PROD_NATION")+" , ");
			}
			
			String specImageUrl = "http://img.shinwonmall.com/images/"+rowTagStyleNo.substring(0,2)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"/"+rowTagStyleNo.substring(0,rowTagStyleNo.length()-1)+"_"+String.format("%02d", 2)+".jpg";
			String uploadedImage = StringUtil.getString(downloadDetailImage(specImageUrl,cdnUrl,appendPath),"#none");
			PRD_MST_PC_DTL_DSC =  PRD_MST_PC_DTL_DSC+"<img src=\""+uploadedImage+"\" title=\"상세정보\">";
			PRD_MST_MB_DTL_DSC =  PRD_MST_MB_DTL_DSC+"<img src=\""+uploadedImage+"\" title=\"상세정보\">";
			
			
			master.put("PRD_MST_CD", PRD_MST_CD);
			master.put("PRD_MST_NFI_INF1", PRD_MST_NFI_INF1);
			master.put("PRD_MST_NFI_INF2", PRD_MST_NFI_INF2.substring(0, PRD_MST_NFI_INF2.lastIndexOf(',')-1));
			master.put("PRD_MST_NFI_INF3", PRD_MST_NFI_INF3.substring(0, PRD_MST_NFI_INF3.lastIndexOf(',')-1));
			master.put("PRD_MST_PC_DTL_DSC", PRD_MST_PC_DTL_DSC);
			master.put("PRD_MST_MB_DTL_DSC", PRD_MST_MB_DTL_DSC);
			master.put("PRD_MST_SEL_CNT", PRD_MST_SEL_CNT);
			master.put("PRD_MST_CUR_CNT", 0);
			master.put("PRD_MST_LST_CNT", 0);
			master.put("PRD_MST_NFI_INF5", PRD_MST_NFI_INF5.substring(0, PRD_MST_NFI_INF5.lastIndexOf(',')-1));
			master.put("PRD_MST_SEASON",  StringUtil.getString(master.get("SEASON")));
			result = result + defaultDAO.insert("BasicProduct.insertProductMasterByFile", master);
			Map<String,Object> tagBindParam = new HashMap<String,Object>();
			JSONArray jsonArray = new JSONArray();
			
			tagBindParam.put("TAG_BND_ID", PRD_MST_CD);
			tagBindParam.put("TAG_BND_STATUS", "USE");
			
			for(int tagIndex =0;tagIndex<selectedTagList.size();tagIndex++) {
				Map<String, Object> tag = selectedTagList.get(tagIndex);
				if(tagIndex==0) {
					tag.put("TAG_BND_REP", "Y");
				}
				tag.put(TAG_MODEL.TAG_BND_TYPE, "TYPE_PRODUCT");
				jsonArray.add(ObjectToJsonUtil.objectToJson(tag));
			}
			tagBindParam.put("TAG_ID_LIST", jsonArray.toString());
			tagService.insertTagBind(tagBindParam);
			//a41f94a4-09bd-42f4-9438-1637546b6603	S0011954	USE                                                                                                 	20200220002644	20200220002644		TYPE_PRODUCT
		}
		return result;// list.size();
	}	
	private String downloadDetailImage(String imageUrl, String cdnUrl, String appendPath) {
		String uploadedImage = "";
		String basePath = new File( servletContext.getRealPath("/nas/cdn/attach")).getAbsolutePath();
		BufferedImage img = null;
		try {
			URL url = new URL(imageUrl);
			img = ImageIO.read(url);
			if(img!=null) {
				String fileName = UUID.randomUUID().toString()+".jpg";
				uploadedImage= cdnUrl+"/attach"+appendPath+"/"+fileName;
				File imageDirectory = new File(basePath+appendPath); 
				if(!imageDirectory.exists()) {
					imageDirectory.mkdir();
				}
				File imageFile = new File(imageDirectory.getAbsolutePath()+"/"+fileName); 
				ImageIO.write(img, "jpg", imageFile);
				
			}
		} catch (MalformedURLException e) {
			
		} catch (IOException e) {
			
		}
		return uploadedImage;
	}
	private boolean classifyImageType(String url) {
		//true 일경우 2/3
		//false 일경우 정비율
		try {
			URL imageUrl = new URL(url);
			BufferedImage image = ImageIO.read(imageUrl);
			if(image==null) {
				return false;
			}
		} catch (MalformedURLException e) {
			return false;
		} catch (IOException e) {
			return false;
		}
		return true;
	}
	private Map<String,Object> getProductCommonData(){
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("PRD_MST_TYPE", "G");
		result.put("PRD_MST_MD_ID", "admin");
		result.put("PRD_MST_DLV_FEE", 2500);
		result.put("PRD_MST_PC_CPN_UNT", "S");
		result.put("PRD_MST_PC_CPN_PRC", "0");
		result.put("PRD_MST_MB_CPN_UNT", "S");
		result.put("PRD_MST_MB_CPN_PRC", "0");
		result.put("PRD_MST_UNT", "S");
		result.put("PRD_MST_SALE_RATE", "0");
		result.put("PRD_MST_ADD_MIL", "0");
		result.put("PRD_MST_SRC_YN", "Y");
		result.put("PRD_MST_O2O_YN", "Y");
		result.put("PRD_MST_LIVE_ON_YN", "N");
		result.put("PRD_MST_NAVER_USE_YN", "Y");
		result.put("PRD_MST_DAUM_USE_YN", "Y");
		result.put("PRD_MST_EMP_USE_YN", "Y");
		result.put("PRD_MST_PRT_USE_YN", "Y");
		result.put("PRD_MST_PCK_USE_YN", "N");
		result.put("PRD_MST_FEE", "0");
		result.put("PRD_MST_LNG_DIV_MNT1", "0");
		result.put("PRD_MST_DLV_BND", "0");
		result.put("PRD_MST_DEL_YN", "N");
		result.put("PRD_MST_CNL_PC_YN", "Y");
		result.put("PRD_MST_CNL_MB_YN", "Y");
		result.put("PRD_MST_SEL_STATE", "I");
		result.put("PRD_MST_DPL_STATE", "Y");
		result.put("PRD_MST_APV_STATE", "A");
		result.put("PRD_MST_LIVE_ON_YN", "Y");
		result.put("PRD_MST_LIVE_ON_DSP_YN", "Y");
		result.put("PRD_MST_BRD_MRG_YN", "Y");
		result.put("PRD_MST_VDR_YN", "Y");
		result.put("PRD_MST_CPN_YN", "N");
		result.put("PRD_MST_PC_CPN_PRC", "0");
		result.put("PRD_MST_MB_CPN_PRC", "0");
		result.put("PRD_MST_NFI_INF4", "(주)신원");
		result.put("PRD_MST_NFI_INF6", "본 상품은 반드시 드라이크리닝 해주시기 바랍니다.(세탁케어라벨참조)");
		result.put("PRD_MST_NFI_INF8", "제품 이상 시 공정거래위원회 고시 소비자분쟁해결기준에 의거 보상합니다.");
		result.put("PRD_MST_NFI_INF9", "(주)신원 1661-2585");
		result.put("PRD_MST_NFI_INF10", "소매기장  총장 밑단 수선등 디자인 변경불가 (리폼불가)");
		result.put("PRD_MST_NFI_IDX", "1918");
		
		//제조사 신원
		result.put("PRD_MST_MRK_IDX", "777");
		//상품코드 첫글자
		result.put("SET_PRD_MST_CD", "S");
		return result;	
	}
	private void mappingErpToProductMaster(Map<String,Object> master) throws Exception {
		String brand = StringUtil.getString(master.get("BRAND"));
		String styleNo = StringUtil.getString(master.get("STYLE_NO"));
		
		//지이크 파렌하이트 변경케이스
		String brandEname = StringUtil.getString(master.get("BRAND_ENAME"));
		if(brandEname.equals("SIEG FAHRENHEIT")) {
			master.put("BRAND_ENAME", "FAHRENHEIT");
		}
		
		
		master.put("PRD_MST_PRC", StringUtil.getString(master.get("TAG_PRICE")));
		master.put("PRD_MST_SCH_PRC", StringUtil.getString(master.get("TAG_PRICE")));
		
		master.put("PRD_MST_NM", StringUtil.getString(master.get("PROD_NAME")));
		master.put("PRD_MST_ERP_CD", styleNo);
		master.put("PRD_MST_ERP_TAG_NO", StringUtil.getString(master.get("TAG_STYLE_NO")));
		master.put("PRD_MST_YEAR", StringUtil.getString(master.get("SEASON_YEAR")));
		
		master.put("PRD_MST_SEX", mappingBrandToSex(brand));
		master.put("PRD_MST_NFI_INF7", StringUtil.getString(master.get("DELI_DATE")));
		
		
		
		//master.put("", StringUtil.getString(master.get("BRAND")));
		//master.put("", StringUtil.getString(master.get("BRAND_ENAME")));
		//master.put("", StringUtil.getString(master.get("PROD_NATION")));
		//master.put("", StringUtil.getString(master.get("SEASON")));
		
		//DELI_DATE
		master.putAll(getProductCommonData());
	}
	private String mappingBrandToSex(String brand) {
		//제 3의 성별이 나오거나 공통코드를 잘못건드리면 여길보세요
		String CONST_MALE = "363";
		String CONST_FEMALE = "364";
		String CONST_UNISEX = "3633";
		if("P".equals(brand) || "F".equals(brand) || "M".equals(brand) || "Q".equals(brand)) {
			return CONST_MALE;
		}
		else if("B".equals(brand) || "S".equals(brand) || "T".equals(brand) || "V".equals(brand) || "G".equals(brand)) {
			return CONST_FEMALE;
		}
		return CONST_UNISEX;
	}
	private void setCategoryByStyleNo(String styleNo,String PRD_MST_CD) throws Exception {
		String checkData = styleNo.replaceAll("[0-9]", "");
		String sex = mappingBrandToSex(""+checkData.toUpperCase().charAt(0));
		String CMN_COM_IDX = "";
		String type = checkData.substring(checkData.length()-1);
		if(checkData.length()>3) {
			type = checkData.substring(3,4);
		}
		if("363".equals(sex)) {
			if("B".equals(type)) {
				CMN_COM_IDX = "3471";//셔츠
			}
			else if("C".equals(type)) {
				CMN_COM_IDX = "3474";// 가디건
			}
			else if("U".equals(type)) {
				CMN_COM_IDX = "3473";//	니트
			}
			else if("I".equals(type)) {
				CMN_COM_IDX = "3472";//	티셔츠
			}
			else if("F".equals(type)) {
				CMN_COM_IDX = "3475";//	팬츠/데님
			}
			else if("D".equals(type)) {
				CMN_COM_IDX = "3479";//	다운패딩
			}
			else if("E".equals(type)) {
				CMN_COM_IDX = "3481";//	자켓
			}
			else if("G".equals(type)) {
				CMN_COM_IDX = "3480";//	가죽자켓
			}
			else if("H".equals(type)) {
				CMN_COM_IDX = "3483";//	코트
			}
			else if("L".equals(type)) {
				CMN_COM_IDX = "3483";//	코트
			}
			else if("M".equals(type)) {
				CMN_COM_IDX = "3482";//	점퍼
			}
			else if("N".equals(type)) {
				CMN_COM_IDX = "3477";//	트렌치
			}
			else if("J".equals(type)) {
				CMN_COM_IDX = "3485";//	수트자켓
			}
			else if("P".equals(type)) {
				CMN_COM_IDX = "3486";//	수트팬츠
			}
			else if("V".equals(type)) {
				CMN_COM_IDX = "3487";//	수트베스트
			}
			else if("A".equals(type)) {
				CMN_COM_IDX = "3470";//	악세사리
			}
			else if("AT".equals(type)) {
				CMN_COM_IDX = "3489";//	타이
			}
			else if("AG".equals(type)) {
				CMN_COM_IDX = "3490";//	가방
			}
			else if("AP".equals(type)) {
				CMN_COM_IDX = "3488";//	양말
			}
			else if("AL".equals(type)) {
				CMN_COM_IDX = "3492";//	벨트
			}
			else if("AS".equals(type)) {
				CMN_COM_IDX = "3491";//	신발
			}			
		}
		else if("364".equals(sex)) {
			if("B".equals(type)) {
				CMN_COM_IDX = "3440";
			}
			else if("C".equals(type)) {
				CMN_COM_IDX = "3411";
			}
			else if("U".equals(type)) {
				CMN_COM_IDX = "3411";
			}
			else if("I".equals(type)) {
				CMN_COM_IDX = "3524";
			}
			else if("O".equals(type)) {
				CMN_COM_IDX = "3494";
			}
			else if("F".equals(type)) {
				CMN_COM_IDX = "3501";
			}
			else if("S".equals(type)) {
				CMN_COM_IDX = "3504";
			}
    		else if("D".equals(type)) {
				CMN_COM_IDX = "3495";
			}
			else if("E".equals(type)) {
				CMN_COM_IDX = "3497";
			}
    		else if("G".equals(type)) {
				CMN_COM_IDX = "3496";
			}
    		else if("H".equals(type)) {
				CMN_COM_IDX = "3500";
			}
    		else if("L".equals(type)) {
				CMN_COM_IDX = "3500";
			}
    		else if("M".equals(type)) {
				CMN_COM_IDX = "3498";
			}
    		else if("N".equals(type)) {
				CMN_COM_IDX = "3499";
			}
    		else if("J".equals(type)) {
				CMN_COM_IDX = "3731";
			}
    		else if("P".equals(type)) {
				CMN_COM_IDX = "3732";
			}
    		else if("V".equals(type)) {
				CMN_COM_IDX = "3733";
			}
    		else if("A".equals(type)) {
				CMN_COM_IDX = "3395";
			}
			else if("AP".equals(type)) {
				CMN_COM_IDX = "3505";
			}
			else if("AF".equals(type)) {
					CMN_COM_IDX = "3509";
			}
			else if("AS".equals(type)) {
				CMN_COM_IDX = "3507";
			}
			else if("AN".equals(type)) {
				CMN_COM_IDX = "3508";
			}
			else if("AZ".equals(type)) {
				CMN_COM_IDX = "3508";
			}
			else if("AG".equals(type)) {
				CMN_COM_IDX = "3506";
			}
		}
		if(CMN_COM_IDX!=null && !CMN_COM_IDX.isEmpty()) {
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("PRD_MST_CD", PRD_MST_CD);
			param.put("CMN_COM_IDX", CMN_COM_IDX);
			defaultDAO.insert("ProductDisplay.insertProductDisplay", param);
		}
	}
	public void downloadImage(String imageUrl,String prdMstCd,int count) throws Exception {
		int[] size = {84,125,180,250,320,450,500};
		String basePath = new File( servletContext.getRealPath("/nas/cdn/attach")).getAbsolutePath();
		Calendar c = Calendar.getInstance();
		String year = ""+c.get(Calendar.YEAR);
		String month = String.format("%02d", (c.get(Calendar.MONTH)+1));
		String day = String.format("%02d", (c.get(Calendar.DAY_OF_MONTH)));
		int extStartIndex = imageUrl.lastIndexOf('.');
        String ext = imageUrl.substring(extStartIndex,imageUrl.length());
        URL url;
        BufferedImage img = null;
		try {
			url = new URL(imageUrl);
			img = ImageIO.read(url);
		} catch (MalformedURLException e) {
			
		} catch (IOException e) {
			
		}
		if(img==null) {
			imageUrl = imageUrl.replace(ext, ext.toUpperCase());
			try {
				url = new URL(imageUrl);
				img = ImageIO.read(url);
			}
		    catch (MalformedURLException e) {
				
			} catch (IOException e) {
				
			}
			
		}
		if(img!=null) {
        	String destCommon = basePath+"/product/"+year+"/"+month+"/"+day;
        	String attrPath = "/attach/product/"+year+"/"+month+"/"+day+"/"+prdMstCd+"/";
        	File tempDirectory = new File(destCommon+"/"+prdMstCd);
        	if(!tempDirectory.exists()) {
        		tempDirectory.mkdirs();
        	}
        	//File file = new File(tempDirectory.getAbsolutePath()+"/"+prdMstCd+"_"+count+ext);
        	File file = new File(destCommon+"/"+prdMstCd+"/"+prdMstCd+"_"+count+ext);
            try {
				ImageIO.write(img, "jpg", file);
				insertProductImageByFile(file,attrPath,prdMstCd,0,count,0);
				for(int i=0;i<size.length;i++) {
	            	File destFile=new File(destCommon+"/"+prdMstCd+"/"+prdMstCd+"_"+count+"_"+size[i]+ext);           
	            	resize(file,destFile,size[i],size[i],prdMstCd);
	            	insertProductImageByFile(destFile,attrPath,prdMstCd,size[i],count,i+1);
	            }
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
	
	private void insertProductImageByFile(File destFile, String attrPath , String prdMstCd, int size,int count, int i) throws Exception {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("PRD_MST_CD", prdMstCd);
        param.put("PRD_IMG_IDX", count);
        param.put("PRD_IMG_SORT", i);
        param.put("PRD_IMG_ATT_PATH", attrPath);
        param.put("PRD_IMG_SYS_NM", destFile.getName());
        param.put("PRD_IMG_ATT_SIZE", size);
        param.put("PRD_IMG_ORG_NM", destFile.getName());
        param.put("PRD_IMG_URL_PATH", StringUtil.getString(propertiesService.getString("cdn.protocol"))+StringUtil.getString(propertiesService.getString("cdn.domain"))+StringUtil.getString(attrPath)+StringUtil.getString(destFile.getName()));
		defaultDAO.insert("BasicProduct.insertProductImage", param);
	}
	private void resize(File src, File dest, int width,int height,String prdMstCd) {
		try {
			int maxSize = 900;
			String imgFormat = "jpg";
			Image image = ImageIO.read(src);
	        Image resizeImage = image.getScaledInstance(width==0?maxSize:width, height==0?maxSize:height, Image.SCALE_SMOOTH);
	        BufferedImage newImage = new BufferedImage(width==0?maxSize:width, height==0?maxSize:height, BufferedImage.TYPE_INT_RGB);
	        Graphics g = newImage.getGraphics();
	        g.drawImage(resizeImage, 0, 0, null);
	        g.dispose();
			ImageIO.write(newImage, imgFormat, dest);
			
			System.out.println(dest.getAbsolutePath()+" Succuess");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

    /**
     * <pre>
     * 1. MethodName : updateMaster
     * 2. ClassName  : ProductServiceImpl.java
     * 3. Comment    : Master data 수정
     * 4. 작성자       : 이찬희
     * 5. 작성일       : 2020. 6. 16.
     * </pre>
     * 
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
	@Override
    public int updateMaster(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.insert("Product.updateMaster", commandMap);
    }

    @Override
    public void updateOpt(List<Map<String, Object>> masterList) throws Exception
    {
        String prdMstCd = (String) defaultDAO.selectStr("Product.selectProductCd", (Map<String, Object>) masterList.get(0));
        String colorCode = "-1";
        String currentColor = "";
        String sizeCode = "";
        
        defaultDAO.delete("Product.deleteOpt", masterList.get(0));
        
        //color 입력
        for(Map<String, Object> data : masterList)
        {
            data.put("PRD_MST_CD", prdMstCd);
            data.put("C_CODE", Integer.valueOf(colorCode));

            if(!StringUtils.equals(currentColor, (String) data.get("COLOR_CODE")))
            {
                currentColor = (String) data.get("COLOR_CODE");
                colorCode = defaultDAO.selectStr("Product.selectColorCode", data);
                if(StringUtils.isEmpty(colorCode))
                {
                    colorCode = defaultDAO.insertStr("Product.insertColorCode", data);
                }
                data.put("C_CODE", Integer.valueOf(colorCode));
                defaultDAO.insertStr("Product.insertColorOpt", data);
            }
            
            sizeCode = defaultDAO.selectStr("Product.selectSizeOpt", data);
            if(StringUtils.isEmpty(sizeCode))
            {
                sizeCode = defaultDAO.insertStr("Product.insertSizeCode", data);
            }
            data.put("S_CODE", Integer.valueOf(sizeCode));
            defaultDAO.insertStr("Product.insertSizeOpt", data);
        }
    }	
}
