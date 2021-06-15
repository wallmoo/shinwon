<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://127.0.0.1:8080/util/tags" prefix="ui" %>
<%@ taglib prefix="un" uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<un:useConstants var="Code" className="com.market.mall.model.Code" />
<un:useConstants var="RESELLER_BAN_CODE" className="com.market.mall.common.constants.RESELLER_BAN_CODE" />
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit" %>