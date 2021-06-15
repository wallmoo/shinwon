package com.market.mall.common.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.market.mall.model.User.ROLEUSER;


@Documented
@Target({ ElementType.TYPE, ElementType.METHOD })
@Inherited
@Retention(RetentionPolicy.RUNTIME)
public @interface AccessLevelUser {
    /**
     * Value.
     *
     * @return the rOLE
     */
	ROLEUSER value() default ROLEUSER.guest;
}
