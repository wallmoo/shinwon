package com.market.mall.am.marketing.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @PackageName: com.market.mall.am.marketing.service
 * @FileName : EcouponService.java
 * @Date :
 * @프로그램 설명 : 관리자 > 프로모션 > 쿠폰관리를 처리하는 Service Interface
 * @author kanghk
 */
public interface EcouponService {

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponListCount
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectOnlineCouponListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectOnlineCouponList(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponNO
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOnlineCouponNO(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponNm
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOnlineCouponNm(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : insertOnlineCoupon
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 등록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertOnlineCoupon(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponListInfo
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 상세정보 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectOnlineCouponListInfo(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : updateOnlineCoupon
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 수정 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateOnlineCoupon(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : updateOnlineCoupon
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 사용 가능 상태 수정 
	 * 4. 작성자       : 이원중
	 * 5. 작성일       : 2020-06-09
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateOnlineCouponStatus(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectPlanList
	 * 2. ClassName : GiftService.java
	 * 3. Comment : 기획전 목록 가져오기 
	 * 4. 작성자 : 
	 * 5. 작성일 :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectPlanList(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueDetCount
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int onlineCouponIssueDetCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueDetList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponIssueDetList(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditY(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditY_D(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditY_C(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditN(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditN_B(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditN_C(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOnlineCouponList
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponListEditN_D(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : insertOnlineCouponIssue
	 * 2. ClassName  : EcouponService.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠퐄 관리 등록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertOnlineCouponIssue(MultipartHttpServletRequest request, Map<String, Object> commandMap)
			throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOfflineCouponPopupCount
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 제휴쿠폰 팝업 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectOfflineCouponPopupCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectOfflineCouponPopupList
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 제휴쿠폰 팝업 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectOfflineCouponPopupList(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectMemberCouponListCount
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 갯수 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectMemberCouponListCount(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectMemberCouponList
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectMemberCouponList(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : selectMemberCouponSum
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectMemberCouponSum(Map<String, Object> commandMap) throws Exception;

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueDetDwnList
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 발행목록 엑셀 다운로드 목록 
	 * 4. 작성자       : 이원중
	 * 5. 작성일       : 2020-06-11
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> onlineCouponIssueDetDwnList(Map<String, Object> commandMap);

	public String selectOnlineCouponGbnNm(Map<String, Object> map);

	/**
	 * <pre>
	 * 1. MethodName : selectScheduleDetail
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 프로모션 관리 > > 쿠폰 상세조회 - 타임쿠폰 등록 내역 조회
	 * 4. 작성자       : 이원중
	 * 5. 작성일       : 2020-06-13
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectScheduleDetail(Map<String, Object> commandMap);
	
	/**
	 * <pre>
	 * 1. MethodName : selectScheduleDetail
	 * 2. ClassName  : EcouponServiceImpl.java
	 * 3. Comment    : 관리자 > 프로모션 관리 > 쿠폰발행내역 > 관리자 발급 > 엑셀 업로드 체크
	 * 4. 작성자       : 이원중
	 * 5. 작성일       : 2020-06-13
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> issueUploadCheck(Map<String, Object> commandMap);

}
