package com.market.mall.ifcomm.pg;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.StringUtil;
import com.kicc.EasyPayClient;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.FrontBannerSkip;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.util.TestLoginSession;
import com.epasscni.viewer.JSON;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.lgcns.module.lite.CnsPayWebConnector;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * @PackageName: com.market.mall.ifcomm.pg
 * @FileName : PaymentContoller.java
 * @Date : 2016. 8. 18.
 * @프로그램 설명 : 결제를 처리하는 Controller Class
 * @author DEV_KIMHYOJOONG
 */
@Controller
public class PaymentContoller {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name = "propertiesService") 
    protected EgovPropertyService propertiesService;
    
    @Resource (name="paymentService") 
    PaymentService paymentService;
    
    @Resource(name="orderService") private OrderService orderService;
    
    /**
     * <pre>
     * 1. MethodName : ajaxPaymentGetPgApprovalValue
     * 2. ClassName  : PaymentController.java
     * 3. Comment    : 프론트 > 주문/결제 > 결제요청 value 생성 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2015. 6. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    /**
     * @api {POST} /cart/payment/ajaxPaymentGetPgApprovalValue.do
     * @apiVersion 0.1.0
     * @apiName 결제
     * @apiGroup 장바구니
     *
     * @apiParam {String} ORD_MST_CD 주문번호
     * @apiSuccess {String} setValue 인풋 태그 String 뭉치
     * @apiSuccess {String} platForm  결제플랫폼(Test or Service) 서비스일 경우 주의 하세요 돈 빠집니다
     * @apiSuccess {String} windowType 결제 진행타입 iframe or submit
     *
     * @apiSuccessExample Success-Response:
     *     HTTP/1.1 200 OK
     *     {
	 *		    
     *			"setValue": "<input type='hidden' name='LGD_TAXFREEAMOUNT' id='LGD_TAXFREEAMOUNT' value='0' readonly><input type='hidden' name='LGD_MTRANSFERAUTOAPPYN' id='LGD_MTRANSFERAUTOAPPYN' value='' readonly><input type='hidden' name='LGD_MTRANSFERCANCELURL' id='LGD_MTRANSFERCANCELURL' value='' readonly><input type='hidden' name='LGD_ENCODING_NOTEURL' id='LGD_ENCODING_NOTEURL' value='UTF-8' readonly><input type='hidden' name='LGD_PAYKEY' id='LGD_PAYKEY' value='' readonly><input type='hidden' name='CART_PAYMENT_DC_MILEAGE' id='CART_PAYMENT_DC_MILEAGE' value='0' readonly><input type='hidden' name='LGD_BUYEREMAIL' id='LGD_BUYEREMAIL' value='@' readonly><input type='hidden' name='LGD_WINDOW_TYPE' id='LGD_WINDOW_TYPE' value='iframe' readonly><input type='hidden' name='LGD_RETURNURL' id='LGD_RETURNURL' value='http://bo.localhost:8080/pc/cart/paymentReqReturnPopup.do' readonly><input type='hidden' name='LGD_RESPMSG' id='LGD_RESPMSG' value='' readonly><input type='hidden' name='LGD_KVPMISPWAPURL' id='LGD_KVPMISPWAPURL' value='' readonly><input type='hidden' name='LGD_CUSTOM_SWITCHINGTYPE' id='LGD_CUSTOM_SWITCHINGTYPE' value='IFRAME' readonly><input type='hidden' name='LGD_CASNOTEURL' id='LGD_CASNOTEURL' value='http://bo.localhost:8080/pc/cart/paymentNoteRes.do' readonly><input type='hidden' name='LGD_HASHDATA' id='LGD_HASHDATA' value='52c9f98ce9d9caf4a7ac5d66c6552cb1' readonly><input type='hidden' name='CART_PAYMENT_DC_POINT' id='CART_PAYMENT_DC_POINT' value='0' readonly><input type='hidden' name='CART_PAYMENT_DC_COUPON' id='CART_PAYMENT_DC_COUPON' value='0' readonly><input type='hidden' name='LGD_MTRANSFERWAPURL' id='LGD_MTRANSFERWAPURL' value='' readonly><input type='hidden' name='LGD_ENCODING' id='LGD_ENCODING' value='UTF-8' readonly><input type='hidden' name='LGD_CUSTOM_PROCESSTYPE' id='LGD_CUSTOM_PROCESSTYPE' value='TWOTR' readonly><input type='hidden' name='CST_MID' id='CST_MID' value='alphamall1' readonly><input type='hidden' name='LGD_VERSION' id='LGD_VERSION' value='JSP_SmartXPay_1.0' readonly><input type='hidden' name='LGD_KVPMISPAUTOAPPYN' id='LGD_KVPMISPAUTOAPPYN' value='' readonly><input type='hidden' name='LGD_CUSTOM_USABLEPAY' id='LGD_CUSTOM_USABLEPAY' value='SC0010' readonly><input type='hidden' name='CST_PLATFORM' id='CST_PLATFORM' value='test' readonly><input type='hidden' name='CART_PAYMENT_DC_CASHBAG' id='CART_PAYMENT_DC_CASHBAG' value='0' readonly><input type='hidden' name='LGD_TIMESTAMP' id='LGD_TIMESTAMP' value='20200417210823' readonly><input type='hidden' name='LGD_KVPMISPCANCELURL' id='LGD_KVPMISPCANCELURL' value='' readonly><input type='hidden' name='LGD_BUYER' id='LGD_BUYER' value='' readonly><input type='hidden' name='LGD_PRODUCTINFO' id='LGD_PRODUCTINFO' value=' 바닐라코 화이트닝 세럼' readonly><input type='hidden' name='LGD_WINDOW_VER' id='LGD_WINDOW_VER' value='2.5' readonly><input type='hidden' name='LGD_CUSTOM_SKIN' id='LGD_CUSTOM_SKIN' value='red' readonly><input type='hidden' name='LGD_CASHRECEIPTYN' id='LGD_CASHRECEIPTYN' value='Y' readonly><input type='hidden' name='LGD_ENCODING_RETURNURL' id='LGD_ENCODING_RETURNURL' value='UTF-8' readonly><input type='hidden' name='LGD_OID' id='LGD_OID' value='2020041703638' readonly><input type='hidden' name='LGD_CLOSEDATE' id='LGD_CLOSEDATE' value='20200420235959' readonly><input type='hidden' name='LGD_RESPCODE' id='LGD_RESPCODE' value='' readonly><input type='hidden' name='LGD_AMOUNT' id='LGD_AMOUNT' value='25000' readonly><input type='hidden' name='LGD_MID' id='LGD_MID' value='talphamall1' readonly>",
	 * 		    "platForm": "test",
	 *		    "windowType": "iframe"
	 *	   }
     */
    
    @FrontBannerSkip()
    @RequestMapping(value="/cart/payment/ajaxPaymentGetPgApprovalValue")
    public JSON ajaxPaymentGetPgApprovalValue (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
    {
        JSON json = new JSON();
        // -- 사용자정보 전달
        User user = SessionsUser.getSessionUser(request);
        //User user = TestLoginSession.getTestSession();
        commandMap.put("user", user);
        
        // -- 세션정보
        String session_id = (String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id"))) ? request.getSession().getId() : request.getSession().getAttribute("seesion_cookie_id"));
        commandMap.put("session_id", session_id);
        
        // value 생성
        
        Map<String, Object> resultMap = paymentService.getPgApprovalValue(commandMap, request);
        
        json.put("setValue", StringUtil.getString(resultMap.get("setValue")));
        json.put("platForm", StringUtil.getString(resultMap.get("platForm")));
        json.put("windowType", StringUtil.getString(resultMap.get("windowType")));
        
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : paymentReqReturnPopup
     * 2. ClassName  : PaymentController.java
     * 3. Comment    : 프론트 > 주문/결제 > 결제요청 수신 Popup  
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2015. 6. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/pc/cart/paymentReqReturnPopup")
     public ModelAndView paymentReqReturnPopup (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
         // View page
         mv.setViewName("pc/cart/paymentReqReturnPopup");      
         
         mv.addObject("commandMap" ,commandMap);
         
         return mv;
     }
     
     /**
     * <pre>
     * 1. MethodName : paymentNoteRes
     * 2. ClassName  : PaymentController.java
     * 3. Comment    : 프론트 > 무통장입금 수신 
     * 4. 작성자       : jangsin
     * 5. 작성일       : 2015. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
     @RequestMapping(value="/pc/cart/paymentNoteRes")
     public ModelAndView paymentNoteRes (HttpServletRequest request, @RequestParams() Map<String, Object> commandMap) throws Exception
     {
         ModelAndView mv = new ModelAndView();
     
         logger.error("====================================================================");
         
         logger.error("===========================  무통장 입금  ==========================");
         
         // 무통장 할당 / 결제완료 /  결제취소
         Map<String, Object> pgMap = this.paymentService.payNoteRes(commandMap, request);
         
         String resultCode = StringUtil.getString(pgMap.get("resultCode"), "9999");
         String resultMSG = StringUtil.getString(pgMap.get("resultMSG"), "");
         
         
         if ("0000".equals(resultCode))
         {
             Map<String,Object> resultMap = new HashMap<String,Object>();
             
             // 주문 상태값 변경
             commandMap.put("PAY_MST_OID", StringUtil.getString(pgMap.get("PAY_MST_OID"), ""));
             commandMap.put("ORD_PRD_ORD_STATE", Code.OST_PAY);
             
             resultMap = this.orderService.updateOrderState(commandMap, request);
             
             logger.error("[ : pgMap : ]" + pgMap);
             
             int orderResult = Integer.valueOf(String.valueOf(resultMap.get("result")));
             
             if (orderResult > 0)
             {
                 resultMSG = "정상적으로 처리되었습니다.";
             }
             else
             {
                 resultMSG = "상점 DB처리 실패 (입금결과 수정 또는 주문상태값 변경 오류)";
                 logger.error("프론트 > 무통장입금 수신 : 주문상태값 변경 오류");
             }
         }
         
         // 계좌이체 Result String 
         mv.addObject("resultMSG", resultMSG);
         
         // View page
         mv.setViewName("/pc/cart/paymentNoteRes");
         
         logger.error("====================================================================");
         
         return mv;
     }
}
