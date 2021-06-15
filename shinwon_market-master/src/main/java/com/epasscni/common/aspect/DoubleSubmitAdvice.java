package com.epasscni.common.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;

import com.epasscni.common.exception.DoubleSubmitException;
import com.epasscni.util.EgovDoubleSubmitHelper;

@Aspect
public class DoubleSubmitAdvice {

	public void checkDouble(JoinPoint joinPoint) throws DoubleSubmitException {

		if(!EgovDoubleSubmitHelper.checkAndSaveToken()) 
        {
			throw new DoubleSubmitException("중복 등록 방지");
        }
	}
}
