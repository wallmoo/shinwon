$.params.tree = {
    "child": [{
        "name": "대시보드",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/main/dashboardMain.do"
    }, {
        "child": [{
            "name": "회원관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/member/infoMemberList.do"
        }, {
            "name": "휴면회원관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/member/restMemberList.do"
        }, {
            "name": "탈퇴회원관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/member/secessionMemberList.do"
        }],
        "name": "회원관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/member/infoMemberList.do"
    }, {
        "child": [{
            "name": "전시카테고리관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/categoryProductList.do"
        }, {
            "name": "상품관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/basicProductList.do"
        }, {
            "name": "상품고시관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/productNotificationInfoList.do"
        }, {
            "name": "입점업체 승인요청",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/vendorApprovalList.do"
        }, {
            "name": "입점업체 상품변경요청",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/vendorProductChangeList.do"
        }, {
            "name": "일괄업로드",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/productUploadList.do"
        }, {
            "name": "사은품관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/giftList.do"
        }, {
            "name": "견적관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/estimateManagementList.do"
        }, {
            "name": "스펙관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/product/specManagementList.do"
        }],
        "name": "상품관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/product/basicProductList.do"
    }, {
        "child": [{
            "name": "전체주문",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderList.do?searchYn=Y"
        }, {
            "name": "입금대기",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderPayReadyList.do?searchYn=Y"
        }, {
            "name": "결제완료",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderPayList.do?searchYn=Y"
        }, {
            "name": "배송관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderSendList.do?searchYn=Y"
        }, {
            "name": "구매확정",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderFixList.do?searchYn=Y"
        }, {
            "name": "취소관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderCancelList.do?searchYn=Y"
        }, {
            "name": "교환관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderSwapList.do?searchYn=Y"
        }, {
            "name": "반품관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderBackList.do?searchYn=Y"
        }, {
            "name": "환불관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderRefundList.do?searchYn=Y"
        }, {
            "name": "세금계산서 신청관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/taxIvc/taxIvcList.do"
        }, {
            "name": "입점업체취소요청",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderScmCancelList.do?searchYn=Y"
        }, {
            "name": "오픈마켓 주문조회",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderOpenMarketList.do?searchYn=Y"
        }, {
            "name": "입점업체 주문조회(통합)",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderScmOrderList.do?searchYn=Y"
        }, {
            "name": "입점업체 주문조회(SCM) ",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderOnlyScmOrderList.do?searchYn=Y"
        }, {
            "name": "결제오류조회",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderError/orderErrorList.do"
        }, {
            "name": "출고관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderDeliveryList.do"
        }, {
            "name": "O2O 주문조회",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderCleanKingList.do"
        }],
        "name": "주문관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/order/orderList.do"
    }, {
        "child": [{
            "name": "전시배너관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/bannerDisplayView.do"
        }, {
            "name": "전시상품관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/productDisplayView.do"
        }, {
            "name": "팝업관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/popupList.do"
        }, {
            "name": "공통전시",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/vendorDisplayView.do"
        }, {
            "name": "테마전시배너관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/themeBannerView.do"
        }, {
            "name": "테마전시상품관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/themeProductView.do"
        }, {
            "name": "브랜드공지관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/bannerProductBrandNoticeList.do"
        }, {
            "name": "MD공지관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/bannerProductMdNoticeList.do"
        }, {
            "name": "광고관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/display/adList.do"
        }],
        "name": "전시관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/display/privateShopList.do"
    }, {
        "child": [{
            "name": "기획전관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/planList.do"
        }, {
            "name": "이벤트관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/eventList.do"
        }, {
            "name": "고객체험단",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/kingerList.do"
        }, {
            "name": "원데이특가",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/oneDayList.do"
        }, {
            "name": "게릴라 세일",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/timeSaleList.do"
        }, {
            "child": [{
                "name": "쿠폰목록",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/onlineCouponList.do"
            }, {
                "name": "쿠폰생성",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/onlineCouponForm.do"
            }, {
                "name": "쿠폰발행내역",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/onlineCouponIssueList.do"
            }],
            "name": "쿠폰",
            "src": "http://bo.marketplanta.epasscni.com:8080/"
        }, {
            "child": [{
                "name": "포인트 내역조회",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/pointDetail.do"
            }, {
                "name": "포인트 리스트",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/pointList.do"
            }, {
                "name": "포인트 적립/차감",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/pointForm.do"
            }],
            "name": "포인트",
            "src": "http://bo.marketplanta.epasscni.com:8080/"
        }, {
            "name": "카드행사관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/cardEventList.do"
        }, {
            "name": "카드할부관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/cardDivList.do"
        }, {
            "name": "채널관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/channelView.do"
        }],
        "name": "프로모션관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/marketing/promotionList.do"
    }, {
        "child": [{
            "name": "게시판 생성",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/createboard/createBoardList.do"
        }],
        "name": "게시판 관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/createboard/createBoardList.do"
    }, {
        "child": [{
            "name": "공지사항",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/noticeBoardList.do"
        }, {
            "name": "FAQ",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/faqBoardList.do"
        }, {
            "name": "상품후기",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/commentBoardList.do"
        }, {
            "name": "상품Q&A",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/productInquiryList.do"
        }, {
            "name": "1:1 문의",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/inquiryList.do"
        }, {
            "name": "약관관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/board/agreementBoardList.do"
        }],
        "name": "고객센터",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/board/noticeBoardList.do"
    }, {
        "child": [{
            "name": "로고목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/logo/logoList.do"
        }],
        "name": "로고관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/logo/logoList.do"
    }, {
        "child": [{
            "name": "SNS관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/sns/snsManagerList.do"
        }],
        "name": "SNS관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/sns/snsManagerList.do"
    }, {
        "child": [{
            "name": "회원통계",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/stats/memberJoinDateList.do"
        }, {
            "name": "매출통계",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/stats/orderStatsSalesList.do"
        }, {
            "name": "매장별통계",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/stats/orderMallStatsShopList.do"
        }, {
            "name": "채널별매출",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/stats/orderChannelList.do"
        }],
        "name": "통계",
        "src": "http://bo.marketplanta.epasscni.com:8080/"
    }, {
        "child": [{
            "name": "입점업체공지사항",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorNoticeList.do"
        }, {
            "name": "입점업체문의사항",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorInqList.do"
        }, {
            "name": "입점상담 업체관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorLoginManagerList.do"
        }, {
            "name": "입점상담 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorCounselList.do"
        }, {
            "name": "입점신청서 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorReqList.do"
        }],
        "name": "입점업체관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/vendor/vendorNoticeList.do"
    }, {
        "child": [{
            "name": "정보수정",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/info/managerInfoEdit.do"
        }],
        "name": "관리자정보수정",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/info/managerInfoEdit.do"
    }, {
        "child": [{
            "name": "관리자 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/basicManagerList.do"
        }, {
            "name": "권한 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/authManagerList.do"
        }, {
            "name": "메뉴 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/menuManagerList.do"
        }, {
            "name": "입점업체정보 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/vendorManagerList.do"
        }, {
            "name": "브랜드 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/brandManagerList.do"
        }, {
            "name": "제조사 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/makerManagerList.do"
        }, {
            "name": "배송업체 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/delivCompanyList.do"
        }, {
            "name": "차단단어 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/banWordManagerList.do"
        }, {
            "name": "공통코드관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/commonCodeManagerList.do"
        }, {
            "name": "인기 검색어 관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/site/popularSearchWordList.do"
        }],
        "name": "시스템 관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/site/basicManagerList.do"
    }, {
        "child": [{
            "child": [{
                "name": "정산목록",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/accounting/companyAccountingList.do"
            }, {
                "name": "업체별상세",
                "src": "http://bo.marketplanta.epasscni.com:8080/am/accounting/companyAccountingDetail.do"
            }],
            "name": "업체정산",
            "src": "http://bo.marketplanta.epasscni.com:8080/"
        }],
        "name": "정산",
        "src": "http://bo.marketplanta.epasscni.com:8080/"
    }, {
        "child": [{
            "name": "APP 푸시관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/app/appPushManageList.do"
        }, {
            "name": "APP 버전관리",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/app/appVersionManageList.do"
        }],
        "name": "APP 관리",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/app/appPushManageList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }, {
        "child": [{
            "name": "타겟목록",
            "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
        }],
        "name": "타겟관리2",
        "src": "http://bo.marketplanta.epasscni.com:8080/am/target/targetList.do"
    }]
};
