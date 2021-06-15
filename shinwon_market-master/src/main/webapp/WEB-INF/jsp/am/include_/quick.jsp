<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <div class="holder"><!-- holder -->

            <div id="quick" class="container">

                <div class="wrap modules"><!-- modules -->
                    <ul class="core">
                        <li class="d2 active">
                            <a href="javascript:;" class="d2"><span><c:out value="${sessionAdmin.ADM_MST_ID}" /> 님</span></a>
                            <div class="d3 show"><!-- d3 -->
                                <ul class="d3">
                                    <li class="d3">
                                        <a href="<c:out value="${serverDomain}" />/am/manager/logout.do" class="d3"><span>로그아웃</span></a>
                                    </li>
                                </ul>
                            </div><!-- // d3 -->
                        </li>
                    </ul>
                </div><!-- // modules -->

            </div>

        </div><!-- // holder -->