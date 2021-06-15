package com.market.mall.common.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @PackageName: com.market.mall.common.annotations
 * @FileName : FrontBannerSkip.java
 * @Date : 2015. 10. 8.
 * @프로그램 설명 : 프론트에서 공통으로 가져오는 배너리스트를 불러오지 않도록 처리하는 annotation
 * @author epass_n_11
 */
@Documented
@Target({ ElementType.TYPE, ElementType.METHOD })
@Inherited
@Retention(RetentionPolicy.RUNTIME)
public @interface FrontBannerSkip {

}
