package com.market.mall.am.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @PackageName: com.market.mall.am.member.service
 * @FileName : InfoMemberService.java
 * @Date : 2014. 6. 20.
 * @프로그램 설명 : 관리자 > 회원관리 > 회원정보관리를 처리하는 Service Interface
 * @author LJH
 */
public interface InfoMemberService {

    /**
     * 
     * <pre>
     * 1. MethodName	: selectInfoMemberListCount
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 목록 갯수 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:52:48
     * </pre>
     *
     * @return int
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInfoMemberListCount (Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectInfoMemberList
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:53:09
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectInfoMemberList (Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectMemberGradeList
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원관리 목록 > 검색 조건 - 회원등급 목록
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public List<Map<String,Object>> selectMemberGradeList (Map<String,Object> commandMap) throws Exception;
     
     /**
      * <pre>
      * 1. MethodName : insertSearchHistory
      * 2. ClassName : InfoMemberService.java
      * 3. Comment : 관리자 > 회원관리 > 회원현황 목록에서 search클릭 시 history 저장
      * 4. 작성자 : DEV_KIMSOYOUNG
      * 5. 작성일 : 2015. 4. 28.
      * </pre>
      *
      * @param commandMap
      * @throws Exception
      */
      public void insertSearchHistory(HttpServletRequest request,Map<String, Object> commandMap) throws Exception;
      
      /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberInfo
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 보기
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:54:06
     * </pre>
     *
     * @return Map<String,Object>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMemberInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCompMemberInfo
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 기업회원상세정보
     * 4. 작성자       : DEV_KIMSOYOUNG
     * 5. 작성일       : 2015. 10. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
     public Map<String,Object> selectCompMemberInfo (Map<String,Object> commandMap) throws Exception;
     
    /**
    * <pre>
    * 1. MethodName : updateInfoMember
    * 2. ClassName : InfoMemberService.java
    * 3. Comment : 관리자 > 회원관리 > 회원정보 상세 > 회원정보 수정
    * 4. 작성자 : DEV_KIMSOYOUNG
    * 5. 작성일 : 2015. 4. 9.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String,Object> updateInfoMember(HttpServletRequest request, Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : insertErpError
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 회원정보 수정, 직권탈퇴 관련 ERP 프로시져 에러시
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 2. 3.
    * </pre>
    *
    * @param commandMap
    * @throws Exception
    */
    public void insertErpError (Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : updateMemberTempPw
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원(기업,개인,간편)상세 > 임시 비밀번호 발송
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2015. 11. 2.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int updateMemberTempPw(HttpServletRequest request,Map<String,Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectCheckOrderCount
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원상세 > 직권탈퇴 > 현재 주문이 있는지 체크
    * 4. 작성자       : DEV_KIMSOYOUNG
    * 5. 작성일       : 2016. 1. 25.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectCheckOrderCount (Map<String,Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectMemberName
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 각 페이지 상단 회원 정보
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectMemberName(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectMemberCouponListCount
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 쿠폰보유내역 목록 갯수 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberCouponListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectMemberUsableCouponCount
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 사용가능한 보유 쿠폰 갯수
     * 4. 작성자       : jesong
     * 5. 작성일       : 2015. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberUsableCouponCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectMemberCouponList
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 쿠폰보유내역 목록
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMemberCouponList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectMemberCouponUseListCount
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 쿠폰사용내역 목록 갯수 
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberCouponUseListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectMemberCouponUseList
     * 2. ClassName  : InfoMemberService.java
     * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 쿠폰사용내역 목록
     * 4. 작성자       : ejpark
     * 5. 작성일       : 2014. 4. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMemberCouponUseList(Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryListCount
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 목록 갯수 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberInquiryListCount(Map<String, Object> commandMap) throws Exception;

    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryList
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 목록 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectInfoMemberInquiryList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberInquiryInfo
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 1:1문의 내역 상세정보 
    * 4. 작성자       : jangsin
    * 5. 작성일       : 2014. 4. 10.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public Map<String, Object> selectInfoMemberInquiryInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * 
     * <pre>
     * 1. MethodName	: selectMemberPointListCount
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 포인트 거래 내역  갯수 
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 5. 7. 
     * </pre>
     *
     * @return int
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectMemberPointListCount(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName	: selectMemberPointList
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보 상세 > 포인트 거래 내역 
     * 4. 작성자			: DEV_SONGJEONGEUN
     * 5. 작성일			: 2015. 5. 7. 
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMemberPointList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberCartListCount
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 장바구니 내역 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberCartListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberCartList
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 장바구니 내역
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectInfoMemberCartList(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberKeepingListCount
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 키핑상품 내역 개수
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public int selectInfoMemberKeepingListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
    * <pre>
    * 1. MethodName : selectInfoMemberKeepingList
    * 2. ClassName  : InfoMemberService.java
    * 3. Comment    : 관리자 > 회원관리 > 회원정보 상세 > 키핑상품 내역
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2016. 1. 26.
    * </pre>
    *
    * @param commandMap
    * @return
    * @throws Exception
    */
    public List<Map<String, Object>> selectInfoMemberKeepingList(Map<String, Object> commandMap) throws Exception;

	public int selectInfoMemberLikeProductListCount(Map<String, Object> commandMap) throws Exception;

	public List<Map<String, Object>> selectInfoMemberLikeProductList(Map<String, Object> commandMap) throws Exception;

	public List<Map<String, Object>> infoExecutivesList(HttpServletRequest request, Map<String, Object> commandMap)throws Exception;

	public int infoExecutivesCount(Map<String, Object> commandMap)throws Exception;

	public int changeNormalMember(Map<String, Object> commandMap)throws Exception;

	public int changeEmployeeMember(Map<String, Object> commandMap)throws Exception;
	
	public Map<String,Object> selectMemberDeliveryInfo(Map<String, Object> commandMap)throws Exception;
	public List<Map<String,Object>> selectMemberDeliveryList(Map<String, Object> commandMap)throws Exception;


    /**
     * 
     * <pre>
     * 1. MethodName	: selectInfoMemberList
     * 2. ClassName		: InfoMemberService.java
     * 3. Comment    	: 관리자 > 회원관리 > 회원정보관리 목록 
     * 4. 작성자			: LeeJongHo
     * 5. 작성일			: 2014. 6. 20. 오후 1:53:09  
     * </pre>
     *
     * @return List<Map<String,Object>>
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectInfoMemberListExcel (Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectReviewEvent (Map<String, Object> commandMap) throws Exception;	    
    
    public Map<String,Object> selectMemberPrivilegeInfo (Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectMemberPrivilegeList (Map<String,Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectInfoExecutivesListExcel(Map<String, Object> commandMap) throws Exception;

	public List<Map<String, Object>> selectMemberEshop(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;  
     
	public int selectMemberOOTDCount(Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectMemberOOTDList(Map<String, Object> commandMap) throws Exception;
    
    
    public int selectMemberCommentListCount(Map<String, Object> commandMap) throws Exception;
    public List<Map<String, Object>> selectMemberCommentList(Map<String, Object> commandMap) throws Exception;
    
    public List<Map<String, Object>> selectSellerList(Map<String, Object> commandMap) throws Exception;
    
    //포인트탭 회원 정보 : 일반회원인지 임직원인지 구분
	public Map<String, Object> selectMemberGBNInfo(Map<String, Object> commandMap) throws Exception;    
    
    
}
