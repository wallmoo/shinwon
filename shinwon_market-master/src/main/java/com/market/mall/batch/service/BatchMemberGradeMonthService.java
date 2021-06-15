package com.market.mall.batch.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * 
 * @PackageName: com.market.mall.batch.service
 * @FileName : BatchMemberGradeMonthService.java
 * @Date : 2016. 1. 20.
 * @프로그램 설명 : 개인회원 회원등급 변경
 * @author : DEV_LEEKWANGWOON
 */
public interface BatchMemberGradeMonthService {
	
	/**
	 * <pre>
	 * 1. MethodName : updateMemberGradeMonth
	 * 2. ClassName  : BatchMemberGradeMonthService.java
	 * 3. Comment    : 개인회원 등급 변경처리
	 * 4. 작성자       : DEV_LEEKWANGWOON
	 * 5. 작성일       : 2016. 1. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> updateMemberGradeMonth(Map<String, Object> commandMap) throws Exception ;	
	
}
