package com.market.mall.pc.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.epasscni.util.StringUtil;
import com.market.mall.model.User;

/**
 * @PackageName: com.market.mall.pc.cart.service
 * @FileName : ProductService.java
 * @Date : 2014. 7. 15.
 * @프로그램 설명 : 상품 상세화면 관련 업무를 처리하는 Service Interface
 * @author 이미정
 */
public interface ProductService {
	
     public int insertPrw(Map<String, Object> commandMap) throws Exception;
    public Map<String, Object> selectProductBannerInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductCategoryInfo
   	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품카테고리 > 카테고리명
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 14.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
	public Map<String, Object> selectProductCategoryInfo(Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectRegularStore
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 로그인한 사용자의 선호매장 정보 
   	 * 4. 작성자       : DEV_SONGJEONGEUN
   	 * 5. 작성일       : 2015. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectRegularStore(Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : selectProduct
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  정보
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectProduct(Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectTogetherProduct(Map<String, Object> commandMap) throws Exception;
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
    public int selectProductExist(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductOptionList
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  상품옵션
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectProductOptionList(Map<String, Object> commandMap) throws Exception;

    /**
	 * <pre>
	 * 1. MethodName : selectProductImageList
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  상품이미지
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 15.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectProductImageList(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectProductImageOneSizeList
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세 사이즈 고정값에 대한 이미지 리스트 
   	 * 4. 작성자       : DEV_SONGJEONGEUN
   	 * 5. 작성일       : 2015. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectProductImageOneSizeList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductRelatedList
   	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  연관상품목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 16.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductRelatedList(Map<String, Object> commandMap) throws Exception;
    
 
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductActivityList
   	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세 Activity 목록
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 18.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductActivityList(Map<String, Object> commandMap) throws Exception;

    /**
   	 * <pre>
   	 * 1. MethodName : selectPlanOngoingList
   	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 진행중인 기획전 목록 
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 18.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectPlanOngoingList(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectNotiGuideInfo
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  고시정보
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectNotiGuideInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectShippingGuideInfo
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  배송/반품/교환안내
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectShippingGuideInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectAsGuideInfo
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세   AS 안내
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectAsGuideInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectWashGuideInfo
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세 세탁 및 취급방법 안내 
   	 * 4. 작성자       : jesong
   	 * 5. 작성일       : 2015. 5. 19.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public Map<String, Object> selectWashGuideInfo(Map<String, Object> commandMap) throws Exception;

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
    public Map<String, Object> selectProductCoupon(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductTechInfoList
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   상품기술정보
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductTechInfoList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductPriceInfo
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   미리계산하기
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public Map<String, Object> selectProductPriceInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductCouponList
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   상품 적용 가능 쿠폰 목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectProductCouponList(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductReputation
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   전체 평점
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 17.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public Map<String, Object> selectProductReputation(Map<String, Object> commandMap) throws Exception;
    
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectProductRevStar
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세 - 색상/사이즈 만족도 
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 19.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public Map<String, Object> selectProductRevStar(Map<String, Object> commandMap) throws Exception;
    
    /**
   	 * <pre>
   	 * 1. MethodName : selectReputationList
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   상품평 목록
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 18.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public List<Map<String, Object>> selectReputationList(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectReputationList
	 * 2. ClassName  : ProductService.java
	 * 3. Comment    : 상품상세   QNA 목록 개수
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 18.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectQnaListCount(Map<String, Object> commandMap) throws Exception ;

	/**
	 * <pre>
	 * 1. MethodName : selectReputationList
	 * 2. ClassName  : ProductService.java
	 * 3. Comment    : 상품상세   QNA 목록 
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 18.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectQnaList( Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : selectQnaInfo
	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품 QnA 상세 
     * 4. 작성자       : DEV_SONGJEONGEUN
     * 5. 작성일       : 2015. 7. 20.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectQnaInfo( Map<String, Object> commandMap) throws Exception;
	public Map<String, Object> selectQnaSimpleInfo( Map<String, Object> commandMap) throws Exception;
	
    /**
    * <pre>
    * 1. MethodName : insertReputation
    * 2. ClassName  : ProductService.java
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
    public int insertReputation (MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
   	 * <pre>
   	 * 1. MethodName : selectProductSizeGuide
   	 * 2. ClassName  : ProductService.java
     * 3. Comment    : 상품상세   사이즈 조견표
     * 4. 작성자       : 이미정
     * 5. 작성일       : 2014. 7. 21.
   	 * </pre>
   	 *
   	 * @param commandMap
   	 * @return
   	 * @throws Exception
   	 */
    public Map<String, Object> selectProductSizeGuide(Map<String, Object> commandMap) throws Exception;
    
    
    /**
	 * <pre>
	 * 1. MethodName : selectCategoryPath
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  상단 카테고리 경로
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
    public List<Map<String, Object>> selectCategoryPath(Map<String, Object> commandMap) throws Exception;
    
    /**
	 * <pre>
	 * 1. MethodName : selectBrandCategoryPath
	 * 2. ClassName  : ProductService.java
   	 * 3. Comment    : 상품상세  상단 카테고리 경로, 이전 화면 정보를 찾을 수 없는 경우.
   	 * 4. 작성자       : 이미정
   	 * 5. 작성일       : 2014. 7. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectBrandCategoryPath(Map<String, Object> commandMap) throws Exception;
	
	/**
     * <pre>
     * 1. MethodName : insertQna
     * 2. ClassName  : ProductService.java
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
	public int insertQna (Map<String, Object> commandMap) throws Exception;
	
	/**
	 * <pre>
	 * 1. MethodName : deleteQna
	 * 2. ClassName  : ProductService.java
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
	public int deleteQna(Map<String, Object> commandMap) throws Exception;
	
	/**
     * <pre>
     * 1. MethodName : updateQna
     * 2. ClassName  : ProductService.java
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
	public int updateQna (Map<String, Object> commandMap) throws Exception;
	
	
	/**
	 * <pre>
	 * 1. MethodName : updateProductReadCnt
	 * 2. ClassName  : ProductService.java
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
	public int updateProductReadCnt(Map<String, Object> commandMap) throws Exception; 
	
	
    
    /**
    * <pre>
    * 1. MethodName : selectProductOptionMstList
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품에 속한 옵션 마스터 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductOptionMstList(Map<String, Object> commandMap) throws Exception;
    

  
    /**
    * <pre>
    * 1. MethodName : selectProductOptionDtlList
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품에 속한 옵션 상세 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductOptionDtlList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductPlanList
     * 2. ClassName : ProductListService.java
     * 3. Comment : 상품에 속한 기획전 리스트
     * 4. 작성자 : DEV_KIMMINHO
     * 5. 작성일 : 2015. 12. 16.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String, Object>> selectProductPlanList(Map<String, Object> commandMap) throws Exception;
     
     /**
    * <pre>
    * 1. MethodName : selectProductOptionMstEstCount
    * 2. ClassName : ProductService.java
    * 3. Comment : 필수옵션 등록 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectProductOptionMstEstCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductNewListList
    * 2. ClassName : ProductService.java
    * 3. Comment : E메거진 상퓸뉴스
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 23.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductEmagazineList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductNfiInfoList
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품고시정보
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductNfiInfoList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductRevListCount
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품평 갯수
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 24.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectReputationListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductKingerList
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품 고객체험단 리뷰 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 28.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductKingerList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductLastCategoryPath
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품에 속한 마지막 카테고리
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2015. 12. 30.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductLastCategoryPath(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductTimeSaleInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 타임세일 내역
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductTimeSaleInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMainTimeSaleInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 타임세일 메인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMainTimeSaleInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectMainOneDayInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 원데이특가 메인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 3. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectMainOneDayInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductEmagazineRevList
    * 2. ClassName : ProductService.java
    * 3. Comment : 상품 E메거진 상품리뷰
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 5.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectProductEmagazineRevList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductOneDayInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 원데이특가 내역
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 6.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductOneDayInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSearchProductCount
    * 2. ClassName : ProductService.java
    * 3. Comment : 팝업 상품검색 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectSearchProductCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectSearchProductList
    * 2. ClassName : ProductService.java
    * 3. Comment : 팝업 상품검색 리스트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 8.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectSearchProductList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectOptionDetailInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 겟잇나우 매장검색 - 상품에 대한 옵션 상세
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 13.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectOptionDetailInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectErpShpCodeList
    * 2. ClassName : ProductService.java
    * 3. Comment : 옵션 기간계 코드로 재고가 있는 erp매장코드 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 13.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectErpShpCodeList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectErpDirShpCodeList
    * 2. ClassName : ProductService.java
    * 3. Comment : 옵션 기간계 코드 재고 유무 확인
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 18.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectErpShpCodeCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectStoreList
    * 2. ClassName : ProductService.java
    * 3. Comment : 매장코드로 지점 불러오기
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectStoreList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectStoreCount
    * 2. ClassName : ProductService.java
    * 3. Comment : 매장코드로 지점 카운트
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 14.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectStoreCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectGetItNowShopInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 매장 받는 시간 정보
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 15.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectGetItNowShopInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertEstProduct
    * 2. ClassName : ProductService.java
    * 3. Comment : 가격흥정 등록
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 1. 19.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int insertEstProduct (Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectStoreInfo
    * 2. ClassName : ProductService.java
    * 3. Comment : 픽업매장 상세정보
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 2. 22.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectStoreInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectProductLngDivCardNm
    * 2. ClassName : ProductService.java
    * 3. Comment : 장기할부 안내 
    * 4. 작성자 : DEV_KIMMINHO
    * 5. 작성일 : 2016. 4. 1.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectProductLngDivCardNm(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectProductOptionMustList(Map<String, Object> commandMap) throws Exception;
    
    //추가혜택 정보
    public List<Map<String, Object>> selectBenefitList(Map<String, Object> commandMap) throws Exception;
    
    //마이핏 정보
    public List<Map<String,Object>> selectMyFitInfo (Map<String, Object> commandMap) throws Exception;
    
    public String selectMyFitSampleImage (Map<String, Object> commandMap) throws Exception;
    
    public int insertMyFitInfo (Map<String, Object> commandMap) throws Exception;
    
    public int updateMyFitInfo (Map<String, Object> commandMap) throws Exception;
    
    //포토리뷰 목록 갯수
    public int selectPhotoRevListCount (Map<String, Object> commandMap) throws Exception;
    
    //포토리뷰 목록
    public List<Map<String,Object>> selectPhotoRevList (Map<String, Object> commandMap) throws Exception;

    public List<Map<String,Object>> selectPhotoRevLimitList (Map<String, Object> commandMap) throws Exception;
    public List<Map<String,Object>> selectPhotoRevLimitAllList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectProductMustOptionList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String,Object>> selectProductAddOptionList (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectProductGroupInfo (Map<String, Object> commandMap) throws Exception;
    public int selectProductRevListCount(Map<String, Object> commandMap) throws Exception;
	public List<Map<String, Object>> selectProductRevList(Map<String, Object> commandMap) throws Exception;
	
	public void deleteProductRevInfo(Map<String, Object> commandMap) throws Exception;
	
	public int insertProductByFile(CommonsMultipartFile file) throws Exception;

	public void downloadImage(String imageUrl,String prdMstCd,int count) throws Exception;

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
    int updateMaster(Map<String, Object> commandMap) throws Exception;

    public void updateOpt(List<Map<String, Object>> masterList) throws Exception;
}
